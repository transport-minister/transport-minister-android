import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_typography.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/metro_line.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';

class MetroGeometry {
  const MetroGeometry._({required this.start, required this.control, required this.end});

  factory MetroGeometry.of(MetroLine line) {
    final ordered = line.from.index < line.to.index;
    final first = ordered ? line.from : line.to;
    final second = ordered ? line.to : line.from;
    final vector = second.worldCenter - first.worldCenter;
    final normal = Offset(-vector.dy, vector.dx) / vector.distance;
    final control = (first.worldCenter + second.worldCenter) / 2 + normal * vector.distance * _bend;
    return MetroGeometry._(
      start: _edgeOf(first, control),
      control: control,
      end: _edgeOf(second, control),
    );
  }

  static const _bend = 0.22;

  final Offset start;
  final Offset control;
  final Offset end;

  Path get path => Path()
    ..moveTo(start.dx, start.dy)
    ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

  Offset pointAt(double t) {
    final rest = 1 - t;
    return start * (rest * rest) + control * (2 * rest * t) + end * (t * t);
  }

  Offset directionAt(double t) => (control - start) * (2 * (1 - t)) + (end - control) * (2 * t);

  static Offset _edgeOf(DistrictId district, Offset control) {
    final toward = control - district.worldCenter;
    return district.worldCenter + toward / toward.distance * district.worldRadius;
  }
}

class MetroPainter extends CustomPainter {
  MetroPainter({required this.progress, required this.lines}) : super(repaint: progress);

  final Animation<double> progress;
  final List<MetroLine> lines;

  static const _track = 10.0;
  static const _stationRadius = 16.0;
  static final _letter = TextPainter(
    text: const TextSpan(
      text: 'M',
      style: TextStyle(
        fontFamily: GameTypography.fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: GameColors.paper,
      ),
    ),
    textDirection: TextDirection.ltr,
  )..layout();

  @override
  void paint(Canvas canvas, Size size) {
    for (var index = 0; index < lines.length; index++) {
      final line = lines[index];
      final geometry = MetroGeometry.of(line);
      if (line.isOpen) {
        _paintTrack(canvas, geometry);
        _paintTrains(canvas, geometry, index);
      } else {
        _paintTunnel(canvas, geometry);
      }
      final palette = line.isOpen ? ChunkyPalette.grape : ChunkyPalette.tangerine;
      _paintStation(canvas, geometry.start, palette);
      _paintStation(canvas, geometry.end, palette);
    }
  }

  void _paintTrack(Canvas canvas, MetroGeometry geometry) {
    final path = geometry.path;
    canvas
      ..drawPath(path, _stroke(GameColors.ink, _track + 6))
      ..drawPath(path, _stroke(ChunkyPalette.grape.face, _track));
    final sleepers = _stroke(GameColors.paper.withValues(alpha: 0.85), 3);
    for (final metric in path.computeMetrics()) {
      for (var distance = 12.0; distance < metric.length - 12; distance += 22) {
        canvas.drawPath(metric.extractPath(distance, distance + 8), sleepers);
      }
    }
  }

  void _paintTunnel(Canvas canvas, MetroGeometry geometry) {
    final outline = _stroke(GameColors.ink, _track + 4);
    final fill = _stroke(ChunkyPalette.tangerine.face, _track - 2);
    for (final metric in geometry.path.computeMetrics()) {
      for (var distance = 0.0; distance < metric.length; distance += 30) {
        final dash = metric.extractPath(distance, math.min(distance + 16, metric.length));
        canvas
          ..drawPath(dash, outline)
          ..drawPath(dash, fill);
      }
    }
  }

  void _paintTrains(Canvas canvas, MetroGeometry geometry, int index) {
    for (var train = 0; train < 2; train++) {
      final phase = (progress.value * 2.2 + train * 0.5 + index * 0.31) % 1;
      final t = 0.1 + 0.8 * (train.isEven ? phase : 1 - phase);
      final direction = geometry.directionAt(t);
      final side = Offset(-direction.dy, direction.dx) / direction.distance * 5;
      final position = geometry.pointAt(t) + (train.isEven ? side : -side);
      canvas
        ..save()
        ..translate(position.dx, position.dy)
        ..rotate(math.atan2(direction.dy, direction.dx));
      final body = RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: 46, height: 16),
        const Radius.circular(8),
      );
      canvas
        ..drawRRect(body.shift(const Offset(0, 2)), Paint()..color = GameColors.ink)
        ..drawRRect(body, Paint()..color = GameColors.paper)
        ..drawRRect(body, _stroke(GameColors.ink, 2));
      for (var window = 0; window < 4; window++) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(-18 + window * 9.5, -4, 6.5, 8),
            const Radius.circular(2),
          ),
          Paint()..color = ChunkyPalette.grape.face,
        );
      }
      canvas.restore();
    }
  }

  void _paintStation(Canvas canvas, Offset center, ChunkyPalette palette) {
    canvas
      ..drawCircle(center.translate(0, 3), _stationRadius, Paint()..color = GameColors.ink)
      ..drawCircle(center, _stationRadius, Paint()..color = palette.face)
      ..drawCircle(center, _stationRadius, _stroke(GameColors.ink, 3));
    _letter.paint(canvas, center - Offset(_letter.width / 2, _letter.height / 2));
  }

  Paint _stroke(Color color, double width) => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = width
    ..strokeCap = StrokeCap.round
    ..color = color;

  @override
  bool shouldRepaint(MetroPainter oldDelegate) => oldDelegate.lines != lines;
}
