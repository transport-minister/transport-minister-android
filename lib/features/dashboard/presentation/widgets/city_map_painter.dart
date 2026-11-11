import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';

abstract final class TrafficColors {
  static const smooth = Color(0xFF7BD67B);
  static const busy = Color(0xFFFFD54F);
  static const jammed = Color(0xFFFF7A6E);

  static Color of(double congestion) {
    if (congestion < 45) {
      return smooth;
    }
    return congestion < 65 ? busy : jammed;
  }
}

class RoadGeometry {
  const RoadGeometry(this.from, this.to);

  final DistrictId from;
  final DistrictId to;

  Offset get start => from.worldCenter;

  Offset get end => to.worldCenter;

  double congestion(CityMetrics metrics) =>
      (metrics.of(from).congestion + metrics.of(to).congestion) / 2;

  static final all = [for (final (from, to) in CityRoads.links) RoadGeometry(from, to)];
}

class CityMapPainter extends CustomPainter {
  const CityMapPainter({required this.metrics, required this.constructionSites});

  final CityMetrics metrics;
  final Set<DistrictId> constructionSites;

  static const land = Color(0xFFEAF3D6);
  static const sea = Color(0xFF7CC6F5);
  static const roadWidth = 24.0;

  static const _trees = [
    Offset(80, 470),
    Offset(110, 510),
    Offset(420, 120),
    Offset(460, 90),
    Offset(380, 330),
    Offset(70, 880),
    Offset(120, 930),
    Offset(260, 860),
    Offset(600, 380),
    Offset(640, 420),
    Offset(860, 90),
    Offset(840, 330),
    Offset(330, 1010),
    Offset(560, 760),
    Offset(80, 120),
    Offset(130, 1040),
    Offset(620, 880),
    Offset(360, 680),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round
      ..color = GameColors.ink;
    canvas.drawRect(Offset.zero & size, Paint()..color = land);
    _paintSea(canvas, size, outline);
    for (final tree in _trees) {
      _paintTree(canvas, tree);
    }
    for (final road in RoadGeometry.all) {
      _paintRoad(canvas, road);
    }
    for (final district in DistrictId.values) {
      _paintDistrict(canvas, district, outline);
    }
  }

  static Path coastline(Size size) {
    return Path()
      ..moveTo(size.width + 6, 400)
      ..cubicTo(840, 640, 920, 900, 700, 1050)
      ..cubicTo(520, 1160, 240, 1080, -6, 1130);
  }

  void _paintSea(Canvas canvas, Size size, Paint outline) {
    final coast = coastline(size);
    final water = Path.from(coast)
      ..lineTo(-6, size.height + 6)
      ..lineTo(size.width + 6, size.height + 6)
      ..close();
    canvas
      ..drawPath(water, Paint()..color = sea)
      ..drawPath(coast, outline);
    final wave = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..color = GameColors.paper.withValues(alpha: 0.8);
    for (final center in const [
      Offset(860, 760),
      Offset(800, 1000),
      Offset(620, 1150),
      Offset(260, 1160),
      Offset(870, 1110),
      Offset(80, 1175),
    ]) {
      canvas.drawArc(
        Rect.fromCenter(center: center, width: 34, height: 14),
        math.pi,
        math.pi,
        false,
        wave,
      );
    }
  }

  void _paintTree(Canvas canvas, Offset base) {
    canvas
      ..drawRect(
        Rect.fromCenter(center: base.translate(0, 10), width: 6, height: 14),
        Paint()..color = const Color(0xFF9C6B3F),
      )
      ..drawCircle(base, 15, Paint()..color = GameColors.ink)
      ..drawCircle(base, 12.5, Paint()..color = const Color(0xFF6CC35A))
      ..drawCircle(base.translate(-4, -4), 4, Paint()..color = const Color(0xFF9BE08A));
  }

  void _paintRoad(Canvas canvas, RoadGeometry road) {
    canvas
      ..drawLine(
        road.start,
        road.end,
        Paint()
          ..color = GameColors.ink
          ..strokeWidth = roadWidth + 7
          ..strokeCap = StrokeCap.round,
      )
      ..drawLine(
        road.start,
        road.end,
        Paint()
          ..color = const Color(0xFF6E6B85)
          ..strokeWidth = roadWidth
          ..strokeCap = StrokeCap.round,
      );
    final vector = road.end - road.start;
    final length = vector.distance;
    final direction = vector / length;
    final normal = Offset(-direction.dy, direction.dx);
    final edge = Paint()
      ..color = TrafficColors.of(road.congestion(metrics))
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    for (final side in const [-1.0, 1.0]) {
      final shift = normal * (roadWidth / 2 - 2) * side;
      canvas.drawLine(road.start + shift, road.end + shift, edge);
    }
    final dash = Paint()
      ..color = GameColors.paper
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    for (var travelled = 10.0; travelled < length - 10; travelled += 22) {
      canvas.drawLine(
        road.start + direction * travelled,
        road.start + direction * math.min(travelled + 10, length),
        dash,
      );
    }
  }

  void _paintDistrict(Canvas canvas, DistrictId district, Paint outline) {
    final center = district.worldCenter;
    final radius = district.worldRadius;
    final blob = _blob(center, radius, district.index);
    canvas
      ..drawPath(blob.shift(const Offset(0, 6)), Paint()..color = GameColors.ink)
      ..drawPath(blob, Paint()..color = district.landColor)
      ..drawPath(blob, outline);
    _paintBlocks(canvas, center, radius, district);
    if (constructionSites.contains(district)) {
      canvas.drawPath(
        _blob(center, radius * 0.88, district.index),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..color = const Color(0xFFFF9F43),
      );
    }
  }

