import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

class SatisfactionCalculator {
  const SatisfactionCalculator();

  Map<StakeholderGroup, double> targets(CityState state, CityMetrics metrics) {
    final districts = state.districts;
    final averageCondition =
        districts.fold(0.0, (sum, district) => sum + district.roadCondition) / districts.length;
    final bikeDistricts = districts.where((district) => district.hasBikeLanes).length;
    final newBikeDistricts = districts
        .where((district) => district.hasBikeLanes && district.bikeAdoption < 0.5)
        .length;
    final stopsShare =
        districts.where((district) => district.hasModernStops).length / districts.length;
    final harbor = state.district(DistrictId.oilHarbor);
    final harborCongestion = metrics.of(DistrictId.oilHarbor).congestion;
    final projects = state.projects.length;
    final crowding = metrics.crowding;
    final targets = {
      StakeholderGroup.passengers: _clamp(
        75 -
            math.max(metrics.averageWaiting - 5, 0) * 2.5 -
            crowding * 20 -
            _farePenalty(state.fare) +
            (metrics.fleetComfort - 50) * 0.2 +
            stopsShare * 6,
      ),
      StakeholderGroup.drivers: _clamp(
        90 - metrics.congestion * 0.6 - (100 - averageCondition) * 0.2 - newBikeDistricts * 3,
      ),
      StakeholderGroup.pedestrians: _clamp(
        54 + metrics.safety * 0.3 - metrics.pollution * 0.2 + bikeDistricts,
      ),
      StakeholderGroup.cyclists: _clamp(30 + bikeDistricts * 12 + metrics.safety * 0.2),
      StakeholderGroup.businesses: _clamp(
        63 - metrics.congestion * 0.4 + metrics.coverage * 0.2 - projects * 3,
      ),
      StakeholderGroup.transportWorkers: _clamp(
        60 +
            (metrics.fleetReliability - 60) * 0.3 -
            crowding * 15 +
            (metrics.fleetComfort - 50) * 0.1,
      ),
      StakeholderGroup.environmentalists: _clamp(
        70 - metrics.pollution * 0.6 + metrics.electricShare * 30 + bikeDistricts * 4,
      ),
      StakeholderGroup.logistics: _clamp(
        76 - harborCongestion * 0.4 - (100 - harbor.roadCondition) * 0.15 - projects * 2,
      ),
    };
    return {
      for (final entry in targets.entries)
        entry.key: _clamp(entry.value + state.additive(ModifierType.mood, group: entry.key)),
    };
  }

  Map<StakeholderGroup, double> smooth(
    Map<StakeholderGroup, double> current,
    Map<StakeholderGroup, double> targets,
  ) {
    return {
      for (final group in StakeholderGroup.values)
        group: _approach(current[group] ?? targets[group]!, targets[group]!),
    };
  }

  double _farePenalty(int fare) {
    final pricedOut = math.max(1 - MetricsCalculator.demandFactorForFare(fare), 0);
    return math.max(fare - GameBalance.referenceFare, 0) * 0.5 + pricedOut * 40;
  }

  double _approach(double value, double target) =>
      value + (target - value) * GameBalance.satisfactionSmoothing;

  double _clamp(double value) => math.min(math.max(value, 0), 100);
}
