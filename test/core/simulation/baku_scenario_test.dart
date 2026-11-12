import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';

import 'simulation_test_kit.dart';

void main() {
  test('Baku starts with an old fleet, an empty budget and the default fare', () {
    final city = const BakuScenario().create(seed: 7);

    expect(city.day, 1);
    expect(city.budget, 0);
    expect(city.diplomacyPoints, 0);
    expect(city.fare, GameBalance.startingFare);
    expect(city.fleet, hasLength(GameBalance.startingFleetSize));
    expect(city.fleet.every((bus) => bus.model == BusModelId.veteran), isTrue);
    expect(city.districts.map((district) => district.id), DistrictId.values);
  });

  test('the starting fleet follows where people live', () {
    final city = newBaku();
    int busesIn(DistrictId id) => city.fleet.where((bus) => bus.districtId == id).length;

    expect(busesIn(DistrictId.windHeights), greaterThan(busesIn(DistrictId.oldFortress)));
    expect(busesIn(DistrictId.windHeights), 8);
  });

  test('the minister starts troubled but not in crisis', () {
    final satisfaction = newBaku().overallSatisfaction;

    expect(satisfaction, greaterThan(GameBalance.crisisSatisfactionThreshold));
    expect(satisfaction, lessThan(50));
  });

  test('the same seed always builds the same city', () {
    expect(const BakuScenario().create(seed: 3), const BakuScenario().create(seed: 3));
  });
}
