import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';
import 'package:transport_minister/core/design/widgets/chunky_slab.dart';
import 'package:transport_minister/core/design/widgets/pressable_builder.dart';

class ChunkyIconButton extends StatelessWidget {
  const ChunkyIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.semanticsLabel,
    this.palette = ChunkyPalette.snow,
    this.size = 46,
    this.badge,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String semanticsLabel;
  final ChunkyPalette palette;
  final double size;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final badgeText = badge;
    return PressableBuilder(
      onPressed: onPressed,
      semanticsLabel: semanticsLabel,
      pressedScale: 0.9,
      builder: (context, pressed) => Stack(
        clipBehavior: Clip.none,
        children: [
          ChunkySlab(
            palette: onPressed == null ? ChunkyPalette.stone : palette,
            pressed: pressed,
            radius: GameDimens.radiusM,
            height: size,
            width: size,
            child: Center(
              child: Icon(icon, size: size * 0.52, color: palette.onFace),
            ),
          ),
          if (badgeText != null) Positioned(top: -6, right: -6, child: _Badge(text: badgeText)),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 22),
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ChunkyPalette.coral.face,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: GameColors.paper,
          height: 1,
        ),
      ),
    );
  }
}
