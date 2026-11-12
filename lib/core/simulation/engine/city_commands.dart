import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/catalog/metro_rules.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/bus_performance.dart';
import 'package:transport_minister/core/simulation/engine/city_development.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/loan.dart';
import 'package:transport_minister/core/simulation/model/metro_line.dart';
import 'package:transport_minister/core/simulation/model/project.dart';
import 'package:transport_minister/core/simulation/model/road_maintenance_level.dart';

class CityCommands {
  const CityCommands({
    this.projects = const ProjectRules(),
    this.development = const CityDevelopment(),
  });

  final ProjectRules projects;
  final CityDevelopment development;

  RejectionReason? purchaseProblem(CityState state, BusModelId model, {int count = 1, int? price}) {
    if (count < 1) {
      return RejectionReason.invalidTarget;
    }
    if (!state.has(TechnologyId.forModel(model))) {
      return RejectionReason.locked;
    }
    if (state.fleet.length + count > state.depotCapacity) {
      return RejectionReason.depotFull;
    }
    if (model.spec.electric && !state.hasChargingDepot) {
      return RejectionReason.requiresChargingDepot;
    }
    if (state.budget < (price ?? model.spec.price) * count) {
      return RejectionReason.insufficientFunds;
    }
    return null;
  }

  CommandOutcome buyBus(
    CityState state, {
    required BusModelId model,
    required DistrictId district,
    int? price,
  }) {
    final problem = purchaseProblem(state, model, price: price);
    if (problem != null) {
      return CommandRejected(problem);
    }
    final bus = Bus(
      id: state.nextId,
      model: model,
      districtId: district,
      deliveryDay: state.day + GameBalance.busDeliveryDays,
    );
    final (developed, levelEvents) = development.award(
      _record(state, LedgerItem.vehiclePurchases, -(price ?? model.spec.price)).copyWith(
        fleet: [...state.fleet, bus],
        nextId: state.nextId + 1,
        stats: state.stats.copyWith(busesBought: state.stats.busesBought + 1),
      ),
      CityLevels.busPurchasePoints,
    );
    return CommandApplied(developed, events: [BusPurchased(model, district), ...levelEvents]);
  }

  CommandOutcome buyBuses(
    CityState state, {
    required BusModelId model,
    required DistrictId district,
    required int count,
  }) {
    final problem = purchaseProblem(state, model, count: count);
    if (problem != null) {
      return CommandRejected(problem);
    }
    var current = state;
    final levelEvents = <CityEvent>[];
    for (var bought = 0; bought < count; bought++) {
      switch (buyBus(current, model: model, district: district)) {
        case CommandApplied(state: final next, :final events):
          current = next;
          levelEvents.addAll(events.where((event) => event is! BusPurchased));
        case final CommandRejected rejection:
          return rejection;
      }
    }
    return CommandApplied(
      current,
      events: [
        BusPurchased(model, district, count: count),
        ...levelEvents,
      ],
    );
  }

  CommandOutcome sellBus(CityState state, int busId) {
    final bus = _bus(state, busId);
    if (bus == null) {
      return const CommandRejected(RejectionReason.invalidTarget);
    }
    return CommandApplied(
      _record(state, LedgerItem.vehicleSales, BusPerformance.resaleValue(bus)).copyWith(
        fleet: [
          for (final other in state.fleet)
            if (other.id != busId) other,
        ],
        stats: state.stats.copyWith(busesSold: state.stats.busesSold + 1),
      ),
    );
  }

  RejectionReason? upgradeProblem(CityState state, Bus bus) {
    if (!bus.isActiveOn(state.day)) {
      return RejectionReason.invalidTarget;
    }
    if (bus.level >= BusUpgrades.maxLevel) {
      return RejectionReason.maxLevelReached;
    }
    if (!state.has(TechnologyId.forUpgradeLevel(bus.level + 1))) {
      return RejectionReason.locked;
    }
    if (state.budget < BusUpgrades.costToReach(bus.model, bus.level + 1)) {
      return RejectionReason.insufficientFunds;
    }
    return null;
  }

  CommandOutcome upgradeBus(CityState state, int busId) {
    final bus = _bus(state, busId);
    if (bus == null) {
      return const CommandRejected(RejectionReason.invalidTarget);
    }
    final problem = upgradeProblem(state, bus);
    if (problem != null) {
      return CommandRejected(problem);
    }
    final level = bus.level + 1;
    final (developed, levelEvents) = development.award(
      _record(
        state,
        LedgerItem.vehicleUpgrades,
        -BusUpgrades.costToReach(bus.model, level),
      ).copyWith(
        fleet: [
          for (final other in state.fleet) other.id == busId ? other.copyWith(level: level) : other,
        ],
        stats: state.stats.copyWith(busUpgrades: state.stats.busUpgrades + 1),
      ),
      CityLevels.busUpgradePoints,
    );
    return CommandApplied(developed, events: [BusUpgraded(bus.model, level), ...levelEvents]);
  }

  CommandOutcome reassignBus(CityState state, int busId, DistrictId district) {
    if (_bus(state, busId) == null) {
      return const CommandRejected(RejectionReason.invalidTarget);
    }
    return CommandApplied(
      state.copyWith(
        fleet: [
          for (final bus in state.fleet) bus.id == busId ? bus.copyWith(districtId: district) : bus,
        ],
      ),
    );
  }

