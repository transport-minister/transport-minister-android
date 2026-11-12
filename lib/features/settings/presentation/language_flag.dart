import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/features/settings/domain/app_language.dart';

class LanguageFlag extends StatelessWidget {
  const LanguageFlag({super.key, required this.language, this.size = 44});

  final AppLanguage language;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(BorderSide(color: GameColors.ink, width: GameDimens.outline)),
        boxShadow: [BoxShadow(color: GameColors.ink, offset: Offset(0, 3))],
      ),
      child: ClipOval(child: CustomPaint(painter: _FlagPainter(language))),
    );
  }
}

class _FlagPainter extends CustomPainter {
  const _FlagPainter(this.language);

  final AppLanguage language;

  @override
  void paint(Canvas canvas, Size size) {
    switch (language) {
      case AppLanguage.english:
        _paintUnion(canvas, size);
      case AppLanguage.turkish:
        _paintTurkey(canvas, size);
      case AppLanguage.russian:
        _paintRussia(canvas, size);
    }
  }

  void _paintUnion(Canvas canvas, Size size) {
    const blue = Color(0xFF012169);
    const red = Color(0xFFC8102E);
    final unit = size.height / 30;
    final flag = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: unit * 60,
      height: unit * 30,
    );
    canvas.drawRect(flag, Paint()..color = blue);
    void diagonals(Color color, double width) {
      final paint = Paint()
        ..color = color
        ..strokeWidth = width;
      canvas
        ..drawLine(flag.topLeft, flag.bottomRight, paint)
        ..drawLine(flag.bottomLeft, flag.topRight, paint);
    }

    void cross(Color color, double width) {
      final paint = Paint()..color = color;
      canvas
        ..drawRect(Rect.fromCenter(center: flag.center, width: flag.width, height: width), paint)
        ..drawRect(Rect.fromCenter(center: flag.center, width: width, height: flag.height), paint);
    }

    diagonals(Colors.white, unit * 6);
    diagonals(red, unit * 2);
    cross(Colors.white, unit * 10);
    cross(red, unit * 6);
  }

  void _paintTurkey(Canvas canvas, Size size) {
    const red = Color(0xFFE30A17);
    final side = size.width;
    final white = Paint()..color = Colors.white;
    canvas
      ..drawRect(Offset.zero & size, Paint()..color = red)
      ..drawCircle(Offset(side * 0.4, side / 2), side * 0.25, white)
      ..drawCircle(Offset(side * 0.465, side / 2), side * 0.2, Paint()..color = red)
      ..drawPath(_star(Offset(side * 0.67, side / 2), side * 0.125, side * 0.05), white);
  }

  void _paintRussia(Canvas canvas, Size size) {
    final stripe = size.height / 3;
    for (final (index, color) in const [
      Colors.white,
      Color(0xFF0039A6),
      Color(0xFFD52B1E),
    ].indexed) {
      canvas.drawRect(
        Rect.fromLTWH(0, stripe * index, size.width, stripe + 0.5),
        Paint()..color = color,
      );
    }
  }

  Path _star(Offset center, double outer, double inner) {
    final path = Path();
    for (var point = 0; point < 10; point++) {
      final radius = point.isEven ? outer : inner;
      final angle = math.pi + point * math.pi / 5;
      final offset = center + Offset(math.cos(angle) * radius, math.sin(angle) * radius);
      point == 0 ? path.moveTo(offset.dx, offset.dy) : path.lineTo(offset.dx, offset.dy);
    }
    return path..close();
  }

  @override
  bool shouldRepaint(_FlagPainter oldDelegate) => oldDelegate.language != language;
}
