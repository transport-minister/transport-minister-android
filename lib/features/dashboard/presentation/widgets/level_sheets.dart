import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/city_goal.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class CityGoalSheet extends StatelessWidget {
  const CityGoalSheet({
    super.key,
    required this.cityName,
    required this.city,
    required this.nextCityName,
  });

  final String cityName;
  final CityState city;
  final String? nextCityName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nextCity = nextCityName;
    final technologies = TechnologyId.values.length;
    final happiness = CityGoal.happiness.round();
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MrBusSays(
              mood: MrBusMood.thinking,
              title: l10n.levelSheetTitle(cityName),
              message: l10n.levelSheetBody,
              mascotSize: 64,
            ),
            const SizedBox(height: GameDimens.spaceL),
            Text(l10n.goalTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: GameDimens.spaceS),
            _GoalRow(
              icon: Icons.flag_rounded,
              palette: ChunkyPalette.grape,
              title: l10n.goalLevel(CityLevels.targetLevel),
              progressLabel: l10n.goalLevelProgress(city.level, CityLevels.targetLevel),
              progress: city.level / CityLevels.targetLevel,
              done: CityGoal.levelReached(city),
            ),
            _GoalRow(
              icon: Icons.science_rounded,
              palette: ChunkyPalette.lagoon,
              title: l10n.goalTechnologies,
              progressLabel: l10n.goalTechnologyProgress(city.technologies.length, technologies),
              progress: city.technologies.length / technologies,
              done: CityGoal.everyTechnology(city),
            ),
            _GoalRow(
              icon: Icons.sentiment_very_satisfied_rounded,
              palette: ChunkyPalette.coral,
              title: l10n.goalHappiness(happiness),
              progressLabel: l10n.goalHappinessProgress(city.overallSatisfaction.round()),
              progress: city.overallSatisfaction / CityGoal.happiness,
              done: CityGoal.happy(city),
            ),
            if (nextCity != null && !city.completed) ...[
              const SizedBox(height: GameDimens.spaceXS),
              Text(
                l10n.goalUnlocks(cityName, nextCity),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const SizedBox(height: GameDimens.spaceL),
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

class _GoalRow extends StatelessWidget {
  const _GoalRow({
    required this.icon,
    required this.palette,
    required this.title,
    required this.progressLabel,
    required this.progress,
    required this.done,
  });

  final IconData icon;
  final ChunkyPalette palette;
  final String title;
  final String progressLabel;
  final double progress;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: GameDimens.spaceS),
      child: ChunkyCard(
        depth: 3,
        color: done ? ChunkyPalette.green.glow.withValues(alpha: 0.35) : GameColors.paper,
        padding: const EdgeInsets.all(GameDimens.spaceM),
        child: Row(
          children: [
            IconBubble(
              icon: done ? Icons.check_rounded : icon,
              palette: done ? ChunkyPalette.green : palette,
              size: 40,
            ),
            const SizedBox(width: GameDimens.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(title, style: Theme.of(context).textTheme.titleSmall)),
                      Text(
                        progressLabel,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(height: GameDimens.spaceXS),
                  ChunkyProgressBar(
                    value: progress,
                    palette: done ? ChunkyPalette.green : palette,
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelUpSheet extends StatelessWidget {
  const LevelUpSheet({
    super.key,
    required this.cityName,
    required this.level,
    required this.reward,
    required this.diplomacy,
    required this.budgetRaise,
  });

  final String cityName;
  final int level;
  final int reward;
  final int diplomacy;
  final int budgetRaise;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MrBusSays(
          mood: MrBusMood.excited,
          title: l10n.levelUpTitle(cityName, level),
          message: l10n.levelUpReward(MoneyFormat.compact(reward), diplomacy, budgetRaise),
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

class CityCompleteSheet extends StatelessWidget {
  const CityCompleteSheet({super.key, required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: IconBubble(
            icon: Icons.emoji_events_rounded,
            palette: ChunkyPalette.sunny,
            size: 88,
          ),
        ),
        const SizedBox(height: GameDimens.spaceL),
        MrBusSays(
          mood: MrBusMood.excited,
          title: l10n.cityCompleteTitle(cityName),
          message: l10n.cityCompleteBody,
        ),
        const SizedBox(height: GameDimens.spaceXL),
        ChunkyButton(
          label: l10n.levelUpContinue,
          icon: Icons.celebration_rounded,
          palette: ChunkyPalette.sunny,
          size: ChunkySize.large,
          expanded: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
