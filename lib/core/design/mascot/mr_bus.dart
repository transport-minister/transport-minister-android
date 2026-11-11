import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';

enum MrBusMood { happy, excited, worried, shocked, thinking }

class MrBus extends StatefulWidget {
  const MrBus({super.key, this.mood = MrBusMood.happy, this.size = 96});

  final MrBusMood mood;
  final double size;

  @override
  State<MrBus> createState() => _MrBusState();
}

class _MrBusState extends State<MrBus> with SingleTickerProviderStateMixin {
  late final _bounce = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _bounce.stop();
    } else if (!_bounce.isAnimating) {
      _bounce.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _bounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounce,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, -widget.size * 0.03 * Curves.easeInOut.transform(_bounce.value)),
        child: child,
      ),
      child: CustomPaint(size: Size.square(widget.size), painter: MrBusPainter(widget.mood)),
    );
  }
}

class MrBusPainter extends CustomPainter {
  const MrBusPainter(this.mood);

  final MrBusMood mood;

  static const _yellow = Color(0xFFFFC93C);
  static const _yellowDeep = Color(0xFFF2AE17);
  static const _glass = Color(0xFFBFE9FF);
  static const _cap = Color(0xFF2B3A67);
  static const _gold = Color(0xFFFFD84D);
  static const _blush = Color(0xCCFF9EB5);
  static const _headlight = Color(0xFFFFF3B0);

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final stroke = s * 0.032;
    final ink = Paint()..color = GameColors.ink;
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = GameColors.ink;

