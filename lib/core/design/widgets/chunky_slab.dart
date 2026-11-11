import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';

class ChunkySlab extends StatelessWidget {
  const ChunkySlab({
    super.key,
    required this.palette,
    required this.child,
    this.pressed = false,
    this.depth = GameDimens.depth,
    this.radius = GameDimens.radiusM,
    this.height,
    this.width,
  });

  final ChunkyPalette palette;
  final Widget child;
  final bool pressed;
  final double depth;
  final double radius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final slabHeight = height;
    return SizedBox(
      width: width,
      height: slabHeight == null ? null : slabHeight + depth,
      child: AnimatedContainer(
        duration: GameDimens.pressDuration,
        curve: Curves.easeOut,
        margin: EdgeInsets.only(top: pressed ? depth : 0, bottom: pressed ? 0 : depth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: GameColors.ink, width: GameDimens.outline),
          boxShadow: [BoxShadow(color: GameColors.ink, offset: Offset(0, pressed ? 0 : depth))],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              palette.glow,
              palette.glow,
              palette.face,
              palette.face,
              palette.deep,
              palette.deep,
              palette.lip,
              palette.lip,
            ],
            stops: const [0, 0.1, 0.1, 0.5, 0.5, 0.82, 0.82, 1],
          ),
        ),
        child: child,
      ),
    );
  }
}
