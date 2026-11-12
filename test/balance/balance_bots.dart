import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_desk.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';

abstract interface class BalanceBot {
  String get name;

  CityState play(CityState city);
}

class IdleBot implements BalanceBot {
  const IdleBot();

  @override
  String get name => 'idle';

  @override
  CityState play(CityState city) => city;
}

class BusOnlyBot implements BalanceBot {
  const BusOnlyBot();

  static const _commands = CityCommands();

  @override
  String get name => 'buses only';

  @override
  CityState play(CityState city) {
    var current = city;
    for (var bought = 0; bought < 3; bought++) {
      final metrics = const MetricsCalculator().calculate(current);
      final district = metrics.districts
          .reduce((a, b) => b.serviceRatio < a.serviceRatio ? b : a)
          .id;
      final next = _applied(
        _commands.buyBus(current, model: BusModelId.cityRunner, district: district),
      );
      if (next == null) {
        break;
      }
      current = next;
    }
    return current;
  }
}

class CasualBot implements BalanceBot {
  const CasualBot({this.every = 3});

  final int every;

  @override
  String get name => 'casual';

  @override
  CityState play(CityState city) => city.day % every == 0 ? const PlannerBot().play(city) : city;
}

class PlannerBot implements BalanceBot {
  const PlannerBot();

  static const _commands = CityCommands();
  static const _desk = DecisionDesk();
  static const _rules = ProjectRules();
  static const _metrics = MetricsCalculator();
  static const _maxActions = 6;
  static const _reserve = 40000;
  static const _busyCongestion = 45.0;

  @override
  String get name => 'planner';

  @override
  CityState play(CityState city) {
    var current = _decide(city);
    for (var action = 0; action < _maxActions; action++) {
      final next = _nextMove(current);
      if (next == null) {
        break;
      }
      current = next;
    }
    return current;
  }

  CityState _decide(CityState city) {
    var current = city;
    for (final decision in city.decisions) {
      final choices = _desk.choices(current, decision);
      var best = -1;
      for (var index = 0; index < choices.length; index++) {
        final choice = choices[index];
        if (!choice.available) {
          continue;
        }
        if (best < 0 || _better(choice, choices[best])) {
          best = index;
        }
      }
      if (best >= 0) {
        current = _applied(_desk.choose(current, decision.id, best)) ?? current;
      }
    }
    return current;
  }

  bool _better(DecisionChoice candidate, DecisionChoice current) {
    if (candidate.diplomacy != current.diplomacy) {
      return candidate.diplomacy > current.diplomacy;
    }
    return candidate.cost < current.cost;
  }

  CityState? _nextMove(CityState city) {
    final metrics = _metrics.calculate(city);
    final urgent =
        _repairRoads(city) ?? _expandDepot(city) ?? _addBuses(city, metrics, belowRatio: 0.9);
    if (urgent != null) {
      return urgent;
    }
    for (final target in _targets(city, metrics)) {
      switch (target(city)) {
        case CommandApplied(:final state):
          return state.budget >= _reserve ? state : null;
        case CommandRejected(reason: RejectionReason.insufficientFunds):
          return null;
        case CommandRejected():
          continue;
      }
    }
    return _addBuses(city, metrics, belowRatio: 1.1) ?? _upgradeBus(city);
  }