    for (final x in [0.29, 0.71]) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(s * x, s * 0.88), width: s * 0.17, height: s * 0.14),
        ink,
      );
    }
    for (final side in [-1.0, 1.0]) {
      final anchor = Offset(s * (0.5 + side * 0.36), s * 0.32);
      final mirror = Offset(s * (0.5 + side * 0.44), s * 0.25);
      canvas
        ..drawLine(anchor, mirror, outline)
        ..drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: mirror, width: s * 0.06, height: s * 0.11),
            Radius.circular(s * 0.02),
          ),
          Paint()..color = GameColors.ink,
        );
    }

    final body = RRect.fromLTRBR(s * 0.14, s * 0.16, s * 0.86, s * 0.87, Radius.circular(s * 0.14));
    canvas
      ..drawRRect(body.shift(Offset(0, s * 0.03)), ink)
      ..save()
      ..clipRRect(body)
      ..drawRect(Offset.zero & size, Paint()..color = _yellow)
      ..drawRect(Rect.fromLTRB(0, s * 0.7, s, s), Paint()..color = _yellowDeep)
      ..restore()
      ..drawRRect(body, outline);

    final windshield = RRect.fromLTRBR(
      s * 0.21,
      s * 0.24,
      s * 0.79,
      s * 0.56,
      Radius.circular(s * 0.08),
    );
    canvas
      ..drawRRect(windshield, Paint()..color = _glass)
      ..drawRRect(windshield, outline);

    _paintCap(canvas, s, outline);
    _paintEyes(canvas, s, outline);
    for (final x in [0.27, 0.73]) {
      canvas.drawCircle(Offset(s * x, s * 0.62), s * 0.045, Paint()..color = _blush);
    }
    _paintMouth(canvas, s, outline);
    for (final x in [0.25, 0.75]) {
      final light = Offset(s * x, s * 0.78);
      canvas
        ..drawCircle(light, s * 0.045, Paint()..color = _headlight)
        ..drawCircle(light, s * 0.045, outline);
    }
  }

  void _paintCap(Canvas canvas, double s, Paint outline) {
    final dome = Path()
      ..moveTo(s * 0.3, s * 0.18)
      ..cubicTo(s * 0.3, s * 0.02, s * 0.7, s * 0.02, s * 0.7, s * 0.18)
      ..close();
    final brim = RRect.fromLTRBR(s * 0.24, s * 0.15, s * 0.76, s * 0.21, Radius.circular(s * 0.03));
    canvas
      ..drawPath(dome, Paint()..color = _cap)
      ..drawPath(dome, outline)
      ..drawRRect(brim, Paint()..color = _cap)
      ..drawRRect(brim, outline)
      ..drawCircle(Offset(s * 0.5, s * 0.1), s * 0.03, Paint()..color = _gold);
  }

  void _paintEyes(Canvas canvas, double s, Paint outline) {
    final look = switch (mood) {
      MrBusMood.thinking => Offset(s * 0.025, -s * 0.025),
      MrBusMood.worried => Offset(0, s * 0.012),
      _ => Offset.zero,
    };
    final pupil = switch (mood) {
      MrBusMood.shocked => s * 0.024,
      MrBusMood.excited => s * 0.046,
      _ => s * 0.038,
    };
    for (final side in [-1.0, 1.0]) {
      final center = Offset(s * (0.5 + side * 0.13), s * 0.4);
      canvas
        ..drawCircle(center, s * 0.085, Paint()..color = GameColors.paper)
        ..drawCircle(center, s * 0.085, outline)
        ..drawCircle(center + look, pupil, Paint()..color = GameColors.ink)
        ..drawCircle(
          center + look + Offset(-pupil * 0.4, -pupil * 0.45),
          pupil * (mood == MrBusMood.excited ? 0.45 : 0.32),
          Paint()..color = GameColors.paper,
        );
      final (inner, outer) = switch (mood) {
        MrBusMood.happy => (0.0, 0.012),
        MrBusMood.excited => (-0.022, -0.006),
        MrBusMood.worried => (-0.03, 0.012),
        MrBusMood.shocked => (-0.035, -0.035),
        MrBusMood.thinking => side < 0 ? (0.004, 0.004) : (-0.03, -0.022),
      };
      final browY = s * 0.29;
      canvas.drawLine(
        Offset(center.dx - side * s * 0.055, browY + inner * s),
        Offset(center.dx + side * s * 0.065, browY + outer * s),
        outline,
      );
    }
  }

  void _paintMouth(Canvas canvas, double s, Paint outline) {
    final center = Offset(s * 0.5, s * 0.63);
    switch (mood) {
      case MrBusMood.happy:
        canvas.drawArc(
          Rect.fromCenter(
            center: center.translate(0, -s * 0.03),
            width: s * 0.18,
            height: s * 0.12,
          ),
          0.15,
          math.pi - 0.3,
          false,
          outline,
        );
      case MrBusMood.excited:
        final mouth = Path()
          ..moveTo(center.dx - s * 0.1, center.dy - s * 0.02)
          ..quadraticBezierTo(
            center.dx,
            center.dy + s * 0.14,
            center.dx + s * 0.1,
            center.dy - s * 0.02,
          )
          ..close();
        canvas
          ..drawPath(mouth, Paint()..color = GameColors.ink)
          ..drawCircle(
            center.translate(0, s * 0.045),
            s * 0.035,
            Paint()..color = const Color(0xFFFF7A8A),
          );
      case MrBusMood.worried:
        final wave = Path()..moveTo(center.dx - s * 0.08, center.dy);
        wave
          ..quadraticBezierTo(center.dx - s * 0.04, center.dy - s * 0.03, center.dx, center.dy)
          ..quadraticBezierTo(
            center.dx + s * 0.04,
            center.dy + s * 0.03,
            center.dx + s * 0.08,
            center.dy,
          );
        canvas.drawPath(wave, outline..style = PaintingStyle.stroke);
      case MrBusMood.shocked:
        canvas.drawOval(
          Rect.fromCenter(center: center.translate(0, s * 0.01), width: s * 0.08, height: s * 0.1),
          Paint()..color = GameColors.ink,
        );
      case MrBusMood.thinking:
        canvas.drawLine(
          center.translate(-s * 0.03, 0),
          center.translate(s * 0.07, -s * 0.015),
          outline,
        );
    }
  }

  @override
  bool shouldRepaint(MrBusPainter oldDelegate) => oldDelegate.mood != mood;
}
