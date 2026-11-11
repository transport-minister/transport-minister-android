import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_desk.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effects.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/engine/city_day_runner.dart';
import 'package:transport_minister/core/simulation/engine/economy_calculator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';
import 'package:transport_minister/core/simulation/model/pending_decision.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

CityState _withDecision(CityState city, DecisionId id, {DistrictId? district, int expires = 4}) {
  return city.copyWith(
    decisions: [
      PendingDecision(
        id: 900,
        template: id,
        district: district,
        createdDay: city.day,
        expiresDay: expires,
      ),
    ],
  );
}

void main() {
  const desk = DecisionDesk();

  test('every default answer is free so time can always decide', () {
    final context = desk.context(newBaku());
    for (final template in DecisionCatalog.all) {
      final options = template.options(context, DistrictId.windHeights);
      expect(options.length, greaterThanOrEqualTo(2), reason: template.id.name);
      expect(
        const DecisionEffects().cost(context.city, options.last.effects),
        0,
        reason: template.id.name,
      );
    }
  });

  test('options are checked against budget and depot space', () {
    final city = _withDecision(
      newBaku().copyWith(budget: 100000),
      DecisionId.overcrowdedBuses,
      district: DistrictId.oilHarbor,
    );
    final crowdedDepot = _withDecision(
      newBaku().copyWith(depotCapacity: 25),
      DecisionId.overcrowdedBuses,
      district: DistrictId.oilHarbor,
    );

    expect(desk.choices(city, city.decisions.single).first.problems, [
      RejectionReason.insufficientFunds,
    ]);
    expect(
      desk.choices(crowdedDepot, crowdedDepot.decisions.single).first.problems,
      contains(RejectionReason.depotFull),
    );
    expect(rejected(desk.choose(city, 900, 0)), RejectionReason.insufficientFunds);
  });

  test('choosing applies the consequences and files the decision', () {
    final city = _withDecision(newBaku(), DecisionId.driverWages);

    final outcome = desk.choose(city, 900, 1);
    final after = applied(outcome);

    expect(after.budget, city.budget - 60000);
    expect(
      after.satisfaction[StakeholderGroup.transportWorkers],
      closeTo(city.satisfaction[StakeholderGroup.transportWorkers]! + 8, 0.001),
    );
    expect(after.decisions, isEmpty);
    expect(after.decisionLog.single.option, 1);
    expect(after.developmentPoints, DecisionDesk.decisionPoints);
    expect(
      (outcome as CommandApplied).events.whereType<DecisionResolved>().single.automatic,
      isFalse,
    );
  });

  test('risks roll the same way for the same situation', () {
    final city = _withDecision(newBaku(), DecisionId.driverWages);
    final decision = city.decisions.single;
    final risk = desk.choices(city, decision).last.option.risk!;

    final first = desk.rollsRisk(city, decision, 2, risk);

    expect(desk.rollsRisk(city, decision, 2, risk), first);
  });

  test('ignored decisions are settled with the default answer', () {
    final city = _withDecision(newBaku(), DecisionId.festival, expires: 1).copyWith(day: 2);

    final (after, events) = desk.onNewDay(city);

    expect(after.decisions.where((decision) => decision.id == 900), isEmpty);
    expect(events.whereType<DecisionResolved>().first.automatic, isTrue);
    expect(after.decisionLog.single.option, 2);
  });

  test('news keeps coming but never piles up beyond three', () {
    var city = newBaku();
    final arrivals = <DecisionArrived>[];
    for (var day = 0; day < 40; day++) {
      final result = const CityDayRunner().advance(city);
      city = result.state;
      arrivals.addAll(result.events.whereType<DecisionArrived>());
      expect(city.decisions.length, lessThanOrEqualTo(DecisionDesk.maxPending));
    }

    expect(arrivals, isNotEmpty);
  });

  test('a flood damages roads and jams the district when it hits', () {
    final city = newBaku();
    final arrival = DecisionCatalog.of(DecisionId.flood)
        .arrival!(desk.context(city), DistrictId.oilHarbor);

    final (flooded, _) = const DecisionEffects().apply(city, arrival);
    double congestion(CityState state) =>
        const MetricsCalculator().calculate(state).of(DistrictId.oilHarbor).congestion;

    expect(
      flooded.district(DistrictId.oilHarbor).roadCondition,
      city.district(DistrictId.oilHarbor).roadCondition - 20,
    );
    expect(congestion(flooded), greaterThan(congestion(city)));
  });

  test('timed effects shape the economy and then wear off', () {
    final (city, _) = const DecisionEffects().apply(newBaku(), const [
      Modify(ModifierType.dailyCost, 8000, 2),
      Modify(ModifierType.capacity, 1.25, 2, district: DistrictId.windHeights),
    ]);
    final metrics = const MetricsCalculator().calculate(city);
    final plain = const MetricsCalculator().calculate(newBaku());

    expect(const EconomyCalculator().operatingLedger(city, metrics)[LedgerItem.decisions], -8000);
    expect(
      metrics.of(DistrictId.windHeights).capacity,
      greaterThan(plain.of(DistrictId.windHeights).capacity),
    );
    expect(runDays(city, 2).state.modifiers, isEmpty);
  });
}
