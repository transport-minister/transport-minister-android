import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_metrics.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';

class CityMapPainter extends CustomPainter {
  const CityMapPainter({required this.metrics, required this.constructionSites});

  final CityMetrics metrics;
  final Set<DistrictId> constructionSites;

  static const land = Color(0xFFEAF3D6);
  static const sea = Color(0xFF7CC6F5);
  static const calmTraffic = Color(0xFF7BD67B);
  static const busyTraffic = Color(0xFFFFD54F);
  static const jammedTraffic = Color(0xFFFF7A6E);

  static Color trafficColor(double congestion) {
    if (congestion < 45) {
      return calmTraffic;
    }
    return congestion < 65 ? busyTraffic : jammedTraffic;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final unit = size.width;
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeJoin = StrokeJoin.round
      ..color = GameColors.ink;
    canvas.drawRect(Offset.zero & size, Paint()..color = land);
    _paintSea(canvas, size, outline);
    for (final (from, to) in CityRoads.links) {
      _paintRoad(canvas, size, unit, from, to);
    }
    for (final district in DistrictId.values) {
      _paintDistrict(canvas, size, unit, district, outline);
    }
  }

  void _paintSea(Canvas canvas, Size size, Paint outline) {
    Offset at(double x, double y) => Offset(x * size.width, y * size.height);
    final coast = Path()
      ..moveTo(size.width + 4, size.height * 0.28)
      ..cubicTo(
        at(0.93, 0.4).dx,
        at(0.93, 0.4).dy,
        at(0.99, 0.62).dx,
        at(0.99, 0.62).dy,
        at(0.8, 0.8).dx,
        at(0.8, 0.8).dy,
      )
      ..cubicTo(
        at(0.66, 0.93).dx,
        at(0.66, 0.93).dy,
        at(0.36, 0.86).dx,
        at(0.36, 0.86).dy,
        -4,
        size.height * 0.92,
      );
    final water = Path.from(coast)
      ..lineTo(-4, size.height + 4)
      ..lineTo(size.width + 4, size.height + 4)
      ..close();
    canvas
      ..drawPath(water, Paint()..color = sea)
      ..drawPath(coast, outline);
    final wave = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..color = GameColors.paper.withValues(alpha: 0.8);
    for (final (x, y) in const [(0.9, 0.86), (0.72, 0.95), (0.18, 0.97), (0.95, 0.7)]) {
      final center = at(x, y);
      canvas.drawArc(
        Rect.fromCenter(center: center, width: 22, height: 10),
        math.pi,
        math.pi,
        false,
        wave,
      );
    }
  }

  void _paintRoad(Canvas canvas, Size size, double unit, DistrictId from, DistrictId to) {
    final start = _point(size, from.mapCenter);
    final end = _point(size, to.mapCenter);
    final congestion = (metrics.of(from).congestion + metrics.of(to).congestion) / 2;
    final width = unit * 0.045;
    canvas
      ..drawLine(
        start,
        end,
        Paint()
          ..color = GameColors.ink
          ..strokeWidth = width + 5
          ..strokeCap = StrokeCap.round,
      )
      ..drawLine(
        start,
        end,
        Paint()
          ..color = trafficColor(congestion)
          ..strokeWidth = width
          ..strokeCap = StrokeCap.round,
      );
    final dash = Paint()
      ..color = GameColors.paper
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    final length = (end - start).distance;
    final direction = (end - start) / length;
    for (var travelled = 8.0; travelled < length - 8; travelled += 16) {
      canvas.drawLine(
        start + direction * travelled,
        start + direction * math.min(travelled + 7, length),
        dash,
      );
    }
  }

  void _paintDistrict(Canvas canvas, Size size, double unit, DistrictId district, Paint outline) {
    final center = _point(size, district.mapCenter);
    final radius = district.mapRadius * unit;
    final blob = _blob(center, radius, district.index);
    canvas
      ..drawPath(blob.shift(const Offset(0, 4)), Paint()..color = GameColors.ink)
      ..drawPath(blob, Paint()..color = district.landColor)
      ..drawPath(blob, outline);
    if (constructionSites.contains(district)) {
      final ring = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..color = const Color(0xFFFF9F43);
      canvas.drawPath(_blob(center, radius * 0.86, district.index), ring);
    }
  }

  Path _blob(Offset center, double radius, int seed) {
    const points = 10;
    final path = Path();
    final corners = <Offset>[];
    for (var index = 0; index < points; index++) {
      final angle = index / points * math.pi * 2;
      final wobble = 1 + 0.07 * math.sin(index * 2.3 + seed * 1.7);
      corners.add(center + Offset(math.cos(angle), math.sin(angle)) * radius * wobble);
    }
    path.moveTo((corners.last.dx + corners.first.dx) / 2, (corners.last.dy + corners.first.dy) / 2);
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

  Offset _point(Size size, Offset normalized) =>
      Offset(normalized.dx * size.width, normalized.dy * size.height);

  @override
  bool shouldRepaint(CityMapPainter oldDelegate) =>
      oldDelegate.metrics != metrics || oldDelegate.constructionSites != constructionSites;
}

class TrafficPainter extends CustomPainter {
  TrafficPainter({required this.progress, required this.buses}) : super(repaint: progress);

  final Animation<double> progress;
  final int buses;

  static const _colors = [Color(0xFFFFC93C), Color(0xFF4A9A33), Color(0xFF3FA3F0)];

  @override
  void paint(Canvas canvas, Size size) {
    const links = CityRoads.links;
    for (var index = 0; index < buses; index++) {
      final (from, to) = links[index % links.length];
      final phase = (progress.value + index * 0.37) % 1;
      final forward = phase < 0.5;
      final t = forward ? phase * 2 : 2 - phase * 2;
      final start = Offset(from.mapCenter.dx * size.width, from.mapCenter.dy * size.height);
      final end = Offset(to.mapCenter.dx * size.width, to.mapCenter.dy * size.height);
      final position = Offset.lerp(start, end, t)!;
      final angle = math.atan2(end.dy - start.dy, end.dx - start.dx) + (forward ? 0 : math.pi);
      canvas
        ..save()
        ..translate(position.dx, position.dy)
        ..rotate(angle);
      final body = RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: 18, height: 10),
        const Radius.circular(3),
      );
      canvas
        ..drawRRect(body, Paint()..color = _colors[index % _colors.length])
        ..drawRRect(
          body,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.8
            ..color = GameColors.ink,
        )
        ..drawRect(const Rect.fromLTWH(1, -3, 6, 6), Paint()..color = const Color(0xFFBFE9FF))
        ..restore();
    }
  }

  @override
  bool shouldRepaint(TrafficPainter oldDelegate) => oldDelegate.buses != buses;
}
