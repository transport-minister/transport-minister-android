import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/satisfaction_calculator.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

void main() {
  const calculator = SatisfactionCalculator();

  double overallTarget(CityState city) =>
      StakeholderGroup.overall(calculator.targets(city, const MetricsCalculator().calculate(city)));

  test('moods get more than half way to the city they see within two minutes', () {
    var mood = {for (final group in StakeholderGroup.values) group: 50.0};
    final target = {for (final group in StakeholderGroup.values) group: 80.0};

    for (var second = 0; second < 120; second++) {
      mood = calculator.smooth(mood, target);
    }

    expect(StakeholderGroup.overall(mood), greaterThan(66));
  });

  test('great service lifts moods high and poor service sinks them low', () {
    final start = newBaku();
    final great = start.copyWith(
      fare: 40,
      fleet: [
        for (final district in start.districts)
          for (var index = 0; index < 12; index++)
            Bus(
              id: district.id.index * 100 + index,
              model: BusModelId.cityRunner,
              districtId: district.id,
            ),
      ],
      districts: [
        for (final district in start.districts)
          district.copyWith(
            roadCondition: 100,
            hasModernStops: true,
            hasSmartSignals: true,
            hasBikeLanes: true,
            bikeAdoption: 1,
          ),
      ],
    );
    final poor = start.copyWith(
      fare: 120,
      fleet: const [],
      districts: [for (final district in start.districts) district.copyWith(roadCondition: 20)],
    );

    expect(overallTarget(great), greaterThan(80));
    expect(overallTarget(poor), lessThan(25));
  });

  test('promised mood boosts are added exactly as shown', () {
    final city = newBaku();
    final boosted = city.copyWith(
      modifiers: const [
        ActiveModifier(
          type: ModifierType.mood,
          value: 6,
          remainingSeconds: 300,
          group: StakeholderGroup.passengers,
        ),
      ],
    );

    final before = calculator.targets(city, const MetricsCalculator().calculate(city));
    final after = calculator.targets(boosted, const MetricsCalculator().calculate(boosted));

    expect(
      after[StakeholderGroup.passengers]! - before[StakeholderGroup.passengers]!,
      closeTo(6, 0.001),
    );
  });
}
