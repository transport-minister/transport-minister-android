import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

abstract final class DiamondStyle {
  static const icon = Icons.diamond_rounded;
  static const palette = ChunkyPalette.gem;
}

class DiamondsSheet extends StatelessWidget {
  const DiamondsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rows = [
      (Icons.flag_rounded, ChunkyPalette.grape, l10n.diamondsEarnLevel(DiamondRules.perCityLevel)),
      (
        Icons.emoji_events_rounded,
        ChunkyPalette.sunny,
        l10n.diamondsEarnAchievement(DiamondRules.perAchievement),
      ),
      (
        Icons.redeem_rounded,
        ChunkyPalette.coral,
        l10n.diamondsEarnStreak(DiamondRules.streakFinale),
      ),
      (
        Icons.location_city_rounded,
        ChunkyPalette.green,
        l10n.diamondsEarnCity(DiamondRules.perCityCompleted),
      ),
    ];
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MrBusSays(
              mood: MrBusMood.excited,
              title: l10n.diamondsLabel,
              message: l10n.diamondsBody,
              mascotSize: 64,
            ),
            const SizedBox(height: GameDimens.spaceL),
            Text(l10n.diamondsEarnTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: GameDimens.spaceS),
            for (final (icon, palette, label) in rows)
              Padding(
                padding: const EdgeInsets.only(bottom: GameDimens.spaceS),
                child: ChunkyCard(
                  depth: 3,
                  padding: const EdgeInsets.all(GameDimens.spaceM),
                  child: Row(
                    children: [
                      IconBubble(icon: icon, palette: palette, size: 40),
                      const SizedBox(width: GameDimens.spaceM),
                      Expanded(child: Text(label, style: Theme.of(context).textTheme.titleSmall)),
                      const SizedBox(width: GameDimens.spaceS),
                      const IconBubble(
                        icon: DiamondStyle.icon,
                        palette: DiamondStyle.palette,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: GameDimens.spaceM),
            ChunkyButton(
              label: l10n.commonGotIt,
              expanded: true,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
