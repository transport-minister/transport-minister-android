import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/traffic_painter.dart';

import '../../core/simulation/simulation_test_kit.dart';

void main() {
  CityMetrics withCongestion(double congestion) {
    final metrics = const MetricsCalculator().calculate(newBaku());
    return CityMetrics(
      districts: [
        for (final district in metrics.districts)
          DistrictMetrics(
            id: district.id,
            population: district.population,
            demand: district.demand,
            capacity: district.capacity,
            waitingMinutes: district.waitingMinutes,
            congestion: congestion,
            safety: district.safety,
            buses: district.buses,
          ),
      ],
      pollution: metrics.pollution,
      coverage: metrics.coverage,
      accessibility: metrics.accessibility,
      fleetComfort: metrics.fleetComfort,
      fleetReliability: metrics.fleetReliability,
      electricShare: metrics.electricShare,
    );
  }

  test('vehicles in a lane always keep a gap between them', () {
    for (final congestion in const [20.0, 50.0, 90.0]) {
      for (final lane in TrafficPlan.lanes(withCongestion(congestion))) {
        for (var second = 0.0; second < TrafficPlan.cycleSeconds; second += 1.5) {
          final placed = [
            for (final vehicle in lane.vehicles)
              (position: lane.positionOf(vehicle, second), half: vehicle.kind.length / 2),
          ]..sort((a, b) => a.position.compareTo(b.position));
          for (var index = 0; index < placed.length; index++) {
            final current = placed[index];
            final next = index + 1 < placed.length
                ? placed[index + 1]
                : (position: placed.first.position + lane.loop, half: placed.first.half);
            if (placed.length > 1) {
              final gap = next.position - next.half - current.position - current.half;
              expect(gap, greaterThanOrEqualTo(TrafficPlan.minGap - 0.001));
            }
          }
        }
      }
    }
  });

  test('jammed roads fill with cars while free roads carry mostly buses', () {
    final jammed = TrafficPlan.lanes(withCongestion(80));
    final free = TrafficPlan.lanes(withCongestion(30));

    for (final lane in jammed) {
      final packed = lane.vehicles.fold(
        0.0,
        (sum, vehicle) => sum + vehicle.kind.length + TrafficPlan.minGap,
      );
      expect(lane.count(VehicleKind.car), greaterThan(lane.count(VehicleKind.bus)));
      expect(packed, greaterThan(lane.length * 0.8));
    }
    for (final lane in free) {
      expect(lane.count(VehicleKind.bus), greaterThanOrEqualTo(lane.count(VehicleKind.car)));
      expect(lane.vehicles.length, lessThanOrEqualTo(4));
    }
    for (var index = 0; index < jammed.length; index++) {
      expect(free[index].speed, greaterThan(jammed[index].speed));
    }
  });

  test('the traffic loops without jumps', () {
    for (final lane in TrafficPlan.lanes(withCongestion(55))) {
      for (final vehicle in lane.vehicles) {
        final start = lane.positionOf(vehicle, 0);
        final end = lane.positionOf(vehicle, TrafficPlan.cycleSeconds.toDouble());
        final drift = (end - start).abs();
        expect(drift < 0.01 || (drift - lane.loop).abs() < 0.01, isTrue);
      }
    }
  });
}
