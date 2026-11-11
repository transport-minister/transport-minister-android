import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';

enum BackdropStyle { cream, sky }

class GameBackdrop extends StatelessWidget {
  const GameBackdrop({super.key, required this.child, this.style = BackdropStyle.cream});

  final Widget child;
  final BackdropStyle style;

  @override
  Widget build(BuildContext context) {
    return switch (style) {
      BackdropStyle.cream => DecoratedBox(
        decoration: const BoxDecoration(color: GameColors.cream),
        child: CustomPaint(painter: const _DotsPainter(), child: child),
      ),
      BackdropStyle.sky => DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [GameColors.skyTop, GameColors.skyBottom],
          ),
        ),
        child: CustomPaint(painter: const _CloudsPainter(), child: child),
      ),
    };
  }
}

class _DotsPainter extends CustomPainter {
  const _DotsPainter();

  static const _spacing = 24.0;
  static const _radius = 1.6;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = GameColors.ink.withValues(alpha: 0.05);
    for (var y = _spacing / 2; y < size.height; y += _spacing) {
      final offset = (y / _spacing).floor().isEven ? 0.0 : _spacing / 2;
      for (var x = offset; x < size.width; x += _spacing) {
        canvas.drawCircle(Offset(x, y), _radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotsPainter oldDelegate) => false;
}

class _CloudsPainter extends CustomPainter {
  const _CloudsPainter();

  static const _clouds = [
    (0.12, 0.08, 1.0),
    (0.78, 0.16, 0.8),
    (0.32, 0.3, 0.6),
    (0.88, 0.42, 0.7),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = GameColors.paper.withValues(alpha: 0.75);
    for (final (dx, dy, scale) in _clouds) {
      _drawCloud(canvas, Offset(size.width * dx, size.height * dy), 34 * scale, paint);
    }
  }

  void _drawCloud(Canvas canvas, Offset center, double unit, Paint paint) {
    final body = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: unit * 3.4, height: unit * 1.1),
      Radius.circular(unit * 0.55),
    );
    canvas
      ..drawRRect(body, paint)
      ..drawCircle(center.translate(-unit * 0.6, -unit * 0.45), unit * 0.62, paint)
      ..drawCircle(center.translate(unit * 0.35, -unit * 0.6), unit * 0.78, paint);
  }

  @override
  bool shouldRepaint(_CloudsPainter oldDelegate) => false;
}
