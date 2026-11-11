import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';

class BusIllustration extends StatelessWidget {
  const BusIllustration({super.key, this.palette = ChunkyPalette.sunny, this.width = 160});

  final ChunkyPalette palette;
  final double width;

  static const aspectRatio = 2.1;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(width, width / aspectRatio), painter: BusPainter(palette));
  }
}

class BusPainter extends CustomPainter {
  const BusPainter(this.palette);

  final ChunkyPalette palette;

  static const _glass = Color(0xFFBFE9FF);
  static const _hub = Color(0xFFD9D5E2);
  static const _headlight = Color(0xFFFFF3B0);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final stroke = w * 0.018;
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeJoin = StrokeJoin.round
      ..color = GameColors.ink;

    final roofUnit = RRect.fromLTRBR(
      w * 0.3,
      h * 0.02,
      w * 0.56,
      h * 0.14,
      Radius.circular(h * 0.04),
    );
    canvas
      ..drawRRect(roofUnit, Paint()..color = palette.deep)
      ..drawRRect(roofUnit, outline);

    final body = RRect.fromLTRBR(w * 0.03, h * 0.1, w * 0.97, h * 0.8, Radius.circular(h * 0.14));
    canvas
      ..save()
      ..clipRRect(body)
      ..drawRect(Offset.zero & size, Paint()..color = palette.face)
      ..drawRect(Rect.fromLTRB(0, h * 0.58, w, h), Paint()..color = palette.deep)
      ..drawRect(Rect.fromLTRB(0, h * 0.1, w, h * 0.16), Paint()..color = palette.glow)
      ..restore()
      ..drawRRect(body, outline);

    final windowPaint = Paint()..color = _glass;
    final windowTop = h * 0.22;
    final windowBottom = h * 0.46;
    for (var i = 0; i < 4; i++) {
      final left = w * (0.08 + i * 0.145);
      final window = RRect.fromLTRBR(
        left,
        windowTop,
        left + w * 0.115,
        windowBottom,
        Radius.circular(h * 0.05),
      );
      canvas
        ..drawRRect(window, windowPaint)
        ..drawRRect(window, outline);
    }

    final door = RRect.fromLTRBR(
      w * 0.68,
      windowTop,
      w * 0.79,
      h * 0.74,
      Radius.circular(h * 0.04),
    );
    canvas
      ..drawRRect(door, Paint()..color = palette.deep)
      ..drawRRect(
        RRect.fromLTRBR(
          w * 0.695,
          windowTop + h * 0.03,
          w * 0.775,
          h * 0.5,
          Radius.circular(h * 0.03),
        ),
        windowPaint,
      )
      ..drawRRect(door, outline);

    final windshield = RRect.fromLTRBAndCorners(
      w * 0.83,
      windowTop,
      w * 0.955,
      h * 0.52,
      topLeft: Radius.circular(h * 0.05),
      bottomLeft: Radius.circular(h * 0.05),
      topRight: Radius.circular(h * 0.1),
    );
    canvas
      ..drawRRect(windshield, windowPaint)
      ..drawRRect(windshield, outline)
      ..drawCircle(Offset(w * 0.925, h * 0.65), h * 0.045, Paint()..color = _headlight)
      ..drawCircle(Offset(w * 0.925, h * 0.65), h * 0.045, outline);

    final shine = Paint()
      ..color = GameColors.paper.withValues(alpha: 0.7)
      ..strokeWidth = stroke * 1.2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(w * 0.1, h * 0.4), Offset(w * 0.14, h * 0.27), shine);

    for (final x in [w * 0.22, w * 0.74]) {
      final center = Offset(x, h * 0.8);
      canvas
        ..drawCircle(center, h * 0.15, Paint()..color = GameColors.ink)
        ..drawCircle(center, h * 0.065, Paint()..color = _hub);
    }
  }

  @override
  bool shouldRepaint(BusPainter oldDelegate) => oldDelegate.palette != palette;
}
