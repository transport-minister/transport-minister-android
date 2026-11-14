import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';

class ConfettiBurst extends StatefulWidget {
  const ConfettiBurst({super.key, this.pieces = 60, this.duration = const Duration(seconds: 3)});

  final int pieces;
  final Duration duration;

  @override
  State<ConfettiBurst> createState() => _ConfettiBurstState();
}

class _ConfettiBurstState extends State<ConfettiBurst> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, duration: widget.duration);
  late final _pieces = List.generate(widget.pieces, (index) => _Piece(math.Random(index * 31)));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!MediaQuery.disableAnimationsOf(context) && !_controller.isAnimating) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(painter: _ConfettiPainter(_controller, _pieces), size: Size.infinite),
    );
  }
}

class _Piece {
  _Piece(math.Random random)
    : x = random.nextDouble(),
      drift = (random.nextDouble() - 0.5) * 0.3,
      delay = random.nextDouble() * 0.3,
      spin = random.nextDouble() * 8,
      size = 6 + random.nextDouble() * 6,
      color = _colors[random.nextInt(_colors.length)];

  static const _colors = [
    ChunkyPalette.sunny,
    ChunkyPalette.coral,
    ChunkyPalette.ocean,
    ChunkyPalette.green,
    ChunkyPalette.grape,
    ChunkyPalette.bubblegum,
  ];

  final double x;
  final double drift;
  final double delay;
  final double spin;
  final double size;
  final ChunkyPalette color;
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter(this.progress, this.pieces) : super(repaint: progress);

  final Animation<double> progress;
  final List<_Piece> pieces;

  @override
  void paint(Canvas canvas, Size size) {
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = GameColors.ink;
    for (final piece in pieces) {
      final t = ((progress.value - piece.delay) / (1 - piece.delay)).clamp(0.0, 1.0);
      if (t == 0 || t == 1) {
        continue;
      }
      final fall = Curves.easeIn.transform(t);
      final x = size.width * (piece.x + piece.drift * math.sin(t * math.pi * 2));
      final y = -20 + (size.height + 40) * fall;
      canvas
        ..save()
        ..translate(x, y)
        ..rotate(piece.spin * t * math.pi)
        ..scale(1, 0.4 + 0.6 * math.cos(t * math.pi * 4).abs());
      final rect = Rect.fromCenter(
        center: Offset.zero,
        width: piece.size,
        height: piece.size * 0.6,
      );
      canvas
        ..drawRect(rect, Paint()..color = piece.color.face)
        ..drawRect(rect, outline)
        ..restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) => false;
}
