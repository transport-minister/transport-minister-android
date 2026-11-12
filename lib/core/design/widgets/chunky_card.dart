import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';
import 'package:transport_minister/core/design/widgets/pressable_builder.dart';

class ChunkyCard extends StatelessWidget {
  const ChunkyCard({
    super.key,
    required this.child,
    this.color = GameColors.paper,
    this.padding = const EdgeInsets.all(GameDimens.spaceL),
    this.radius = GameDimens.radiusL,
    this.depth = GameDimens.depth,
    this.onPressed,
    this.semanticsLabel,
  });

  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double radius;
  final double depth;
  final VoidCallback? onPressed;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final onPressed = this.onPressed;
    if (onPressed == null) {
      return _face(pressed: false);
    }
    return PressableBuilder(
      onPressed: onPressed,
      semanticsLabel: semanticsLabel,
      pressedScale: 0.98,
      builder: (context, pressed) => _face(pressed: pressed),
    );
  }

  Widget _face({required bool pressed}) {
    return AnimatedContainer(
      duration: GameDimens.pressDuration,
      curve: Curves.easeOut,
      margin: EdgeInsets.only(top: pressed ? depth : 0, bottom: pressed ? 0 : depth),
      padding: padding,
      decoration: BoxDecoration(
        color: Color.alphaBlend(color, GameColors.paper),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: GameColors.ink, width: GameDimens.outline),
        boxShadow: [BoxShadow(color: GameColors.ink, offset: Offset(0, pressed ? 0 : depth))],
      ),
      child: child,
    );
  }
}
