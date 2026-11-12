import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/population_rules.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

void main() {
  int population(CityState city) =>
      city.districts.fold(0, (sum, district) => sum + district.population);

  CityState withMood(double mood) =>
      newBaku().copyWith(satisfaction: {for (final group in StakeholderGroup.values) group: mood});

  test('every district grows a little every day', () {
    final city = newBaku();

    final grown = runDays(city, 30).state;

    for (final district in grown.districts) {
      expect(district.population, greaterThan(city.district(district.id).population));
    }
    final growth = population(grown) / population(city) - 1;
    expect(growth, inInclusiveRange(0.01, 0.06));
  });

  test('happy cities attract people faster and the new district grows fastest', () {
    expect(
      PopulationRules.growthRate(DistrictId.oldFortress, 80),
      greaterThan(PopulationRules.growthRate(DistrictId.oldFortress, 30)),
    );
    expect(
      PopulationRules.growthRate(DistrictId.caspianGardens, 50),
      greaterThan(PopulationRules.growthRate(DistrictId.windHeights, 50)),
    );
    expect(
      population(runDays(withMood(80), 20).state),
      greaterThan(population(runDays(withMood(30), 20).state)),
    );
  });

  test('more people mean more riders and more traffic', () {
    const metrics = MetricsCalculator();
    final city = newBaku();
    final crowded = city.copyWith(
      districts: [
        for (final district in city.districts)
          district.copyWith(population: (district.population * 1.2).round()),
      ],
    );

    final before = metrics.calculate(city);
    final after = metrics.calculate(crowded);

    expect(after.demand, greaterThan(before.demand));
    expect(after.congestion, greaterThan(before.congestion));
  });
}
