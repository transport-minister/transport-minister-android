import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';

class MrBusSays extends StatelessWidget {
  const MrBusSays({
    super.key,
    required this.message,
    this.title,
    this.mood = MrBusMood.happy,
    this.mascotSize = 88,
  });

  final String message;
  final String? title;
  final MrBusMood mood;
  final double mascotSize;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final heading = title;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MrBus(mood: mood, size: mascotSize),
        const SizedBox(width: GameDimens.spaceXS),
        Expanded(
          child: CustomPaint(
            painter: const _BubbleTailPainter(),
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(GameDimens.spaceM),
              decoration: BoxDecoration(
                color: GameColors.paper,
                borderRadius: BorderRadius.circular(GameDimens.radiusL),
                border: Border.all(color: GameColors.ink, width: GameDimens.outline),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (heading != null) ...[
                    Text(heading, style: textTheme.titleLarge),
                    const SizedBox(height: GameDimens.spaceXS),
                  ],
                  Text(message, style: textTheme.bodyLarge),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BubbleTailPainter extends CustomPainter {
  const _BubbleTailPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final tip = Offset(0, size.height - 18);
    final tail = Path()
      ..moveTo(tip.dx, tip.dy)
      ..lineTo(12, size.height - 34)
      ..lineTo(12, size.height - 12)
      ..close();
    canvas
      ..drawPath(tail, Paint()..color = GameColors.ink)
      ..drawPath(tail.shift(const Offset(4, 0)), Paint()..color = GameColors.paper);
  }

  @override
  bool shouldRepaint(_BubbleTailPainter oldDelegate) => false;
}
