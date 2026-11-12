import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/project_rules.dart';
import 'package:transport_minister/core/simulation/engine/satisfaction_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

void main() {
  const rules = ProjectRules();
  const metrics = MetricsCalculator();
  const district = DistrictId.oldFortress;

  CityState builtWith(ProjectType type) => rules.complete(newBaku(), type, district);

  double mood(CityState city, StakeholderGroup group) =>
      const SatisfactionCalculator().targets(city, metrics.calculate(city))[group]!;

  test('a city park makes walkers happier, cleans the air and eases traffic a little', () {
    final city = newBaku();
    final withPark = builtWith(ProjectType.cityPark);

    expect(
      metrics.calculate(withPark).of(district).congestion,
      lessThan(metrics.calculate(city).of(district).congestion),
    );
    expect(metrics.calculate(withPark).pollution, lessThan(metrics.calculate(city).pollution));
    expect(
      mood(withPark, StakeholderGroup.pedestrians),
      greaterThan(mood(city, StakeholderGroup.pedestrians)),
    );
    expect(
      mood(withPark, StakeholderGroup.environmentalists),
      greaterThan(mood(city, StakeholderGroup.environmentalists)),
    );
  });

  test('park and ride takes cars off the road and brings more bus riders', () {
    final before = metrics.calculate(newBaku()).of(district);
    final after = metrics.calculate(builtWith(ProjectType.parkAndRide)).of(district);

    expect(after.congestion, lessThan(before.congestion - 4));
    expect(after.demand, greaterThan(before.demand));
  });

  test('every district can have one park and one park and ride', () {
    final withPark = builtWith(ProjectType.cityPark);

    expect(
      rules.validate(withPark, ProjectType.cityPark, district: district),
      RejectionReason.alreadyBuilt,
    );
    expect(rules.validate(withPark, ProjectType.parkAndRide, district: district), isNull);
    expect(rules.validate(withPark, ProjectType.cityPark, district: DistrictId.oilHarbor), isNull);
  });
}
