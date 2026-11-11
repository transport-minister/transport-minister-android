import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';

class RankInsignia extends StatelessWidget {
  const RankInsignia({super.key, required this.rank, this.size = 56, this.locked = false});

  final MinisterialRank rank;
  final double size;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(size, size * 1.12), painter: _InsigniaPainter(rank, locked));
  }
}

class _InsigniaPainter extends CustomPainter {
  const _InsigniaPainter(this.rank, this.locked);

  final MinisterialRank rank;
  final bool locked;

  static const _gold = Color(0xFFFFD84D);
  static const _silver = Color(0xFFEFF3F8);

  ChunkyPalette get _palette {
    if (locked) {
      return ChunkyPalette.stone;
    }
    if (rank.level <= 3) {
      return ChunkyPalette.ocean;
    }
    return rank.level <= 6 ? ChunkyPalette.grape : ChunkyPalette.sunny;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final stroke = w * 0.05;
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeJoin = StrokeJoin.round
      ..color = GameColors.ink;
    final shield = Path()
      ..moveTo(w * 0.12, h * 0.08)
      ..lineTo(w * 0.88, h * 0.08)
      ..quadraticBezierTo(w * 0.94, h * 0.08, w * 0.94, h * 0.16)
      ..lineTo(w * 0.94, h * 0.5)
      ..quadraticBezierTo(w * 0.92, h * 0.78, w * 0.5, h * 0.96)
      ..quadraticBezierTo(w * 0.08, h * 0.78, w * 0.06, h * 0.5)
      ..lineTo(w * 0.06, h * 0.16)
      ..quadraticBezierTo(w * 0.06, h * 0.08, w * 0.12, h * 0.08)
      ..close();
    final palette = _palette;
    canvas
      ..drawPath(shield.shift(Offset(0, h * 0.035)), Paint()..color = GameColors.ink)
      ..drawPath(
        shield,
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [palette.glow, palette.face, palette.face, palette.deep],
            stops: const [0.15, 0.15, 0.6, 0.6],
          ).createShader(Offset.zero & size),
      )
      ..drawPath(shield, outline);

    final symbol = locked ? ChunkyPalette.stone.lip : (rank.level >= 7 ? GameColors.ink : _gold);
    final level = rank.level;
    if (level <= 3) {
      for (var index = 0; index < level; index++) {
        _chevron(canvas, w, h * (0.3 + index * 0.17), symbol, stroke);
      }
    } else {
      final stars = level <= 6 ? level - 3 : level - 6;
      final color = locked ? symbol : (level <= 6 ? _silver : GameColors.ink);
      _stars(canvas, w, h, stars, color, stroke);
      if (level >= 7) {
        _laurel(canvas, w, h, locked ? symbol : GameColors.ink, stroke);
      }
    }
  }

  void _chevron(Canvas canvas, double w, double y, Color color, double stroke) {
    final path = Path()
      ..moveTo(w * 0.24, y)
      ..lineTo(w * 0.5, y + w * 0.16)
      ..lineTo(w * 0.76, y)
      ..lineTo(w * 0.76, y + w * 0.1)
      ..lineTo(w * 0.5, y + w * 0.26)
      ..lineTo(w * 0.24, y + w * 0.1)
      ..close();
    canvas
      ..drawPath(path, Paint()..color = color)
      ..drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke * 0.6
          ..strokeJoin = StrokeJoin.round
          ..color = GameColors.ink,
      );
  }

  void _stars(Canvas canvas, double w, double h, int count, Color color, double stroke) {
    final centers = switch (count) {
      1 => [Offset(w * 0.5, h * 0.42)],
      2 => [Offset(w * 0.33, h * 0.42), Offset(w * 0.67, h * 0.42)],
      _ => [Offset(w * 0.5, h * 0.32), Offset(w * 0.3, h * 0.55), Offset(w * 0.7, h * 0.55)],
    };
    final radius = count == 1 ? w * 0.2 : w * 0.14;
    for (final center in centers) {
      final star = _starPath(center, radius);
      canvas
        ..drawPath(star, Paint()..color = color)
        ..drawPath(
          star,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = stroke * 0.55
            ..strokeJoin = StrokeJoin.round
            ..color = color == GameColors.ink ? _gold : GameColors.ink,
        );
    }
  }

  void _laurel(Canvas canvas, double w, double h, Color color, double stroke) {
    final leaf = Paint()..color = color;
    for (final side in [-1.0, 1.0]) {
      for (var index = 0; index < 4; index++) {
        final t = index / 3;
        final center = Offset(w * (0.5 + side * (0.12 + t * 0.2)), h * (0.84 - t * 0.14));
        canvas
          ..save()
          ..translate(center.dx, center.dy)
          ..rotate(side * (0.6 + t * 0.5))
          ..drawOval(Rect.fromCenter(center: Offset.zero, width: w * 0.07, height: w * 0.13), leaf)
          ..restore();
      }
    }
  }

  Path _starPath(Offset center, double radius) {
    final path = Path();
    for (var point = 0; point < 10; point++) {
      final angle = -math.pi / 2 + point * math.pi / 5;
      final distance = point.isEven ? radius : radius * 0.45;
      final vertex = center + Offset(math.cos(angle), math.sin(angle)) * distance;
      point == 0 ? path.moveTo(vertex.dx, vertex.dy) : path.lineTo(vertex.dx, vertex.dy);
    }
    return path..close();
  }

  @override
  bool shouldRepaint(_InsigniaPainter oldDelegate) =>
      oldDelegate.rank != rank || oldDelegate.locked != locked;
}
