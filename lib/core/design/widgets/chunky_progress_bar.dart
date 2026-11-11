import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';

class ChunkyProgressBar extends StatelessWidget {
  const ChunkyProgressBar({
    super.key,
    required this.value,
    this.palette = ChunkyPalette.green,
    this.height = 20,
    this.label,
  });

  final double value;
  final ChunkyPalette palette;
  final double height;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final text = label;
    return TweenAnimationBuilder<double>(
      tween: Tween(end: value.clamp(0, 1).toDouble()),
      duration: GameDimens.fillDuration,
      curve: Curves.easeOutCubic,
      builder: (context, animatedValue, child) => Container(
        height: height,
        decoration: BoxDecoration(
          color: GameColors.sand,
          borderRadius: BorderRadius.circular(height / 2),
          border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: animatedValue,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        palette.glow,
                        palette.glow,
                        palette.face,
                        palette.face,
                        palette.deep,
                      ],
                      stops: const [0, 0.25, 0.25, 0.7, 0.7],
                    ),
                  ),
                ),
              ),
              if (text != null)
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: height * 0.6,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      color: GameColors.ink,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
