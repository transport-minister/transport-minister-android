enum RoadMaintenanceLevel {
  low(costPerDistrict: 8, decayPerSecond: 0.017),
  normal(costPerDistrict: 17, decayPerSecond: 0.0067),
  high(costPerDistrict: 30, decayPerSecond: 0);

  const RoadMaintenanceLevel({required this.costPerDistrict, required this.decayPerSecond});

  final int costPerDistrict;
  final double decayPerSecond;
}