  void _paintBlocks(Canvas canvas, Offset center, double radius, DistrictId district) {
    final fill = Paint()..color = district.palette.glow;
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = GameColors.ink.withValues(alpha: 0.55);
    for (var index = 0; index < 6; index++) {
      final angle = index / 6 * math.pi * 2 + district.index;
      final spot = center + Offset(math.cos(angle), math.sin(angle)) * radius * 0.62;
      final block = RRect.fromRectAndRadius(
        Rect.fromCenter(center: spot, width: 22, height: 18),
        const Radius.circular(4),
      );
      canvas
        ..drawRRect(block, fill)
        ..drawRRect(block, stroke);
    }
  }

  Path _blob(Offset center, double radius, int seed) {
    const points = 12;
    final corners = <Offset>[];
    for (var index = 0; index < points; index++) {
      final angle = index / points * math.pi * 2;
      final wobble = 1 + 0.06 * math.sin(index * 2.3 + seed * 1.7);
      corners.add(center + Offset(math.cos(angle), math.sin(angle)) * radius * wobble);
    }
    final path = Path()
      ..moveTo((corners.last.dx + corners.first.dx) / 2, (corners.last.dy + corners.first.dy) / 2);
    for (var index = 0; index < points; index++) {
      final current = corners[index];
      final next = corners[(index + 1) % points];
      path.quadraticBezierTo(
        current.dx,
        current.dy,
        (current.dx + next.dx) / 2,
        (current.dy + next.dy) / 2,
      );
    }
    return path..close();
  }

  @override
  bool shouldRepaint(CityMapPainter oldDelegate) =>
      oldDelegate.metrics != metrics || oldDelegate.constructionSites != constructionSites;
}

class TrafficPainter extends CustomPainter {
  TrafficPainter({required this.progress, required this.metrics, required this.buses})
    : super(repaint: progress);

  final Animation<double> progress;
  final CityMetrics metrics;
  final int buses;

  static const _carColors = [
    Color(0xFFFF6B5E),
    Color(0xFF3FA3F0),
    Color(0xFFFFFFFF),
    Color(0xFF9B6CF2),
    Color(0xFF2EC4B6),
  ];
  static const _glass = Color(0xFFBFE9FF);

  @override
  void paint(Canvas canvas, Size size) {
    final roads = RoadGeometry.all;
    for (var roadIndex = 0; roadIndex < roads.length; roadIndex++) {
      final road = roads[roadIndex];
      final congestion = road.congestion(metrics);
      final cars = 2 + (congestion / 100 * 7).round();
      final speed = 1.6 - congestion / 100;
      for (var car = 0; car < cars; car++) {
        final phase = (progress.value * speed + car / cars + roadIndex * 0.13) % 1;
        _paintVehicle(
          canvas,
          road,
          phase,
          forward: car.isEven,
          length: 26,
          width: 14,
          color: _carColors[(car + roadIndex) % _carColors.length],
        );
      }
    }
    for (var bus = 0; bus < buses; bus++) {
      final road = roads[(bus * 3) % roads.length];
      final phase = (progress.value * 0.9 + bus * 0.29) % 1;
      _paintVehicle(
        canvas,
        road,
        phase,
        forward: bus.isOdd,
        length: 40,
        width: 17,
        color: const Color(0xFFFFC93C),
        isBus: true,
      );
    }
  }

  void _paintVehicle(
    Canvas canvas,
    RoadGeometry road,
    double phase, {
    required bool forward,
    required double length,
    required double width,
    required Color color,
    bool isBus = false,
  }) {
    final start = forward ? road.start : road.end;
    final end = forward ? road.end : road.start;
    final vector = end - start;
    final distance = vector.distance;
    final direction = vector / distance;
    final lane = Offset(-direction.dy, direction.dx) * 6;
    final startInset = ((forward ? road.from : road.to).worldRadius + length / 2) / distance;
    final endInset = ((forward ? road.to : road.from).worldRadius + length / 2) / distance;
    final travel = startInset + phase * (1 - startInset - endInset);
    final position = Offset.lerp(start, end, travel)! + lane;
    canvas
      ..save()
      ..translate(position.dx, position.dy)
      ..rotate(math.atan2(direction.dy, direction.dx));
    final body = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: length, height: width),
      const Radius.circular(5),
    );
    canvas
      ..drawRRect(body.shift(const Offset(0, 2)), Paint()..color = GameColors.ink)
      ..drawRRect(body, Paint()..color = color)
      ..drawRRect(
        body,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = GameColors.ink,
      );
    if (isBus) {
      for (var window = 0; window < 4; window++) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(-length / 2 + 5 + window * 8.5, -width / 2 + 3, 6, width - 6),
            const Radius.circular(2),
          ),
          Paint()..color = _glass,
        );
      }
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(length / 2 - 11, -width / 2 + 3, 7, width - 6),
          const Radius.circular(2),
        ),
        Paint()..color = _glass,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(TrafficPainter oldDelegate) =>
      oldDelegate.buses != buses || oldDelegate.metrics != metrics;
}
