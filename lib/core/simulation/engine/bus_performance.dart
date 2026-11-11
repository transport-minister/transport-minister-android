import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';

class BusPerformance {
  const BusPerformance({
    required this.capacity,
    required this.reliability,
    required this.comfort,
    required this.energyPerDay,
    required this.maintenancePerDay,
    required this.emission,
    required this.speed,
  });

  factory BusPerformance.of(Bus bus) {
    final spec = bus.model.spec;
    final level = bus.level;
    var reliability = spec.reliability;
    var maintenance = spec.maintenancePerDay.toDouble();
    var capacity = spec.capacity.toDouble();
    var comfort = spec.comfort;
    var energy = spec.energyPerDay.toDouble();
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
    reliability -= bus.ageDays * GameBalance.reliabilityLossPerDay;
    maintenance *= 1 + bus.ageDays / GameBalance.maintenanceAgeFactorDays;
    return BusPerformance(
      capacity: capacity.round(),
      reliability: math.min(
        math.max(reliability, GameBalance.minReliability),
        GameBalance.maxReliability,
      ),
      comfort: math.min(comfort, 100),
      energyPerDay: energy.round(),
      maintenancePerDay: maintenance.round(),
      emission: emission,
      speed: spec.speed,
    );
  }

  final int capacity;
  final double reliability;
  final double comfort;
  final int energyPerDay;
  final int maintenancePerDay;
  final double emission;
  final double speed;

  int dailyRidersAt(double congestion) {
    final trips =
        GameBalance.baseTripsPerBusDay *
        speed *
        (1 - congestion / 100 * GameBalance.congestionTripPenalty);
    return (capacity * trips * reliability).round();
  }

  static int resaleValue(Bus bus) {
    final invested = bus.model.spec.price + BusUpgrades.investedUntil(bus.model, bus.level);
    final share = math.min(math.max(0.7 - bus.ageDays / 1500, 0.15), 0.7);
    return (invested * share).round();
  }
}
