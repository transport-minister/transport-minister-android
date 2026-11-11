import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/widgets/chunky_slab.dart';
import 'package:transport_minister/core/design/widgets/pressable_builder.dart';

enum ChunkySize {
  small(height: 40, fontSize: 15, iconSize: 18, depth: 3, padding: 14, radius: 12),
  medium(height: 52, fontSize: 18, iconSize: 22, depth: 4, padding: 20, radius: 16),
  large(height: 62, fontSize: 22, iconSize: 26, depth: 5, padding: 26, radius: 20);

  const ChunkySize({
    required this.height,
    required this.fontSize,
    required this.iconSize,
    required this.depth,
    required this.padding,
    required this.radius,
  });

  final double height;
  final double fontSize;
  final double iconSize;
  final double depth;
  final double padding;
  final double radius;
}

class ChunkyButton extends StatelessWidget {
  const ChunkyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.palette = ChunkyPalette.green,
    this.size = ChunkySize.medium,
    this.expanded = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final ChunkyPalette palette;
  final ChunkySize size;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final effectivePalette = onPressed == null ? ChunkyPalette.stone : palette;
    return PressableBuilder(
      onPressed: onPressed,
      semanticsLabel: label,
      builder: (context, pressed) => ChunkySlab(
        palette: effectivePalette,
        pressed: pressed,
        depth: size.depth,
        radius: size.radius,
        height: size.height,
        width: expanded ? double.infinity : null,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.padding),
          child: Row(
            mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: size.iconSize,
                  color: effectivePalette.onFace,
                  shadows: _shadowsFor(effectivePalette),
                ),
                SizedBox(width: size.padding / 2),
              ],
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: size.fontSize,
                    fontWeight: FontWeight.w700,
                    color: effectivePalette.onFace,
                    shadows: _shadowsFor(effectivePalette),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Shadow>? _shadowsFor(ChunkyPalette palette) {
    if (!palette.needsTextShadow) {
      return null;
    }
    return const [Shadow(color: GameColors.textShadow, offset: Offset(0, 1.5))];
  }
}
