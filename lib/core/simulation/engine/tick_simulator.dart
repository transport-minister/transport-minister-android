import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/city_goal.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/diplomacy_rules.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/catalog/population_rules.dart';
import 'package:transport_minister/core/simulation/engine/city_development.dart';
import 'package:transport_minister/core/simulation/engine/economy_calculator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/engine/satisfaction_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/simulation/model/district_state.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/metro_line.dart';
import 'package:transport_minister/core/simulation/model/project.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';
import 'package:transport_minister/core/simulation/model/tick_report.dart';

class TickResult {
  const TickResult({required this.state, required this.report, required this.events});

  final CityState state;
  final TickReport report;
  final List<CityEvent> events;
}

class TickSimulator {
  const TickSimulator({
    this.metrics = const MetricsCalculator(),
    this.economy = const EconomyCalculator(),
    this.satisfaction = const SatisfactionCalculator(),
    this.projects = const ProjectRules(),
    this.development = const CityDevelopment(),
  });

  final MetricsCalculator metrics;
  final EconomyCalculator economy;
  final SatisfactionCalculator satisfaction;
  final ProjectRules projects;
  final CityDevelopment development;

  TickResult advance(CityState state) {
    if (state.crisis.dismissed) {
      throw StateError('A dismissed minister cannot run the city.');
    }
    final events = <CityEvent>[];
    final now = metrics.calculate(state);
    final operating = economy.operatingLedger(state, now);
    final operatingTotal = operating.values.fold(0, (sum, amount) => sum + amount);
    final budget = state.budget + operatingTotal;
    final groups = satisfaction.smooth(state.satisfaction, satisfaction.targets(state, now));
    final overall = StakeholderGroup.overall(groups);
    final tick = state.tick + 1;
    final minuteClosed = tick % GameBalance.ticksPerMinute == 0;

    var next = state.copyWith(
      tick: tick,
      budget: budget,
      satisfaction: groups,
      diplomacyPoints:
          state.diplomacyPoints + (minuteClosed ? DiplomacyRules.perMinute(overall) : 0),
      districts: [for (final district in state.districts) _age(state, district, now)],
      fleet: [
        for (final bus in state.fleet)
          bus.isActiveAt(state.tick) ? bus.copyWith(ageSeconds: bus.ageSeconds + 1) : bus,
      ],
    );
    next = _progressProjects(next, events);
    next = _progressMetro(next, events);
    next = _repayLoan(next, events);
    next = next.copyWith(
      modifiers: [
        for (final modifier in next.modifiers)
          if (modifier.isPermanent)
            modifier
          else if (modifier.remainingSeconds > 1)
            modifier.copyWith(remainingSeconds: modifier.remainingSeconds - 1),
      ],
    );

    if (minuteClosed) {
      events.add(
        MinutePassed(
          tick ~/ GameBalance.ticksPerMinute,
          overall,
          tickets: (operating[LedgerItem.tickets] ?? 0) * GameBalance.ticksPerMinute,
        ),
      );
    }
    final crisis = _evaluateCrisis(next.crisis, _causeOf(overall, budget, now.congestion), events);
    final report = TickReport(
      tick: tick,
      ledger: _merge(state.pendingLedger, operating),
      riders: now.riders,
      demand: now.demand,
      satisfaction: overall,
      budget: budget,
    );
    final streak = operatingTotal >= 0 ? state.stats.positiveBudgetStreak + 1 : 0;
    next = next.copyWith(
      crisis: crisis,
      pendingLedger: const {},
      stats: next.stats.copyWith(
        positiveBudgetStreak: streak,
        bestPositiveBudgetStreak: math.max(streak, state.stats.bestPositiveBudgetStreak),
        totalRiders: state.stats.totalRiders + now.riders,
      ),
    );
    final completed = events.whereType<ProjectCompleted>().length;
    final opened = events.whereType<MetroLineOpened>().length;
    final (developed, levelEvents) = development.award(
      next,
      (minuteClosed
              ? CityLevels.minutePoints(satisfaction: overall, positive: operatingTotal >= 0)
              : 0) +
          completed * CityLevels.projectCompletionPoints +
          opened * CityLevels.metroOpeningPoints,
    );
    next = developed;
    events.addAll(levelEvents);
    if (!next.completed && CityGoal.isMet(next)) {
      next = next.copyWith(completed: true);
      events.add(const CityCompleted());
    }
    final delivered = next.fleet.where((bus) => bus.deliveryTick == tick).length;
    if (delivered > 0) {
      events.add(BusesDelivered(delivered));
    }
    return TickResult(state: next, report: report, events: events);
  }