  CommandOutcome setFare(CityState state, int fare) {
    final valid =
        fare >= GameBalance.minFare &&
        fare <= GameBalance.maxFare &&
        fare % GameBalance.fareStep == 0;
    if (!valid) {
      return const CommandRejected(RejectionReason.fareOutOfRange);
    }
    return CommandApplied(state.copyWith(fare: fare));
  }

  CommandOutcome startProject(CityState state, ProjectType type, {DistrictId? district}) {
    final rejection = projects.validate(state, type, district: district);
    if (rejection != null) {
      return CommandRejected(rejection);
    }
    final days = projects.duration(state, type, district: district);
    final project = Project(
      id: state.nextId,
      type: type,
      districtId: district,
      totalDays: days,
      remainingDays: days,
    );
    return CommandApplied(
      _record(
        state,
        LedgerItem.construction,
        -projects.cost(state, type, district: district),
      ).copyWith(projects: [...state.projects, project], nextId: state.nextId + 1),
      events: [ProjectStarted(type, district)],
    );
  }

  RejectionReason? metroProblem(CityState state, DistrictId from, DistrictId to) {
    if (!DistrictLinks.areNeighbours(from, to)) {
      return RejectionReason.invalidTarget;
    }
    if (!state.has(TechnologyId.metroContract)) {
      return RejectionReason.locked;
    }
    if (state.metroLines.any((line) => line.joins(from, to))) {
      return RejectionReason.alreadyBuilt;
    }
    if (state.metroLines.any((line) => !line.isOpen)) {
      return RejectionReason.tunnelBusy;
    }
    if (state.budget < MetroRules.buildCost) {
      return RejectionReason.insufficientFunds;
    }
    return null;
  }

  CommandOutcome buildMetroLine(CityState state, DistrictId from, DistrictId to) {
    final problem = metroProblem(state, from, to);
    if (problem != null) {
      return CommandRejected(problem);
    }
    final line = MetroLine(
      from: from,
      to: to,
      totalDays: MetroRules.buildDays,
      remainingDays: MetroRules.buildDays,
    );
    return CommandApplied(
      _record(
        state,
        LedgerItem.construction,
        -MetroRules.buildCost,
      ).copyWith(metroLines: [...state.metroLines, line]),
      events: [MetroLineStarted(from, to)],
    );
  }

  CommandOutcome takeLoan(CityState state, int amount) {
    if (state.loan != null) {
      return const CommandRejected(RejectionReason.loanActive);
    }
    if (!GameBalance.loanOptions.contains(amount)) {
      return const CommandRejected(RejectionReason.invalidTarget);
    }
    final installment = (amount * (1 + GameBalance.loanInterest) / GameBalance.loanTermDays)
        .round();
    return CommandApplied(
      _record(state, LedgerItem.loanReceived, amount).copyWith(
        loan: Loan(
          principal: amount,
          dailyInstallment: installment,
          remainingDays: GameBalance.loanTermDays,
        ),
      ),
    );
  }

  CommandOutcome unlockTechnology(CityState state, TechnologyId technology) {
    final rejection = technologyProblem(state, technology);
    if (rejection != null) {
      return CommandRejected(rejection);
    }
    final perk = _perkOf(technology);
    return CommandApplied(
      _record(state, LedgerItem.technology, -technology.money).copyWith(
        diplomacyPoints: state.diplomacyPoints - technology.diplomacy,
        technologies: {...state.technologies, technology},
        modifiers: [...state.modifiers, ?perk],
      ),
      events: [TechnologyUnlocked(technology)],
    );
  }

  RejectionReason? technologyProblem(CityState state, TechnologyId technology) {
    if (state.technologies.contains(technology)) {
      return RejectionReason.alreadyUnlocked;
    }
    if (!state.has(technology.requires)) {
      return RejectionReason.locked;
    }
    if (state.budget < technology.money) {
      return RejectionReason.insufficientFunds;
    }
    if (state.diplomacyPoints < technology.diplomacy) {
      return RejectionReason.insufficientDiplomacy;
    }
    return null;
  }

  ActiveModifier? _perkOf(TechnologyId technology) {
    final (type, value) = switch (technology) {
      TechnologyId.smartTicketing => (ModifierType.ticketRevenue, 1.08),
      TechnologyId.ecoDriving => (ModifierType.energyCost, 0.9),
      TechnologyId.depotRobotics => (ModifierType.maintenanceCost, 0.85),
      _ => (null, 0.0),
    };
    if (type == null) {
      return null;
    }
    return ActiveModifier(type: type, value: value, remainingDays: ActiveModifier.permanent);
  }

  CommandOutcome grantReward(CityState state, int amount) {
    if (amount <= 0) {
      return const CommandRejected(RejectionReason.invalidTarget);
    }
    return CommandApplied(
      _record(state, LedgerItem.rewards, amount),
      events: [RewardGranted(amount)],
    );
  }

  CommandOutcome setRoadMaintenance(CityState state, RoadMaintenanceLevel level) {
    return CommandApplied(state.copyWith(roadMaintenance: level));
  }

  Bus? _bus(CityState state, int busId) {
    for (final bus in state.fleet) {
      if (bus.id == busId) {
        return bus;
      }
    }
    return null;
  }

  CityState _record(CityState state, LedgerItem item, int amount) {
    return state.copyWith(
      budget: state.budget + amount,
      pendingLedger: {...state.pendingLedger, item: (state.pendingLedger[item] ?? 0) + amount},
    );
  }
}
