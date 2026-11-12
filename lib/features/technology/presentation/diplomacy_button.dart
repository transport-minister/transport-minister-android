import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DiplomacyButton extends StatelessWidget {
  const DiplomacyButton({
    super.key,
    required this.points,
    required this.ready,
    required this.onPressed,
  });

  final int points;
  final bool ready;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PressableBuilder(
      onPressed: onPressed,
      semanticsLabel: AppLocalizations.of(context).diplomacyOpen,
      builder: (context, pressed) => AnimatedScale(
        scale: pressed ? 0.93 : 1,
        duration: GameDimens.pressDuration,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(3, 3, 10, 3),
              decoration: BoxDecoration(
                color: GameColors.paper,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: GameColors.ink, width: GameDimens.outline),
                boxShadow: const [BoxShadow(color: GameColors.ink, offset: Offset(0, 3))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const IconBubble(
                    icon: Icons.handshake_rounded,
                    palette: ChunkyPalette.lagoon,
                    size: 34,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '$points',
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, height: 1),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.science_rounded, size: 20, color: ChunkyPalette.lagoon.lip),
                ],
              ),
            ),
            if (ready)
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ChunkyPalette.coral.face,
                    shape: BoxShape.circle,
                    border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
