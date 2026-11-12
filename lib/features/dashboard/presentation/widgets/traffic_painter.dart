import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map_painter.dart';

enum VehicleKind {
  car(length: 34, width: 17),
  bus(length: 54, width: 21);

  const VehicleKind({required this.length, required this.width});

  final double length;
  final double width;
}

class LaneVehicle {
  const LaneVehicle({required this.kind, required this.offset, required this.color});

  final VehicleKind kind;
  final double offset;
  final Color color;
}

class TrafficLane {
  const TrafficLane({
    required this.start,
    required this.end,
    required this.congestion,
    required this.loop,
    required this.speed,
    required this.vehicles,
  });

  final Offset start;
  final Offset end;
  final double congestion;
  final double loop;
  final double speed;
  final List<LaneVehicle> vehicles;

  double get length => (end - start).distance;

  int count(VehicleKind kind) => vehicles.where((vehicle) => vehicle.kind == kind).length;

  double positionOf(LaneVehicle vehicle, double seconds) =>
      (vehicle.offset + speed * seconds) % loop;
}

abstract final class TrafficPlan {
  static const cycleSeconds = 24;
  static const minGap = 14.0;
  static const laneOffset = CityMapPainter.roadWidth / 4;
  static const _edgePadding = 6.0;
  static const _freeSpeed = 70.0;
  static const _jamSpeed = 18.0;
  static const _busColor = Color(0xFFFFC93C);
  static const _carColors = [
    Color(0xFFFF6B5E),
    Color(0xFF3FA3F0),
    Color(0xFFFFFFFF),
    Color(0xFF9B6CF2),
    Color(0xFF2EC4B6),
  ];

  static List<TrafficLane> lanes(CityMetrics metrics) => [
    for (final (index, road) in RoadGeometry.all.indexed)
      for (final forward in const [true, false])
        _lane(metrics, road, seed: index * 2 + (forward ? 0 : 1), forward: forward),
  ];

  static TrafficLane _lane(
    CityMetrics metrics,
    RoadGeometry road, {
    required int seed,
    required bool forward,
  }) {
    final from = forward ? road.from : road.to;
    final to = forward ? road.to : road.from;
    final vector = to.worldCenter - from.worldCenter;
    final direction = vector / vector.distance;
    final side = Offset(-direction.dy, direction.dx) * laneOffset;
    final start = from.worldCenter + direction * (from.worldRadius + _edgePadding) + side;
    final end = to.worldCenter - direction * (to.worldRadius + _edgePadding) + side;
    final length = (end - start).distance;
    final congestion = road.congestion(metrics);
    final kinds = _kinds(
      congestion: congestion,
      length: length,
      nearbyBuses: metrics.of(road.from).buses + metrics.of(road.to).buses,
    );
    final packed = kinds.fold(0.0, (sum, kind) => sum + kind.length + minGap);
    final loop = math.max(packed, length + VehicleKind.bus.length + minGap);
    final weights = [for (var index = 0; index < kinds.length; index++) 0.5 + _noise(seed, index)];
    final totalWeight = weights.fold(0.0, (sum, weight) => sum + weight);
    final vehicles = <LaneVehicle>[];
    var cursor = 0.0;
    for (var index = 0; index < kinds.length; index++) {
      final kind = kinds[index];
      vehicles.add(
        LaneVehicle(
          kind: kind,
          offset: cursor + kind.length / 2,
          color: kind == VehicleKind.bus
              ? _busColor
              : _carColors[(seed * 3 + index) % _carColors.length],
        ),
      );
      cursor += kind.length + minGap + (loop - packed) * weights[index] / totalWeight;
    }
    return TrafficLane(
      start: start,
      end: end,
      congestion: congestion,
      loop: loop,
      speed: _seamlessSpeed(congestion, loop),
      vehicles: vehicles,
    );
  }

  static List<VehicleKind> _kinds({
    required double congestion,
    required double length,
    required int nearbyBuses,
  }) {
    final free = congestion < TrafficColors.busyFrom;
    final capacity = (length / (VehicleKind.car.length + minGap)).floor();
    final density = ((congestion - 28) / 42).clamp(0.08, 1.0);
    final buses = ((nearbyBuses / 10).round() + (free ? 1 : 0)).clamp(1, 3);
    final cars = math.max((density * capacity).round() - buses, 1);
    final total = cars + buses;
    return [
      for (var slot = 0; slot < total; slot++)
        slot * buses ~/ total != (slot + 1) * buses ~/ total ? VehicleKind.bus : VehicleKind.car,
    ];
  }

  static double _seamlessSpeed(double congestion, double loop) {
    final slowdown = ((congestion - 30) / 40).clamp(0.0, 1.0);
    final wanted = _freeSpeed + (_jamSpeed - _freeSpeed) * slowdown;
    final laps = math.max((wanted * cycleSeconds / loop).round(), 1);
    return laps * loop / cycleSeconds;
  }

  static double _noise(int seed, int index) => ((seed * 7919) ^ (index * 104729)) % 97 / 96;
}

class TrafficPainter extends CustomPainter {
  TrafficPainter({required this.progress, required this.metrics}) : super(repaint: progress);

  final Animation<double> progress;
  final CityMetrics metrics;

  static const cycle = Duration(seconds: TrafficPlan.cycleSeconds);
  static const _glass = Color(0xFFBFE9FF);
  static const _fadeDistance = 18.0;

  late final _lanes = TrafficPlan.lanes(metrics);

  @override
  void paint(Canvas canvas, Size size) {
    final seconds = progress.value * TrafficPlan.cycleSeconds;
    for (final lane in _lanes) {
      final length = lane.length;
      final direction = (lane.end - lane.start) / length;
      final angle = math.atan2(direction.dy, direction.dx);
      for (final vehicle in lane.vehicles) {
        final position = lane.positionOf(vehicle, seconds);
        final half = vehicle.kind.length / 2;
        final room = math.min(position - half, length - position - half);
        if (room < 0) {
          continue;
        }
        _paintVehicle(
          canvas,
          lane.start + direction * position,
          angle,
          vehicle,
          math.min(room / _fadeDistance, 1),
        );
      }
    }
  }

  void _paintVehicle(
    Canvas canvas,
    Offset center,
    double angle,
    LaneVehicle vehicle,
    double opacity,
  ) {
    final kind = vehicle.kind;
    final length = kind.length;
    final width = kind.width;
    final ink = GameColors.ink.withValues(alpha: opacity);
    final body = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: length, height: width),
      const Radius.circular(5),
    );
    canvas
      ..save()
      ..translate(center.dx, center.dy)
      ..rotate(angle)
      ..drawRRect(body.shift(const Offset(0, 2)), Paint()..color = ink)
      ..drawRRect(body, Paint()..color = vehicle.color.withValues(alpha: opacity))
      ..drawRRect(
        body,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = ink,
      );
    final glass = Paint()..color = _glass.withValues(alpha: opacity);
    if (kind == VehicleKind.bus) {
      for (var window = 0; window < 4; window++) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(-length / 2 + 6 + window * 11.5, -width / 2 + 4, 8.5, width - 8),
            const Radius.circular(2),
          ),
          glass,
        );
      }
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(length / 2 - 14, -width / 2 + 4, 9, width - 8),
          const Radius.circular(2),
        ),
        glass,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(TrafficPainter oldDelegate) => oldDelegate.metrics != metrics;
}
