import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';

class IconBubble extends StatelessWidget {
  const IconBubble({
    super.key,
    required this.icon,
    this.palette = ChunkyPalette.green,
    this.size = 40,
  });

  final IconData icon;
  final ChunkyPalette palette;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: GameColors.ink, width: GameDimens.outline),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [palette.glow, palette.face, palette.face, palette.deep],
          stops: const [0.18, 0.18, 0.7, 0.7],
        ),
      ),
      child: Icon(
        icon,
        size: size * 0.54,
        color: palette.onFace,
        shadows: palette.needsTextShadow
            ? const [Shadow(color: GameColors.textShadow, offset: Offset(0, 1))]
            : null,
      ),
    );
  }
}
