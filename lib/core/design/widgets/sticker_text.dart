import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_colors.dart';

class StickerText extends StatelessWidget {
  const StickerText(
    this.text, {
    super.key,
    this.fontSize = 40,
    this.color = GameColors.paper,
    this.outlineColor = GameColors.ink,
    this.textAlign = TextAlign.center,
  });

  final String text;
  final double fontSize;
  final Color color;
  final Color outlineColor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final base = TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, height: 1.05);
    final stroke = fontSize * 0.16;
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(0, stroke * 0.9),
          child: Text(
            text,
            textAlign: textAlign,
            style: base.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = stroke
                ..strokeJoin = StrokeJoin.round
                ..color = outlineColor,
            ),
          ),
        ),
        Text(
          text,
          textAlign: textAlign,
          style: base.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = stroke
              ..strokeJoin = StrokeJoin.round
              ..color = outlineColor,
          ),
        ),
        Text(
          text,
          textAlign: textAlign,
          style: base.copyWith(color: color),
        ),
      ],
    );
  }
}
