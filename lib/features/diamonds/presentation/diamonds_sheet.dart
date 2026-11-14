import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/simulation/catalog/boost_rules.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/presentation/time_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diamonds/application/boosts.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

abstract final class DiamondStyle {
  static const icon = Icons.diamond_rounded;
  static const palette = ChunkyPalette.gem;
}

class DiamondsSheet extends ConsumerWidget {
  const DiamondsSheet({super.key, this.cityId});

  final CityId? cityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final diamonds = ref.watch(profileProvider).value?.diamonds ?? 0;
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
    final city = cityId;
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
            const SizedBox(height: GameDimens.spaceM),
            Center(
              child: StatPill(
                icon: DiamondStyle.icon,
                value: '$diamonds',
                palette: DiamondStyle.palette,
              ),
            ),
            if (city != null) ...[
              const SizedBox(height: GameDimens.spaceL),
              Text(l10n.diamondsSpendTitle, style: textTheme.titleLarge),
              const SizedBox(height: GameDimens.spaceS),
              _BoostCard(cityId: city, diamonds: diamonds),
            ],
            const SizedBox(height: GameDimens.spaceL),
            Text(l10n.diamondsEarnTitle, style: textTheme.titleLarge),
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
                      Expanded(child: Text(label, style: textTheme.titleSmall)),
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

class _BoostCard extends ConsumerWidget {
  const _BoostCard({required this.cityId, required this.diamonds});

  final CityId cityId;
  final int diamonds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final city = ref.watch(cityGameProvider(cityId)).value?.city;
    final secondsLeft = city?.boostSecondsLeft ?? 0;
    return ChunkyCard(
      depth: 3,
      color: DiamondStyle.palette.glow.withValues(alpha: 0.35),
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Row(
        children: [
          const IconBubble(icon: Icons.bolt_rounded, palette: ChunkyPalette.sunny, size: 40),
          const SizedBox(width: GameDimens.spaceM),
          Expanded(child: Text(l10n.boostDouble, style: Theme.of(context).textTheme.titleSmall)),
          const SizedBox(width: GameDimens.spaceS),
          if (secondsLeft > 0)
            GameTag(
              label: TimeTexts.duration(l10n, secondsLeft),
              palette: DiamondStyle.palette,
              icon: Icons.bolt_rounded,
            )
          else
            ChunkyButton(
              label: '${BoostRules.doubleEarningsCost}',
              icon: DiamondStyle.icon,
              palette: DiamondStyle.palette,
              size: ChunkySize.small,
              onPressed: diamonds >= BoostRules.doubleEarningsCost && city != null
                  ? () => ref
                        .read(boostsProvider)
                        .buy(
                          cityId,
                          cost: BoostRules.doubleEarningsCost,
                          command: const CityCommands().boostEarnings,
                        )
                  : null,
            ),
        ],
      ),
    );
  }
}