  List<CommandOutcome Function(CityState)> _targets(CityState city, CityMetrics metrics) {
    final technologies =
        TechnologyId.values
            .where(
              (technology) =>
                  !city.technologies.contains(technology) && city.has(technology.requires),
            )
            .toList()
          ..sort((a, b) => a.money.compareTo(b.money));
    final busy =
        metrics.districts.where((district) => district.congestion > _busyCongestion).toList()
          ..sort((a, b) => b.congestion.compareTo(a.congestion));
    final pairs = [...DistrictLinks.all]
      ..sort(
        (a, b) => (metrics.of(b.$1).congestion + metrics.of(b.$2).congestion).compareTo(
          metrics.of(a.$1).congestion + metrics.of(a.$2).congestion,
        ),
      );
    return [
      for (final technology in technologies)
        if (city.diplomacyPoints >= technology.diplomacy)
          (city) => _commands.unlockTechnology(city, technology),
      if (city.has(TechnologyId.electricContract) && !city.hasChargingDepot)
        (city) => _commands.startProject(city, ProjectType.chargingDepot),
      if (city.has(TechnologyId.metroContract))
        for (final (from, to) in pairs)
          if (_commands.metroProblem(city, from, to) case null || RejectionReason.insufficientFunds)
            (city) => _commands.buildMetroLine(city, from, to),
      for (final district in busy)
        for (final type in const [
          ProjectType.smartSignals,
          ProjectType.bikeLanes,
          ProjectType.modernStops,
          ProjectType.roadExpansion,
        ])
          if (_rules.validate(city, type, district: district.id)
              case null || RejectionReason.insufficientFunds)
            (city) => _commands.startProject(city, type, district: district.id),
      if (_bestModel(city) != BusModelId.cityRunner)
        for (final bus in _veterans(city).take(1)) (city) => _replace(city, bus.id, bus.districtId),
    ];
  }

  List<Bus> _veterans(CityState city) =>
      city.activeBuses.where((bus) => bus.model == BusModelId.veteran).toList()
        ..sort((a, b) => b.ageDays.compareTo(a.ageDays));

  CommandOutcome _replace(CityState city, int busId, DistrictId district) {
    return switch (_commands.sellBus(city, busId)) {
      CommandApplied(:final state) => _commands.buyBus(
        state,
        model: _bestModel(state),
        district: district,
      ),
      final CommandRejected rejection => rejection,
    };
  }

  CityState? _affordable(CityState city, CommandOutcome outcome) {
    final next = _applied(outcome);
    if (next == null || next.budget < _reserve) {
      return null;
    }
    return next;
  }

  CityState? _repairRoads(CityState city) {
    final worn = city.districts.where((district) => district.roadCondition < 60).toList()
      ..sort((a, b) => a.roadCondition.compareTo(b.roadCondition));
    for (final district in worn) {
      final next = _affordable(
        city,
        _commands.startProject(city, ProjectType.roadRepair, district: district.id),
      );
      if (next != null) {
        return next;
      }
    }
    return null;
  }

  CityState? _expandDepot(CityState city) {
    if (city.fleet.length < city.depotCapacity - 2) {
      return null;
    }
    return _affordable(city, _commands.startProject(city, ProjectType.depotExpansion));
  }

  BusModelId _bestModel(CityState city) {
    if (city.hasChargingDepot && city.has(TechnologyId.electricContract)) {
      return BusModelId.voltaE;
    }
    return city.has(TechnologyId.articulatedContract) ? BusModelId.megaLink : BusModelId.cityRunner;
  }

  CityState? _addBuses(CityState city, CityMetrics metrics, {required double belowRatio}) {
    final starved =
        metrics.districts.where((district) => district.serviceRatio < belowRatio).toList()
          ..sort((a, b) => a.serviceRatio.compareTo(b.serviceRatio));
    for (final district in starved) {
      final next = _affordable(
        city,
        _commands.buyBus(city, model: _bestModel(city), district: district.id),
      );
      if (next != null) {
        return next;
      }
    }
    return null;
  }

  CityState? _upgradeBus(CityState city) {
    final ready =
        city.activeBuses.where((bus) => _commands.upgradeProblem(city, bus) == null).toList()
          ..sort((a, b) => a.level.compareTo(b.level));
    for (final bus in ready) {
      final next = _affordable(city, _commands.upgradeBus(city, bus.id));
      if (next != null) {
        return next;
      }
    }
    return null;
  }
}

CityState? _applied(CommandOutcome outcome) => switch (outcome) {
  CommandApplied(:final state) => state,
  CommandRejected() => null,
};
