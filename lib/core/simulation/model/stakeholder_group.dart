enum StakeholderGroup {
  passengers(weight: 0.3),
  drivers(weight: 0.2),
  pedestrians(weight: 0.15),
  cyclists(weight: 0.05),
  businesses(weight: 0.1),
  transportWorkers(weight: 0.05),
  environmentalists(weight: 0.05),
  logistics(weight: 0.1);

  const StakeholderGroup({required this.weight});

  final double weight;

  static double overall(Map<StakeholderGroup, double> satisfaction) {
    var total = 0.0;
    for (final group in values) {
      total += (satisfaction[group] ?? 0) * group.weight;
    }
    return total;
  }
}
