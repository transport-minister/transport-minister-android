import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';

class TapBurst extends StatefulWidget {
  const TapBurst({super.key, required this.onDone});

  final VoidCallback onDone;

  static const size = 84.0;
  static const duration = Duration(milliseconds: 420);

  static void show(BuildContext context, Offset globalPosition) {
    final overlay = Overlay.maybeOf(context);
    if (overlay == null || (MediaQuery.maybeDisableAnimationsOf(context) ?? false)) {
      return;
    }
    final box = overlay.context.findRenderObject();
    if (box is! RenderBox) {
      return;
    }
    final center = box.globalToLocal(globalPosition);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: center.dx - size / 2,
        top: center.dy - size / 2,
        child: IgnorePointer(child: TapBurst(onDone: entry.remove)),
      ),
    );
    overlay.insert(entry);
  }

  @override
  State<TapBurst> createState() => _TapBurstState();
}

class _TapBurstState extends State<TapBurst> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, duration: TapBurst.duration)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onDone();
      }
    })
    ..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size.square(TapBurst.size), painter: _BurstPainter(_controller));
  }
}

class _BurstPainter extends CustomPainter {
  _BurstPainter(this.progress) : super(repaint: progress);

  final Animation<double> progress;

  static const _colors = [
    ChunkyPalette.sunny,
    ChunkyPalette.coral,
    ChunkyPalette.ocean,
    ChunkyPalette.green,
    ChunkyPalette.grape,
    ChunkyPalette.bubblegum,
    ChunkyPalette.lagoon,
    ChunkyPalette.tangerine,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final t = progress.value;
    final travel = Curves.easeOutCubic.transform(t);
    final fade = 1 - t * t;
    final center = size.center(Offset.zero);
    canvas.drawCircle(
      center,
      6 + travel * 18,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3 * (1 - t)
        ..color = GameColors.ink.withValues(alpha: 0.5 * fade),
    );
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = GameColors.ink.withValues(alpha: fade);
    for (var index = 0; index < _colors.length; index++) {
      final angle = (index + 0.5) / _colors.length * math.pi * 2;
      final spot = center + Offset(math.cos(angle), math.sin(angle)) * (14 + travel * 26);
      final radius = 4.5 * (1 - t * 0.5);
      canvas
        ..drawCircle(spot, radius, Paint()..color = _colors[index].face.withValues(alpha: fade))
        ..drawCircle(spot, radius, outline);
    }
  }

  @override
  bool shouldRepaint(_BurstPainter oldDelegate) => false;
}
