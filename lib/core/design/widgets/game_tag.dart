import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/design/game_colors.dart';
import 'package:transport_minister/core/design/game_dimens.dart';

class GameTag extends StatelessWidget {
  const GameTag({super.key, required this.label, this.palette = ChunkyPalette.sunny, this.icon});

  final String label;
  final ChunkyPalette palette;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final tagIcon = icon;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: GameDimens.spaceS, vertical: 3),
      decoration: BoxDecoration(
        color: palette.face,
        borderRadius: BorderRadius.circular(GameDimens.radiusS - 2),
        border: Border.all(color: GameColors.ink, width: GameDimens.outlineThin),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tagIcon != null) ...[
            Icon(tagIcon, size: 14, color: palette.onFace),
            const SizedBox(width: GameDimens.spaceXS),
          ],
          Flexible(
            child: Text(
              _upperCase(Localizations.maybeLocaleOf(context)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                height: 1.1,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: palette.onFace,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _upperCase(Locale? locale) {
    final turkish = locale?.languageCode == 'tr';
    final text = turkish ? label.replaceAll('i', 'İ').replaceAll('ı', 'I') : label;
    return text.toUpperCase();
  }
}
