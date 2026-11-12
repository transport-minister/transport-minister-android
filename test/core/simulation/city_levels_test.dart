import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/city_development.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/ledger_item.dart';

import 'simulation_test_kit.dart';

void main() {
  test('levels follow the development thresholds', () {
    expect(CityLevels.levelFor(0), 1);
    expect(CityLevels.levelFor(39), 1);
    expect(CityLevels.levelFor(40), 2);
    expect(CityLevels.levelFor(2500), CityLevels.targetLevel);
    expect(CityLevels.progress(75), closeTo(0.5, 0.001));
    expect(CityLevels.progress(9999), 1);
  });

  test('happy days and a positive budget earn more points', () {
    expect(CityLevels.dailyPoints(satisfaction: 20, positiveDay: false), 0);
    expect(CityLevels.dailyPoints(satisfaction: 38, positiveDay: false), 3);
    expect(CityLevels.dailyPoints(satisfaction: 80, positiveDay: true), 13);
  });

  test('crossing a threshold levels up and pays the reward', () {
    final city = newBaku().copyWith(developmentPoints: 38);

    final (leveled, events) = const CityDevelopment().award(city, 75);

    expect(leveled.level, 3);
    expect(events.whereType<CityLeveledUp>().map((event) => event.level), [2, 3]);
    expect(leveled.budget, city.budget + CityLevels.rewardFor(2) + CityLevels.rewardFor(3));
    expect(leveled.pendingLedger[LedgerItem.levelRewards], 500000);
  });

  test('buying a bus earns development points', () {
    final outcome = const CityCommands().buyBus(
      newBaku().copyWith(developmentPoints: 37),
      model: BusModelId.cityRunner,
      district: DistrictId.oldFortress,
    );

    final bought = applied(outcome);

    expect(bought.developmentPoints, 37 + CityLevels.busPurchasePoints);
    expect((outcome as CommandApplied).events.whereType<CityLeveledUp>().single.level, 2);
  });

  test('every simulated day adds development points', () {
    final week = runDays(newBaku(), 7).state;

    expect(week.developmentPoints, greaterThan(0));
  });
}
