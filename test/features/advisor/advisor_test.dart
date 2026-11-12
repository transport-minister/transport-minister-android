import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/features/advisor/domain/advisor.dart';

import '../../core/simulation/simulation_test_kit.dart';

AdvisorTip _tipFor(CityState city) =>
    const Advisor().bestTip(city, const MetricsCalculator().calculate(city));

void main() {
  test('a new Baku points at the district waiting longest', () {
    final tip = _tipFor(newBaku());

    expect(tip.kind, TipKind.longWaits);
    expect(tip.district, DistrictId.oilHarbor);
    expect(tip.value, greaterThanOrEqualTo(Advisor.longWaitMinutes));
  });

  test('money trouble and presidential warnings come first', () {
    expect(_tipFor(newBaku().copyWith(budget: -10)).kind, TipKind.negativeBudget);
    expect(
      _tipFor(newBaku().copyWith(crisis: const CrisisState(seconds: 90, warnings: 1))).kind,
      TipKind.presidentWatching,
    );
    expect(TipKind.negativeBudget.isUrgent, isTrue);
  });

  test('crumbling roads are flagged once waits are short', () {
    final start = newBaku();
    final city = start.copyWith(
      districts: [
        for (final district in start.districts)
          district.copyWith(
            population: 1000,
            roadCondition: district.id == DistrictId.windHeights ? 20 : 90,
          ),
      ],
    );

    final tip = _tipFor(city);

    expect(tip.kind, TipKind.brokenRoads);
    expect(tip.district, DistrictId.windHeights);
  });
}
