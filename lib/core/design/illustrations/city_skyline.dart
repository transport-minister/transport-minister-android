import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';

enum RoofStyle { flat, dome, spire, flame, clock, minaret, stepped, lattice }

class SkylineBuilding {
  const SkylineBuilding({
    required this.left,
    required this.width,
    required this.height,
    required this.color,
    this.roof = RoofStyle.flat,
  });

  final double left;
  final double width;
  final double height;
  final Color color;
  final RoofStyle roof;
}

enum SkylineBase { water, ground }

class SkylineScene {
  const SkylineScene({
    required this.skyTop,
    required this.skyBottom,
    required this.buildings,
    required this.base,
    required this.baseColor,
    this.sunColor = const Color(0xFFFFD84D),
  });

  final Color skyTop;
  final Color skyBottom;
  final List<SkylineBuilding> buildings;
  final SkylineBase base;
  final Color baseColor;
  final Color sunColor;
}

class CitySkyline extends StatelessWidget {
  const CitySkyline({super.key, required this.scene});

  final SkylineScene scene;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: SkylinePainter(scene), child: const SizedBox.expand());
  }
}

class SkylinePainter extends CustomPainter {
  const SkylinePainter(this.scene);

  final SkylineScene scene;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final stroke = math.max(1.6, size.width * 0.007);
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeJoin = StrokeJoin.round
      ..color = GameColors.ink;
    final groundY = size.height * 0.8;

    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [scene.skyTop, scene.skyBottom],
        ).createShader(rect),
    );

    final sun = Offset(size.width * 0.84, size.height * 0.26);
    final sunRadius = size.height * 0.12;
    canvas
      ..drawCircle(sun, sunRadius, Paint()..color = scene.sunColor)
      ..drawCircle(sun, sunRadius, outline);
    _drawCloud(canvas, Offset(size.width * 0.2, size.height * 0.2), size.height * 0.07);

    for (final building in scene.buildings) {
      _drawBuilding(canvas, size, groundY, building, outline);
    }
    _drawBase(canvas, size, groundY, outline);
  }

  void _drawCloud(Canvas canvas, Offset center, double unit) {
    final paint = Paint()..color = GameColors.paper.withValues(alpha: 0.85);
    canvas
      ..drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: center, width: unit * 4, height: unit * 1.3),
          Radius.circular(unit * 0.65),
        ),
        paint,
      )
      ..drawCircle(center.translate(-unit * 0.5, -unit * 0.5), unit * 0.8, paint)
      ..drawCircle(center.translate(unit * 0.6, -unit * 0.6), unit, paint);
  }

  void _drawBuilding(
    Canvas canvas,
    Size size,
    double groundY,
    SkylineBuilding building,
    Paint outline,
  ) {
    final left = building.left * size.width;
    final width = building.width * size.width;
    final top = groundY - building.height * groundY * 0.82;
    final body = Rect.fromLTRB(left, top, left + width, groundY + 2);
    final fill = Paint()..color = building.color;

    switch (building.roof) {
      case RoofStyle.flame:
        final path = Path()
          ..moveTo(body.left, body.bottom)
          ..lineTo(body.left, top + body.height * 0.38)
          ..quadraticBezierTo(
            body.left + width * 0.08,
            top + body.height * 0.06,
            body.left + width * 0.66,
            top,
          )
          ..quadraticBezierTo(
            body.right + width * 0.05,
            top + body.height * 0.28,
            body.right,
            top + body.height * 0.46,
          )
          ..lineTo(body.right, body.bottom)
          ..close();
        canvas.drawPath(path, fill);
        _drawGlassLines(canvas, path, body, outline.strokeWidth);
        canvas.drawPath(path, outline);
      case RoofStyle.minaret:
        final shaft = Rect.fromLTRB(left, top, left + width, groundY + 2);
        final cone = Path()
          ..moveTo(shaft.left - width * 0.1, top)
          ..lineTo(shaft.center.dx, top - width * 2.2)
          ..lineTo(shaft.right + width * 0.1, top)
          ..close();
        canvas
          ..drawRect(shaft, fill)
          ..drawRect(shaft, outline)
          ..drawPath(cone, fill)
          ..drawPath(cone, outline)
          ..drawRect(
            Rect.fromLTRB(
              shaft.left - width * 0.25,
              top + width,
              shaft.right + width * 0.25,
              top + width * 1.5,
            ),
            fill,
          )
          ..drawRect(
            Rect.fromLTRB(
              shaft.left - width * 0.25,
              top + width,
              shaft.right + width * 0.25,
              top + width * 1.5,
            ),
            outline,
          );
      case RoofStyle.lattice:
        final path = Path()
          ..moveTo(body.left, body.bottom)
          ..quadraticBezierTo(
            body.center.dx - width * 0.05,
            top + body.height * 0.4,
            body.center.dx - width * 0.06,
            top,
          )
          ..lineTo(body.center.dx + width * 0.06, top)
          ..quadraticBezierTo(
            body.center.dx + width * 0.05,
            top + body.height * 0.4,
            body.right,
            body.bottom,
          )
          ..close();
        canvas.drawPath(path, fill);
        final braces = Paint()
          ..color = GameColors.paper.withValues(alpha: 0.75)
          ..strokeWidth = outline.strokeWidth * 0.8;
        for (final fraction in [0.35, 0.62, 0.82]) {
          final y = top + body.height * fraction;
          final halfWidth = width * (0.08 + fraction * 0.38);
          canvas.drawLine(
            Offset(body.center.dx - halfWidth, y),
            Offset(body.center.dx + halfWidth, y),
            braces,
          );
        }
        canvas
          ..drawPath(path, outline)
          ..drawLine(
            Offset(body.center.dx, top),
            Offset(body.center.dx, top - width * 0.5),
            outline,
          );
      case RoofStyle.flat:
      case RoofStyle.dome:
      case RoofStyle.spire:
      case RoofStyle.clock:
      case RoofStyle.stepped:
        _drawRoof(canvas, body, building, fill, outline);
        final rounded = RRect.fromRectAndCorners(
          body,
          topLeft: const Radius.circular(3),
          topRight: const Radius.circular(3),
        );
        canvas.drawRRect(rounded, fill);
        _drawWindows(canvas, body);
        if (building.roof == RoofStyle.clock) {
          final face = Offset(body.center.dx, top + width * 0.55);
          canvas
            ..drawCircle(face, width * 0.3, Paint()..color = GameColors.cream)
            ..drawCircle(face, width * 0.3, outline)
            ..drawLine(face, face.translate(0, -width * 0.18), outline)
            ..drawLine(face, face.translate(width * 0.13, 0), outline);
        }
        canvas.drawRRect(rounded, outline);
    }
  }

  void _drawRoof(Canvas canvas, Rect body, SkylineBuilding building, Paint fill, Paint outline) {
    final width = body.width;
    switch (building.roof) {
      case RoofStyle.dome:
        final dome = Rect.fromCenter(
          center: Offset(body.center.dx, body.top),
          width: width * 0.9,
          height: width * 0.8,
        );
        canvas
          ..drawLine(
            Offset(body.center.dx, dome.top),
            Offset(body.center.dx, dome.top - width * 0.25),
            outline,
          )
          ..drawArc(dome, math.pi, math.pi, true, fill)
          ..drawArc(dome, math.pi, math.pi, true, outline);
      case RoofStyle.spire:
      case RoofStyle.clock:
        final roof = Path()
          ..moveTo(body.left - 2, body.top)
          ..lineTo(
            body.center.dx,
            body.top - width * (building.roof == RoofStyle.clock ? 0.7 : 1.1),
          )
          ..lineTo(body.right + 2, body.top)
          ..close();
        canvas
          ..drawPath(roof, fill)
          ..drawPath(roof, outline);
      case RoofStyle.stepped:
        final tier = Rect.fromLTRB(
          body.left + width * 0.18,
          body.top - body.height * 0.12,
          body.right - width * 0.18,
          body.top + 2,
        );
        final crown = Rect.fromLTRB(
          tier.left + width * 0.14,
          tier.top - body.height * 0.08,
          tier.right - width * 0.14,
          tier.top + 2,
        );
        canvas
          ..drawLine(
            Offset(body.center.dx, crown.top),
            Offset(body.center.dx, crown.top - body.height * 0.18),
            outline,
          )
          ..drawRect(crown, fill)
          ..drawRect(crown, outline)
          ..drawRect(tier, fill)
          ..drawRect(tier, outline);
      case RoofStyle.flat:
      case RoofStyle.flame:
      case RoofStyle.minaret:
      case RoofStyle.lattice:
        break;
    }
  }

  void _drawWindows(Canvas canvas, Rect body) {
    final paint = Paint()..color = GameColors.cream.withValues(alpha: 0.8);
    final cell = math.max(7.0, body.width / 4);
    final columns = math.max(1, (body.width / cell).floor());
    final rows = math.max(1, ((body.height - cell * 0.6) / cell).floor());
    final windowSize = cell * 0.42;
    final horizontalGap = (body.width - columns * windowSize) / (columns + 1);
    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        final x = body.left + horizontalGap + column * (windowSize + horizontalGap);
        final y = body.top + cell * 0.45 + row * cell;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x, y, windowSize, windowSize),
            const Radius.circular(2),
          ),
          paint,
        );
      }
    }
  }

  void _drawGlassLines(Canvas canvas, Path path, Rect body, double strokeWidth) {
    final paint = Paint()
      ..color = GameColors.paper.withValues(alpha: 0.55)
      ..strokeWidth = strokeWidth * 0.8;
    canvas
      ..save()
      ..clipPath(path);
    for (var y = body.top + body.height * 0.2; y < body.bottom; y += body.height * 0.11) {
      canvas.drawLine(Offset(body.left, y + body.width * 0.2), Offset(body.right, y), paint);
    }
    canvas.restore();
  }

  void _drawBase(Canvas canvas, Size size, double groundY, Paint outline) {
    final base = Rect.fromLTRB(0, groundY, size.width, size.height);
    canvas
      ..drawRect(base, Paint()..color = scene.baseColor)
      ..drawLine(Offset(0, groundY), Offset(size.width, groundY), outline);
    if (scene.base == SkylineBase.water) {
      final wave = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = outline.strokeWidth
        ..strokeCap = StrokeCap.round
        ..color = GameColors.paper.withValues(alpha: 0.8);
      final waveWidth = size.width / 9;
      for (var i = 0; i < 9; i++) {
        final y = groundY + (size.height - groundY) * (i.isEven ? 0.4 : 0.72);
        final x = i * waveWidth + waveWidth * 0.2;
        canvas.drawArc(Rect.fromLTWH(x, y - 4, waveWidth * 0.55, 8), math.pi, math.pi, false, wave);
      }
    }
  }

  @override
  bool shouldRepaint(SkylinePainter oldDelegate) => oldDelegate.scene != scene;
}
