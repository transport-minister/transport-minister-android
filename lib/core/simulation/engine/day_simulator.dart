import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/engine/city_development.dart';
import 'package:transport_minister/core/simulation/engine/economy_calculator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/engine/satisfaction_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/simulation/model/daily_report.dart';
import 'package:transport_minister/core/simulation/model/district_state.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/project.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

class DayResult {
  const DayResult({required this.state, required this.report, required this.events});

  final CityState state;
  final DailyReport report;
  final List<CityEvent> events;
}

class DaySimulator {
  const DaySimulator({
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

  DayResult advance(CityState state) {
    if (state.crisis.dismissed) {
      throw StateError('A dismissed minister cannot run the city.');
    }
    final events = <CityEvent>[];
    final today = metrics.calculate(state);
    final operating = economy.operatingLedger(state, today);
    if (state.day % GameBalance.monthLengthDays == 0) {
      final allocation = economy.monthlyAllocation(state.overallSatisfaction);
      operating[LedgerItem.governmentBudget] = allocation;
      events.add(BudgetAllocated(allocation));
    }
    final operatingTotal = operating.values.fold(0, (sum, amount) => sum + amount);
    final budget = state.budget + operatingTotal;
    final groups = satisfaction.smooth(state.satisfaction, satisfaction.targets(state, today));

    var next = state.copyWith(
      budget: budget,
      satisfaction: groups,
      districts: [for (final district in state.districts) _age(state, district, today)],
      fleet: [
        for (final bus in state.fleet)
          bus.isActiveOn(state.day) ? bus.copyWith(ageDays: bus.ageDays + 1) : bus,
      ],
    );
    next = _progressProjects(next, events);
    next = _repayLoan(next, events);
    next = next.copyWith(
      modifiers: [
        for (final modifier in next.modifiers)
          if (modifier.isPermanent)
            modifier
          else if (modifier.remainingDays > 1)
            modifier.copyWith(remainingDays: modifier.remainingDays - 1),
      ],
    );

    final overall = StakeholderGroup.overall(groups);
    events.add(DayClosed(state.day, overall, tickets: operating[LedgerItem.tickets] ?? 0));
    final crisis = _evaluateCrisis(next.crisis, overall, budget, events);
    final report = DailyReport(
      day: state.day,
      ledger: _merge(state.pendingLedger, operating),
      riders: today.riders,
      demand: today.demand,
      satisfaction: overall,
      budget: budget,
    );
    final streak = operatingTotal >= 0 ? state.stats.positiveBudgetStreak + 1 : 0;
    final reports = [...state.reports, report];
    next = next.copyWith(
      day: state.day + 1,
      crisis: crisis,
      pendingLedger: const {},
      reports: reports.length > GameBalance.reportHistoryDays
          ? reports.sublist(reports.length - GameBalance.reportHistoryDays)
          : reports,
      stats: next.stats.copyWith(
        positiveBudgetStreak: streak,
        bestPositiveBudgetStreak: math.max(streak, state.stats.bestPositiveBudgetStreak),
        totalRiders: state.stats.totalRiders + today.riders,
      ),
    );
    final completed = events.whereType<ProjectCompleted>().length;
    final (developed, levelEvents) = development.award(
      next,
      CityLevels.dailyPoints(satisfaction: overall, positiveDay: operatingTotal >= 0) +
          completed * CityLevels.projectCompletionPoints,
    );
    next = developed;
    events.addAll(levelEvents);
    final delivered = next.fleet.where((bus) => bus.deliveryDay == next.day).length;
    if (delivered > 0) {
      events.add(BusesDelivered(delivered));
    }
    return DayResult(state: next, report: report, events: events);
  }

  DistrictState _age(CityState state, DistrictState district, CityMetrics today) {
    final congestion = today.of(district.id).congestion;
    final decay = state.roadMaintenance.decayPerDay + congestion * GameBalance.congestionRoadWear;
    final growth = district.id == DistrictId.caspianGardens
        ? (district.population * GameBalance.caspianGardensGrowthPerDay).round()
        : 0;
    return district.copyWith(
      roadCondition: math.max(district.roadCondition - decay, 0),
      population: district.population + growth,
      bikeAdoption: district.hasBikeLanes
          ? math.min(district.bikeAdoption + GameBalance.bikeAdoptionPerDay, 1)
          : district.bikeAdoption,
    );
  }

  CityState _progressProjects(CityState state, List<CityEvent> events) {
    var next = state;
    final remaining = <Project>[];
    var completed = 0;
    for (final project in state.projects) {
      final left = project.remainingDays - 1;
      if (left > 0) {
        remaining.add(project.copyWith(remainingDays: left));
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

  CityState _repayLoan(CityState state, List<CityEvent> events) {
    final loan = state.loan;
    if (loan == null) {
      return state;
    }
    if (loan.remainingDays <= 1) {
      events.add(const LoanRepaid());
      return state.copyWith(loan: null);
    }
    return state.copyWith(loan: loan.copyWith(remainingDays: loan.remainingDays - 1));
  }

  CrisisState _evaluateCrisis(
    CrisisState crisis,
    double satisfaction,
    int budget,
    List<CityEvent> events,
  ) {
    final inCrisis =
        satisfaction < GameBalance.crisisSatisfactionThreshold ||
        budget < GameBalance.crisisBudgetThreshold;
    if (!inCrisis) {
      final days = math.max(crisis.days - 1, 0);
      if (days == 0 && crisis.warnings > 0) {
        events.add(const CrisisAverted());
      }
      return crisis.copyWith(days: days, warnings: days == 0 ? 0 : crisis.warnings);
    }
    final days = crisis.days + 1;
    if (days >= GameBalance.dismissalCrisisDays) {
      events.add(const MinisterDismissed());
      return crisis.copyWith(days: days, dismissed: true);
    }
    final level = GameBalance.crisisWarningDays.indexOf(days) + 1;
    if (level > crisis.warnings) {
      events.add(CrisisWarning(level));
      return crisis.copyWith(days: days, warnings: level);
    }
    return crisis.copyWith(days: days);
  }

  Map<LedgerItem, int> _merge(Map<LedgerItem, int> first, Map<LedgerItem, int> second) {
    final merged = {...first};
    second.forEach((item, amount) => merged[item] = (merged[item] ?? 0) + amount);
    return merged;
  }
}
