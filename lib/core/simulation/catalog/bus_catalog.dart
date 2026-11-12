enum BusModelId { veteran, hopMini, cityRunner, megaLink, voltaE }

class BusModel {
  const BusModel({
    required this.price,
    required this.capacity,
    required this.energyPerSecond,
    required this.maintenancePerSecond,
    required this.reliability,
    required this.comfort,
    required this.emission,
    required this.speed,
    this.electric = false,
  });

  final int price;
  final int capacity;
  final double energyPerSecond;
  final double maintenancePerSecond;
  final double reliability;
  final double comfort;
  final double emission;
  final double speed;
  final bool electric;
}

extension BusModels on BusModelId {
  BusModel get spec => switch (this) {
    BusModelId.veteran => const BusModel(
      price: 90000,
      capacity: 80,
      energyPerSecond: 8,
      maintenancePerSecond: 3.7,
      reliability: 0.72,
      comfort: 30,
      emission: 1.3,
      speed: 0.95,
    ),
    BusModelId.hopMini => const BusModel(
      price: 60000,
      capacity: 28,
      energyPerSecond: 3,
      maintenancePerSecond: 1.3,
      reliability: 0.8,
      comfort: 40,
      emission: 0.5,
      speed: 1.15,
    ),
    BusModelId.cityRunner => const BusModel(
      price: 210000,
      capacity: 90,
      energyPerSecond: 6.3,
      maintenancePerSecond: 2.3,
      reliability: 0.86,
      comfort: 55,
      emission: 0.85,
      speed: 1,
    ),
    BusModelId.megaLink => const BusModel(
      price: 340000,
      capacity: 150,
      energyPerSecond: 9.7,
      maintenancePerSecond: 4,
      reliability: 0.82,
      comfort: 60,
      emission: 1.1,
      speed: 0.9,
    ),
    BusModelId.voltaE => const BusModel(
      price: 480000,
      capacity: 85,
      energyPerSecond: 2.3,
      maintenancePerSecond: 1.8,
      reliability: 0.9,
      comfort: 78,
      emission: 0,
      speed: 1,
      electric: true,
    ),
  };
}

abstract final class BusUpgrades {
  static const maxLevel = 5;

  static const _costShare = {2: 0.15, 3: 0.2, 4: 0.25, 5: 0.3};

  static int costToReach(BusModelId model, int level) {
    final share = _costShare[level];
    if (share == null) {
      throw ArgumentError.value(level, 'level', 'Upgrade levels are 2 to $maxLevel');
    }
    return (model.spec.price * share).round();
  }

  static int investedUntil(BusModelId model, int level) {
    var total = 0;
    for (var next = 2; next <= level; next++) {
      total += costToReach(model, next);
    }
    return total;
  }
}
