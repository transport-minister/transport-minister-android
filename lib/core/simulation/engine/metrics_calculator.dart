import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/catalog/metro_rules.dart';
import 'package:transport_minister/core/simulation/engine/bus_performance.dart';
import 'package:transport_minister/core/simulation/model/active_modifier.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/district_state.dart';

class MetricsCalculator {
  const MetricsCalculator();

  static const _roadLevelFactor = {1: 1.0, 2: 0.82, 3: 0.68};

  CityMetrics calculate(CityState state) {
    final performances = {for (final bus in state.activeBuses) bus.id: BusPerformance.of(bus)};
    final fareFactor = demandFactorForFare(state.fare);
    final districts = [
      for (final district in state.districts)
        _districtMetrics(state, district, performances, fareFactor),
    ];
    final active = performances.values.toList();
    final congestion = _weightedCongestion(districts);
    final emissions = active.fold(0.0, (sum, bus) => sum + bus.emission);
    final bikeRelief = state.districts
        .where((district) => district.hasBikeLanes)
        .fold(0.0, (sum, district) => sum + district.bikeAdoption * 8 / state.districts.length);
    final pollution = _clamp(20 + congestion * 0.35 + emissions * 0.45 - bikeRelief, 0, 100);
    final coverage = _coverage(state, districts);
    final affordability = _clamp(100 - (state.fare - 40).toDouble(), 0, 100);
    return CityMetrics(
      districts: districts,
      pollution: pollution,
      coverage: coverage,
      accessibility: coverage * 0.6 + affordability * 0.4,
      fleetComfort: active.isEmpty
          ? 0
          : active.fold(0.0, (sum, bus) => sum + bus.comfort) / active.length,
      fleetReliability: active.isEmpty
          ? 0
          : active.fold(0.0, (sum, bus) => sum + bus.reliability) / active.length * 100,
      electricShare: state.activeBuses.isEmpty
          ? 0
          : state.activeBuses.where((bus) => bus.model.spec.electric).length /
                state.activeBuses.length,
    );
  }

  static double demandFactorForFare(int fare) {
    final change = (fare - GameBalance.referenceFare) / GameBalance.referenceFare;
    return _clamp(
      1 - GameBalance.fareElasticity * change,
      GameBalance.minFareDemandFactor,
      GameBalance.maxFareDemandFactor,
    );
  }

  DistrictMetrics _districtMetrics(
    CityState state,
    DistrictState district,
    Map<int, BusPerformance> performances,
    double fareFactor,
  ) {
    final buses = [for (final bus in state.busesIn(district.id)) performances[bus.id]!];
    final demand =
        (district.population /
                1000 *
                GameBalance.ridersPerThousandResidents *
                fareFactor *
                state.multiplier(ModifierType.demand, district: district.id))
            .round();
    final capacityFactor = state.multiplier(ModifierType.capacity, district: district.id);
    final lines = state.metroLinesAt(district.id);
    final stations = lines.where((line) => line.isOpen).length;
    final tunnels = lines.length - stations;
    final metroRiders = stations * MetroRules.stationRiders(automated: state.metroAutomated);
    final roadFactor =
        (_roadLevelFactor[district.roadLevel] ?? 1) *
        (1 + (100 - district.roadCondition) / 100 * 0.3);
    final roadCongestion = district.id.blueprint.baseCongestion * roadFactor;
    final initialRatio = _ratio(
      (_capacity(buses, roadCongestion) * capacityFactor).round() + metroRiders,
      demand,
    );
    final modalFactor = 1.1 - 0.25 * math.min(initialRatio, 1.2);
    final signalsFactor = district.hasSmartSignals ? GameBalance.smartSignalsCongestionFactor : 1.0;
    final bikeEffect = district.hasBikeLanes
        ? GameBalance.bikeLaneRoadSpaceCongestion -
              GameBalance.bikeLaneMaxCongestionRelief * district.bikeAdoption
        : 0.0;
    final construction = state.projects
        .where((project) => project.districtId == district.id)
        .fold(0.0, (sum, project) => sum + project.type.congestionWhileBuilding);
    final congestion = _clamp(
      roadCongestion * modalFactor * signalsFactor +
          bikeEffect +
          construction +
          tunnels * MetroRules.constructionCongestion -
          stations * MetroRules.congestionRelief +
          state.additive(ModifierType.congestion, district: district.id),
      0,
      100,
    );
    final capacity = (_capacity(buses, congestion) * capacityFactor).round() + metroRiders;
    final ratio = _ratio(capacity, demand);
    final safety = _clamp(
      40 +
          district.roadCondition * 0.4 -
          congestion * 0.15 +
          (district.hasSmartSignals ? 8 : 0) +
          (district.hasBikeLanes ? 4 : 0) +
          state.additive(ModifierType.safety, district: district.id),
      0,
      100,
    );
    return DistrictMetrics(
      id: district.id,
      population: district.population,
      demand: demand,
      capacity: capacity,
      waitingMinutes: _clamp(
        GameBalance.waitingMinutesAtFullService / math.max(ratio, 0.01),
        GameBalance.minWaitingMinutes,
        GameBalance.maxWaitingMinutes,
      ),
      congestion: congestion,
      safety: safety,
      buses: buses.length,
    );
  }

  int _capacity(List<BusPerformance> buses, double congestion) =>
      buses.fold(0, (sum, bus) => sum + bus.dailyRidersAt(congestion));

  double _ratio(int capacity, int demand) => demand == 0 ? 1 : capacity / demand;

  double _weightedCongestion(List<DistrictMetrics> districts) {
    var total = 0.0;
    var population = 0;
    for (final district in districts) {
      total += district.congestion * district.population;
      population += district.population;
    }
    return population == 0 ? 0 : total / population;
  }

  double _coverage(CityState state, List<DistrictMetrics> districts) {
    var covered = 0.0;
    var population = 0;
    for (final metrics in districts) {
      final stops = state.district(metrics.id).hasModernStops
          ? 1 + GameBalance.modernStopsCoverageBonus
          : 1.0;
      covered += math.min(metrics.serviceRatio * stops, 1) * metrics.population;
      population += metrics.population;
    }
    return population == 0 ? 0 : covered / population * 100;
  }

  static double _clamp(double value, double min, double max) => math.min(math.max(value, min), max);
}
