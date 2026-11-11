import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class LevelInfoSheet extends StatelessWidget {
  const LevelInfoSheet({
    super.key,
    required this.cityName,
    required this.level,
    required this.nextCityName,
  });

  final String cityName;
  final int level;
  final String? nextCityName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nextCity = nextCityName;
    final targetLine = level >= CityLevels.targetLevel
        ? l10n.levelSheetTargetDone
        : (nextCity == null ? '' : l10n.levelSheetTarget(CityLevels.targetLevel, nextCity));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MrBusSays(
          mood: MrBusMood.thinking,
          title: l10n.levelSheetTitle(cityName),
          message: l10n.levelSheetBody,
        ),
        if (targetLine.isNotEmpty) ...[
          const SizedBox(height: GameDimens.spaceL),
          ChunkyCard(
            color: ChunkyPalette.sunny.glow,
            depth: 3,
            padding: const EdgeInsets.all(GameDimens.spaceM),
            child: Row(
              children: [
                const IconBubble(icon: Icons.flag_rounded, palette: ChunkyPalette.sunny, size: 36),
                const SizedBox(width: GameDimens.spaceM),
                Expanded(child: Text(targetLine, style: Theme.of(context).textTheme.titleMedium)),
              ],
            ),
          ),
        ],
        const SizedBox(height: GameDimens.spaceXL),
        ChunkyButton(
          label: l10n.commonGotIt,
          expanded: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

class LevelUpSheet extends StatelessWidget {
  const LevelUpSheet({
    super.key,
    required this.cityName,
    required this.level,
    required this.reward,
    required this.unlockedCityName,
  });

  final String cityName;
  final int level;
  final int reward;
  final String? unlockedCityName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final unlocked = unlockedCityName;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MrBusSays(
          mood: MrBusMood.excited,
          title: l10n.levelUpTitle(cityName, level),
          message: [
            l10n.levelUpReward(MoneyFormat.compact(reward)),
            if (unlocked != null) l10n.levelUpUnlocked(unlocked),
          ].join('\n'),
        ),
        const SizedBox(height: GameDimens.spaceXL),
        ChunkyButton(
          label: l10n.levelUpContinue,
          icon: Icons.celebration_rounded,
          palette: ChunkyPalette.grape,
          size: ChunkySize.large,
          expanded: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
