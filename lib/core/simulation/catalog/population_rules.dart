import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/district_state.dart';

abstract final class PopulationRules {
  static const baseGrowthPerDay = 0.0003;
  static const happyGrowthPerDay = 0.0005;
  static const congestionElasticity = 0.8;

  static double growthRate(DistrictId district, double satisfaction) =>
      (baseGrowthPerDay + happyGrowthPerDay * satisfaction / 100) * district.blueprint.growthFactor;

  static int dailyGrowth(DistrictState district, double satisfaction) =>
      (district.population * growthRate(district.id, satisfaction)).round();

  static double crowdFactor(DistrictState district) => math
      .pow(district.population / district.id.blueprint.population, congestionElasticity)
      .toDouble();
}
