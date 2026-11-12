import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/day_simulator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

void main() {
  const commands = CityCommands();
  const metrics = MetricsCalculator();

  test('a day closes with a report that explains the money', () {
    final start = newBaku();

    final result = const DaySimulator().advance(start);

    expect(result.state.day, 2);
    expect(result.report.day, 1);
    expect(result.report.ledger[LedgerItem.tickets], greaterThan(0));
    expect(result.report.ledger[LedgerItem.energy], lessThan(0));
    expect(result.state.budget, start.budget + result.report.operatingResult);
  });

  test('simulation is deterministic', () {
    expect(runDays(newBaku(), 40).state, runDays(newBaku(), 40).state);
  });

  test('an idle city survives its first month without warnings', () {
    final month = runDays(newBaku(), 30);

    expect(month.events.whereType<CrisisWarning>(), isEmpty);
    expect(month.state.budget, greaterThan(0));
    expect(month.events.whereType<BudgetAllocated>(), hasLength(1));
  });

  test('new buses arrive the next day and make passengers happier', () {
    var invested = newBaku();
    for (final district in DistrictId.values) {
      invested = applied(
        commands.buyBus(invested, model: BusModelId.cityRunner, district: district),
      );
    }

    final nextDay = const DaySimulator().advance(invested);
    final idle = runDays(newBaku(), 20).state;
    final active = runDays(invested, 20).state;

    expect(nextDay.events.whereType<BusesDelivered>().single.count, 6);
    expect(
      active.satisfaction[StakeholderGroup.passengers],
      greaterThan(idle.satisfaction[StakeholderGroup.passengers]! + 5),
    );
  });

  test('a road repair finishes after its duration and restores the road', () {
    final started = applied(
      commands.startProject(newBaku(), ProjectType.roadRepair, district: DistrictId.oilHarbor),
    );

    final done = runDays(started, 2);

    expect(done.state.projects, isEmpty);
    expect(done.state.stats.projectsCompleted, 1);
    expect(done.events.whereType<ProjectCompleted>().single.district, DistrictId.oilHarbor);
    expect(done.state.district(DistrictId.oilHarbor).roadCondition, greaterThan(99));
  });

  test('bike lanes jam traffic while built and relieve it once people ride', () {
    final city = newBaku();
    double congestion(CityState state) =>
        metrics.calculate(state).of(DistrictId.seasideBoulevard).congestion;
    final before = congestion(city);

    final building = applied(
      commands.startProject(city, ProjectType.bikeLanes, district: DistrictId.seasideBoulevard),
    );
    final adopted = runDays(building, 40).state;

    expect(congestion(building), greaterThan(before));
    expect(adopted.district(DistrictId.seasideBoulevard).hasBikeLanes, isTrue);
    expect(congestion(adopted), lessThan(congestion(runDays(city, 40).state)));
  });

  test('a long crisis brings three warnings and then dismissal', () {
    final unhappy = newBaku().copyWith(budget: -2000000);

    final crisis = runDays(unhappy, GameBalance.dismissalCrisisDays);

    expect(crisis.events.whereType<CrisisWarning>().map((warning) => warning.level), [1, 2, 3]);
    expect(crisis.events.last, isA<MinisterDismissed>());
    expect(crisis.state.crisis.dismissed, isTrue);
    expect(crisis.state.crisis.cause, CrisisCause.debt);
    expect(() => const DaySimulator().advance(crisis.state), throwsStateError);
  });

  test('gridlock is a crisis of its own and ends in dismissal', () {
    final city = newBaku();
    final jammed = city.copyWith(
      districts: [
        for (final district in city.districts)
          district.copyWith(population: district.population * 2, roadCondition: 10),
      ],
    );

    final firstDay = const DaySimulator().advance(jammed).state;
    final crisis = runDays(jammed, GameBalance.dismissalCrisisDays).state;

    expect(firstDay.crisis.cause, CrisisCause.gridlock);
    expect(crisis.crisis.dismissed, isTrue);
    expect(crisis.crisis.cause, CrisisCause.gridlock);
  });

  test('a loan is repaid in daily installments', () {
    final borrowed = applied(commands.takeLoan(newBaku(), 1000000));

    final repaid = runDays(borrowed, GameBalance.loanTermDays);

    expect(borrowed.budget, newBaku().budget + 1000000);
    expect(repaid.state.loan, isNull);
    expect(repaid.events.whereType<LoanRepaid>(), hasLength(1));
    expect(repaid.state.reports.last.ledger[LedgerItem.loanRepayment], -36000);
  });

  test('reports keep only the most recent month', () {
    final state = runDays(newBaku(), GameBalance.reportHistoryDays + 5).state;

    expect(state.reports, hasLength(GameBalance.reportHistoryDays));
    expect(state.reports.last.day, GameBalance.reportHistoryDays + 5);
  });
}
