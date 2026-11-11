import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CityInfoSheet extends StatelessWidget {
  const CityInfoSheet({
    super.key,
    required this.icon,
    required this.palette,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final ChunkyPalette palette;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: IconBubble(icon: icon, palette: palette, size: 72),
        ),
        const SizedBox(height: GameDimens.spaceL),
        Text(title, textAlign: TextAlign.center, style: textTheme.headlineSmall),
        const SizedBox(height: GameDimens.spaceS),
        Text(
          body,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(color: GameColors.inkSoft),
        ),
        const SizedBox(height: GameDimens.spaceXL),
        ChunkyButton(
          label: AppLocalizations.of(context).commonGotIt,
          expanded: true,
          onPressed: () => context.pop(),
        ),
      ],
    );
  }
}
