import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';
import 'package:transport_minister/core/design/widgets/icon_bubble.dart';
import 'package:transport_minister/core/design/widgets/pressable_builder.dart';

class StatPill extends StatelessWidget {
  const StatPill({
    super.key,
    required this.icon,
    required this.value,
    this.palette = ChunkyPalette.green,
    this.onPressed,
  });

  final IconData icon;
  final String value;
  final ChunkyPalette palette;
  final VoidCallback? onPressed;

  static const _height = 34.0;
  static const _bubble = 40.0;

  @override
  Widget build(BuildContext context) {
    final pill = SizedBox(
      height: _bubble,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: _height,
            margin: const EdgeInsets.only(left: _bubble / 2),
            padding: const EdgeInsets.only(left: _bubble / 2 + 6, right: GameDimens.spaceM),
            decoration: BoxDecoration(
              color: GameColors.paper,
              borderRadius: BorderRadius.circular(_height / 2),
              border: Border.all(color: GameColors.ink, width: GameDimens.outline),
              boxShadow: const [BoxShadow(color: GameColors.ink, offset: Offset(0, 2.5))],
            ),
            child: Center(
              widthFactor: 1,
              child: Text(
                value,
                maxLines: 1,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, height: 1),
              ),
            ),
          ),
          IconBubble(icon: icon, palette: palette, size: _bubble),
        ],
      ),
    );
    final onPressed = this.onPressed;
    if (onPressed == null) {
      return pill;
    }
    return PressableBuilder(
      onPressed: onPressed,
      semanticsLabel: value,
      builder: (context, pressed) =>
          AnimatedScale(scale: pressed ? 0.94 : 1, duration: GameDimens.pressDuration, child: pill),
    );
  }
}
