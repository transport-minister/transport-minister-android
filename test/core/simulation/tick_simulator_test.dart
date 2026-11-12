import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/tick_simulator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

void main() {
  const commands = CityCommands();
  const metrics = MetricsCalculator();

  test('every second closes with a report that explains the money', () {
    final start = newBaku();

    final result = const TickSimulator().advance(start);

    expect(result.state.tick, 1);
    expect(result.report.tick, 1);
    expect(result.report.ledger[LedgerItem.tickets], greaterThan(0));
    expect(result.report.ledger[LedgerItem.energy], lessThan(0));
    expect(result.state.budget, start.budget + result.report.operatingResult);
  });

  test('simulation is deterministic', () {
    expect(runSeconds(newBaku(), 1200).state, runSeconds(newBaku(), 1200).state);
  });

  test('an idle city survives its first fifteen minutes without warnings', () {
    final month = runSeconds(newBaku(budget: 0), 900);

    expect(month.events.whereType<CrisisWarning>(), isEmpty);
    expect(month.state.budget, greaterThan(0));
  });

  test('the Cabinet pays every second and pays more to a happy city', () {
    final city = newBaku(budget: 0);
    final happy = city.copyWith(
      satisfaction: {for (final group in StakeholderGroup.values) group: 80},
    );

    final day = const TickSimulator().advance(city);
    final happyDay = const TickSimulator().advance(happy);

    expect(day.report.ledger[LedgerItem.governmentBudget], greaterThan(0));
    expect(day.state.budget, greaterThan(0));
    expect(
      happyDay.report.ledger[LedgerItem.governmentBudget],
      greaterThan(day.report.ledger[LedgerItem.governmentBudget]!),
    );
  });

  test('new buses arrive after a few seconds and make passengers happier', () {
    var invested = newBaku();
    for (final district in DistrictId.values) {
      invested = applied(
        commands.buyBus(invested, model: BusModelId.cityRunner, district: district),
      );
    }

    final delivery = runSeconds(invested, GameBalance.busDeliverySeconds);
    final idle = runSeconds(newBaku(), 600).state;
    final active = runSeconds(invested, 600).state;

    expect(delivery.events.whereType<BusesDelivered>().single.count, 6);
    expect(
      active.satisfaction[StakeholderGroup.passengers],
      greaterThan(idle.satisfaction[StakeholderGroup.passengers]! + 5),
    );
  });

  test('a road repair finishes after its duration and restores the road', () {
    final started = applied(
      commands.startProject(newBaku(), ProjectType.roadRepair, district: DistrictId.oilHarbor),
    );

    final done = runSeconds(started, 60);

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
    final adopted = runSeconds(building, 1200).state;

    expect(congestion(building), greaterThan(before));
    expect(adopted.district(DistrictId.seasideBoulevard).hasBikeLanes, isTrue);
    expect(congestion(adopted), lessThan(congestion(runSeconds(city, 1200).state)));
  });

  test('a long crisis brings three warnings and then dismissal', () {
    final unhappy = newBaku().copyWith(budget: -2000000);

    final crisis = runSeconds(unhappy, GameBalance.dismissalCrisisSeconds);

    expect(crisis.events.whereType<CrisisWarning>().map((warning) => warning.level), [1, 2, 3]);
    expect(crisis.events.whereType<MinisterDismissed>(), hasLength(1));
    expect(crisis.state.crisis.dismissed, isTrue);
    expect(crisis.state.crisis.cause, CrisisCause.debt);
    expect(() => const TickSimulator().advance(crisis.state), throwsStateError);
  });

  test('gridlock is a crisis of its own and ends in dismissal', () {
    final city = newBaku();
    final jammed = city.copyWith(
      districts: [
        for (final district in city.districts)
          district.copyWith(population: district.population * 2, roadCondition: 10),
      ],
    );

    final firstDay = const TickSimulator().advance(jammed).state;
    final crisis = runSeconds(jammed, GameBalance.dismissalCrisisSeconds).state;

    expect(firstDay.crisis.cause, CrisisCause.gridlock);
    expect(crisis.crisis.dismissed, isTrue);
    expect(crisis.crisis.cause, CrisisCause.gridlock);
  });

  test('a loan is repaid in installments every second', () {
    final borrowed = applied(commands.takeLoan(newBaku(), 1000000));

    final almost = runSeconds(borrowed, GameBalance.loanTermSeconds - 1);
    final last = const TickSimulator().advance(almost.state);

    expect(borrowed.budget, newBaku().budget + 1000000);
    expect(last.report.ledger[LedgerItem.loanRepayment], -1200);
    expect(last.state.loan, isNull);
    expect([...almost.events, ...last.events].whereType<LoanRepaid>(), hasLength(1));
  });

  test('a minute passes every sixty seconds', () {
    final minutes = runSeconds(newBaku(), 180).events.whereType<MinutePassed>();

    expect(minutes.map((minute) => minute.minute), [1, 2, 3]);
    expect(minutes.first.tickets, greaterThan(0));
  });
}
