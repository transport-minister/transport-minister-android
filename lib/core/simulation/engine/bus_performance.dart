import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';

class BusPerformance {
  const BusPerformance({
    required this.capacity,
    required this.reliability,
    required this.comfort,
    required this.energyPerSecond,
    required this.maintenancePerSecond,
    required this.emission,
    required this.speed,
  });

  factory BusPerformance.of(Bus bus) {
    final spec = bus.model.spec;
    final level = bus.level;
    var reliability = spec.reliability;
    var maintenance = spec.maintenancePerSecond;
    var capacity = spec.capacity.toDouble();
    var comfort = spec.comfort;
    var energy = spec.energyPerSecond;
    var emission = spec.emission;
    if (level >= 2) {
      reliability += 0.06;
      maintenance *= 0.9;
    }
    if (level >= 3) {
      capacity *= 1.15;
    }
    if (level >= 4) {
      comfort += 18;
    }
    if (level >= 5) {
      energy *= 0.8;
      emission *= 0.7;
      reliability += 0.04;
    }
    reliability -= bus.ageSeconds * GameBalance.reliabilityLossPerSecond;
    maintenance *= 1 + bus.ageSeconds / GameBalance.maintenanceAgeFactorSeconds;
    return BusPerformance(
      capacity: capacity.round(),
      reliability: math.min(
        math.max(reliability, GameBalance.minReliability),
        GameBalance.maxReliability,
      ),
      comfort: math.min(comfort, 100),
      energyPerSecond: energy,
      maintenancePerSecond: maintenance,
      emission: emission,
      speed: spec.speed,
    );
  }

  final int capacity;
  final double reliability;
  final double comfort;
  final double energyPerSecond;
  final double maintenancePerSecond;
  final double emission;
  final double speed;

  double ridersPerSecondAt(double congestion) {
    final trips =
        GameBalance.baseTripsPerBusSecond *
        speed *
        (1 - congestion / 100 * GameBalance.congestionTripPenalty);
    return capacity * trips * reliability;
  }

  static int resaleValue(Bus bus) {
    final invested = bus.model.spec.price + BusUpgrades.investedUntil(bus.model, bus.level);
    final share = math.min(
      math.max(0.7 - bus.ageSeconds / GameBalance.resaleAgeFactorSeconds, 0.15),
      0.7,
    );
    return (invested * share).round();
  }
}
