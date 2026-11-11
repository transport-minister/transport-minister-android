enum RoadMaintenanceLevel {
  low(costPerDistrict: 250, decayPerDay: 0.5),
  normal(costPerDistrict: 500, decayPerDay: 0.2),
  high(costPerDistrict: 900, decayPerDay: 0);

  const RoadMaintenanceLevel({required this.costPerDistrict, required this.decayPerDay});

  final int costPerDistrict;
  final double decayPerDay;
}
