import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/satisfaction_calculator.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/district_state.dart';
import 'package:transport_minister/core/simulation/model/road_maintenance_level.dart';

class BakuScenario {
  const BakuScenario({
    this.metrics = const MetricsCalculator(),
    this.satisfaction = const SatisfactionCalculator(),
  });

  final MetricsCalculator metrics;
  final SatisfactionCalculator satisfaction;

  CityState create({required int seed}) {
    final districts = [
      for (final id in DistrictId.values)
        DistrictState(
          id: id,
          population: id.blueprint.population,
          roadCondition: id.blueprint.roadCondition,
          roadLevel: id.blueprint.roadLevel,
        ),
    ];
    final fleet = _startingFleet(districts, seed);
    final draft = CityState(
      seed: seed,
      day: 1,
      budget: GameBalance.startingBudget,
      fare: GameBalance.startingFare,
      depotCapacity: GameBalance.startingDepotCapacity,
      roadMaintenance: RoadMaintenanceLevel.normal,
      districts: districts,
      fleet: fleet,
      satisfaction: const {},
      nextId: fleet.length + 1,
    );
    return draft.copyWith(satisfaction: satisfaction.targets(draft, metrics.calculate(draft)));
  }

  List<Bus> _startingFleet(List<DistrictState> districts, int seed) {
    final population = districts.fold(0, (sum, district) => sum + district.population);
    final quotas = [
      for (final district in districts)
        GameBalance.startingFleetSize * district.population / population,
    ];
    final counts = [for (final quota in quotas) quota.floor()];
    final order = List.generate(districts.length, (index) => index)
      ..sort((a, b) => (quotas[b] - counts[b]).compareTo(quotas[a] - counts[a]));
    var missing = GameBalance.startingFleetSize - counts.fold(0, (sum, count) => sum + count);
    for (final index in order) {
      if (missing == 0) {
        break;
      }
      counts[index]++;
      missing--;
    }
    final fleet = <Bus>[];
    for (var index = 0; index < districts.length; index++) {
      for (var copy = 0; copy < counts[index]; copy++) {
        final id = fleet.length + 1;
        fleet.add(
          Bus(
            id: id,
            model: BusModelId.veteran,
            districtId: districts[index].id,
            ageDays: 600 + (id * 137 + seed) % 900,
          ),
        );
      }
    }
    return fleet;
  }
}
