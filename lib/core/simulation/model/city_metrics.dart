import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';

class DistrictMetrics {
  const DistrictMetrics({
    required this.id,
    required this.population,
    required this.demand,
    required this.capacity,
    required this.waitingMinutes,
    required this.congestion,
    required this.safety,
    required this.buses,
  });

  final DistrictId id;
  final int population;
  final int demand;
  final int capacity;
  final double waitingMinutes;
  final double congestion;
  final double safety;
  final int buses;

  int get riders => capacity < demand ? capacity : demand;

  double get serviceRatio => demand == 0 ? 1 : capacity / demand;
}

class CityMetrics {
  const CityMetrics({
    required this.districts,
    required this.pollution,
    required this.coverage,
    required this.accessibility,
    required this.fleetComfort,
    required this.fleetReliability,
    required this.electricShare,
  });

  final List<DistrictMetrics> districts;
  final double pollution;
  final double coverage;
  final double accessibility;
  final double fleetComfort;
  final double fleetReliability;
  final double electricShare;

  DistrictMetrics of(DistrictId id) => districts.firstWhere((district) => district.id == id);

  int get demand => districts.fold(0, (sum, district) => sum + district.demand);

  int get capacity => districts.fold(0, (sum, district) => sum + district.capacity);

  int get riders => districts.fold(0, (sum, district) => sum + district.riders);

  int get population => districts.fold(0, (sum, district) => sum + district.population);

  double get crowding {
    final total = demand;
    if (total == 0) {
      return 0;
    }
    final ratio = capacity / total;
    return ratio >= 1 ? 0 : 1 - ratio;
  }

  double get averageWaiting =>
      _weighted((district) => district.waitingMinutes, (district) => district.demand);

  double get congestion =>
      _weighted((district) => district.congestion, (district) => district.population);

  double get safety => _weighted((district) => district.safety, (district) => district.population);

  double _weighted(double Function(DistrictMetrics) value, int Function(DistrictMetrics) weight) {
    var total = 0.0;
    var weights = 0;
    for (final district in districts) {
      total += value(district) * weight(district);
      weights += weight(district);
    }
    return weights == 0 ? 0 : total / weights;
  }
}
