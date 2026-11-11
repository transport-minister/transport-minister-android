import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/engine/bus_performance.dart';
import 'package:transport_minister/core/simulation/engine/city_development.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/loan.dart';
import 'package:transport_minister/core/simulation/model/project.dart';
import 'package:transport_minister/core/simulation/model/road_maintenance_level.dart';

class CityCommands {
  const CityCommands({
    this.projects = const ProjectRules(),
    this.development = const CityDevelopment(),
  });

  final ProjectRules projects;
  final CityDevelopment development;

  CommandOutcome buyBus(
    CityState state, {
    required BusModelId model,
    required DistrictId district,
    int? price,
  }) {
    final cost = price ?? model.spec.price;
    if (state.fleet.length >= state.depotCapacity) {
      return const CommandRejected(RejectionReason.depotFull);
    }
    if (model.spec.electric && !state.hasChargingDepot) {
      return const CommandRejected(RejectionReason.requiresChargingDepot);
    }
    if (state.budget < cost) {
      return const CommandRejected(RejectionReason.insufficientFunds);
    }
    final bus = Bus(
      id: state.nextId,
      model: model,
      districtId: district,
      deliveryDay: state.day + GameBalance.busDeliveryDays,
    );
    final (developed, levelEvents) = development.award(
      _record(state, LedgerItem.vehiclePurchases, -cost).copyWith(
        fleet: [...state.fleet, bus],
        nextId: state.nextId + 1,
        stats: state.stats.copyWith(busesBought: state.stats.busesBought + 1),
      ),
      CityLevels.busPurchasePoints,
    );
    return CommandApplied(developed, events: [BusPurchased(model, district), ...levelEvents]);
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

  CommandOutcome upgradeBus(CityState state, int busId) {
    final bus = _bus(state, busId);
    if (bus == null || !bus.isActiveOn(state.day)) {
      return const CommandRejected(RejectionReason.invalidTarget);
    }
    if (bus.level >= BusUpgrades.maxLevel) {
      return const CommandRejected(RejectionReason.maxLevelReached);
    }
    final level = bus.level + 1;
    final cost = BusUpgrades.costToReach(bus.model, level);
    if (state.budget < cost) {
      return const CommandRejected(RejectionReason.insufficientFunds);
    }
    final (developed, levelEvents) = development.award(
      _record(state, LedgerItem.vehicleUpgrades, -cost).copyWith(
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
