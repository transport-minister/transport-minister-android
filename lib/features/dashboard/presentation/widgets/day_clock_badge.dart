import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';

class DayClockBadge extends StatelessWidget {
  const DayClockBadge({super.key, required this.day, required this.progress, required this.label});

  final int day;
  final double progress;
  final String label;

  static const size = 54.0;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: progress),
        duration: const Duration(milliseconds: 900),
        builder: (context, value, child) => CustomPaint(painter: _RingPainter(value), child: child),
        child: SizedBox.square(
          dimension: size,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'DAY',
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, height: 1),
              ),
              Text(
                '$day',
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, height: 1.05),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - 4;
    canvas
      ..drawCircle(center.translate(0, 3), radius + 3, Paint()..color = GameColors.ink)
      ..drawCircle(center, radius + 3, Paint()..color = GameColors.ink)
      ..drawCircle(center, radius, Paint()..color = GameColors.paper)
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius - 2.5),
        -math.pi / 2,
        math.pi * 2 * progress.clamp(0, 1),
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..color = ChunkyPalette.sunny.face,
      );
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) => oldDelegate.progress != progress;
}