  DistrictState _age(CityState state, DistrictState district, CityMetrics now) {
    final congestion = now.of(district.id).congestion;
    final decay =
        state.roadMaintenance.decayPerSecond + congestion * GameBalance.congestionRoadWear;
    final growth = PopulationRules.growthPerSecond(district, state.overallSatisfaction);
    return district.copyWith(
      roadCondition: math.max(district.roadCondition - decay, 0),
      population: district.population + growth,
      bikeAdoption: district.hasBikeLanes
          ? math.min(district.bikeAdoption + GameBalance.bikeAdoptionPerSecond, 1)
          : district.bikeAdoption,
    );
  }

  CityState _progressProjects(CityState state, List<CityEvent> events) {
    var next = state;
    final remaining = <Project>[];
    var completed = 0;
    for (final project in state.projects) {
      final left = project.remainingSeconds - 1;
      if (left > 0) {
        remaining.add(project.copyWith(remainingSeconds: left));
        continue;
      }
      next = projects.complete(next, project.type, project.districtId);
      events.add(ProjectCompleted(project.type, project.districtId));
      completed++;
    }
    return next.copyWith(
      projects: remaining,
      stats: next.stats.copyWith(projectsCompleted: next.stats.projectsCompleted + completed),
    );
  }

  CityState _progressMetro(CityState state, List<CityEvent> events) {
    final lines = <MetroLine>[];
    for (final line in state.metroLines) {
      if (line.isOpen) {
        lines.add(line);
        continue;
      }
      final dug = line.copyWith(remainingSeconds: line.remainingSeconds - 1);
      if (dug.isOpen) {
        events.add(MetroLineOpened(line.from, line.to));
      }
      lines.add(dug);
    }
    return state.copyWith(metroLines: lines);
  }

  CityState _repayLoan(CityState state, List<CityEvent> events) {
    final loan = state.loan;
    if (loan == null) {
      return state;
    }
    if (loan.remainingSeconds <= 1) {
      events.add(const LoanRepaid());
      return state.copyWith(loan: null);
    }
    return state.copyWith(loan: loan.copyWith(remainingSeconds: loan.remainingSeconds - 1));
  }

  CrisisCause? _causeOf(double satisfaction, int budget, double congestion) {
    if (congestion >= GameBalance.gridlockCongestion) {
      return CrisisCause.gridlock;
    }
    if (satisfaction < GameBalance.crisisSatisfactionThreshold) {
      return CrisisCause.unhappy;
    }
    return budget < GameBalance.crisisBudgetThreshold ? CrisisCause.debt : null;
  }

  CrisisState _evaluateCrisis(CrisisState crisis, CrisisCause? cause, List<CityEvent> events) {
    if (cause == null) {
      final seconds = math.max(crisis.seconds - 1, 0);
      if (seconds == 0 && crisis.warnings > 0) {
        events.add(const CrisisAverted());
      }
      return seconds == 0 ? const CrisisState() : crisis.copyWith(seconds: seconds);
    }
    final seconds = crisis.seconds + 1;
    if (seconds >= GameBalance.dismissalCrisisSeconds) {
      events.add(const MinisterDismissed());
      return crisis.copyWith(seconds: seconds, dismissed: true, cause: cause);
    }
    final level = GameBalance.crisisWarningSeconds.indexOf(seconds) + 1;
    if (level > crisis.warnings) {
      events.add(CrisisWarning(level));
      return crisis.copyWith(seconds: seconds, warnings: level, cause: cause);
    }
    return crisis.copyWith(seconds: seconds, cause: cause);
  }

  Map<LedgerItem, int> _merge(Map<LedgerItem, int> first, Map<LedgerItem, int> second) {
    final merged = {...first};
    second.forEach((item, amount) => merged[item] = (merged[item] ?? 0) + amount);
    return merged;
  }
}
