import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/city_badge.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/domain/rank_ladder.dart';
import 'package:transport_minister/features/progression/presentation/ministerial_rank_text.dart';
import 'package:transport_minister/features/progression/presentation/progression_texts.dart';
import 'package:transport_minister/features/progression/presentation/widgets/city_badge_medal.dart';
import 'package:transport_minister/features/progression/presentation/widgets/rank_insignia.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final profile = ref.watch(profileProvider).value ?? const MinisterProfile();
    final done = profile.achievements.length;
    return Scaffold(
      body: GameBackdrop(
        child: Column(
          children: [
            GameTopBar(
              title: l10n.profileTitle,
              backLabel: l10n.commonBack,
              onBack: () => context.canPop() ? context.pop() : context.go(AppRoute.cities.path),
              trailing: [
                ChunkyIconButton(
                  icon: Icons.public_rounded,
                  semanticsLabel: l10n.hudBackToCities,
                  onPressed: () => context.go(AppRoute.cities.path),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  GameDimens.spaceL,
                  GameDimens.spaceS,
                  GameDimens.spaceL,
                  GameDimens.spaceXXL,
                ),
                children: [
                  _RankHero(profile: profile),
                  const SizedBox(height: GameDimens.spaceXL),
                  Text(l10n.profileRanks, style: textTheme.titleLarge),
                  const SizedBox(height: GameDimens.spaceM),
                  _RankLadderRow(current: profile.rank),
                  const SizedBox(height: GameDimens.spaceXL),
                  Text(l10n.profileCityBadges, style: textTheme.titleLarge),
                  const SizedBox(height: GameDimens.spaceM),
                  Wrap(
                    spacing: GameDimens.spaceS,
                    runSpacing: GameDimens.spaceM,
                    children: [
                      for (final city in CityId.values)
                        CityBadgeMedal(
                          city: city,
                          tier: BadgeTier.forLevel(profile.bestLevelIn(city)),
                        ),
                    ],
                  ),
                  const SizedBox(height: GameDimens.spaceXL),
                  Text(
                    l10n.profileAchievements(done, AchievementId.values.length),
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: GameDimens.spaceM),
                  for (final achievement in AchievementId.values) ...[
                    _AchievementTile(
                      achievement: achievement,
                      unlocked: profile.achievements.contains(achievement),
                    ),
                    const SizedBox(height: GameDimens.spaceS),
                  ],
                  const SizedBox(height: GameDimens.spaceL),
                  Text(l10n.profileCareer, style: textTheme.titleLarge),
                  const SizedBox(height: GameDimens.spaceM),
                  _CareerGrid(profile: profile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RankHero extends StatelessWidget {
  const _RankHero({required this.profile});

  final MinisterProfile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final next = RankLadder.next(profile.rank);
    final nextRequirement = next == null ? null : RankLadder.requirementFor(next);
    return ChunkyCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              RankInsignia(rank: profile.rank, size: 84),
              const SizedBox(width: GameDimens.spaceL),
              Expanded(child: Text(profile.rank.title(l10n), style: textTheme.headlineSmall)),
            ],
          ),
          const SizedBox(height: GameDimens.spaceL),
          Text(l10n.profileReputation, style: textTheme.titleSmall),
          const SizedBox(height: GameDimens.spaceXS),
          ChunkyProgressBar(
            value: profile.reputation / 100,
            palette: ChunkyPalette.bubblegum,
            label: '${profile.reputation.round()}%',
          ),
          const SizedBox(height: GameDimens.spaceM),
          ChunkyProgressBar(
            value: nextRequirement == null ? 1 : profile.xp / nextRequirement.xp,
            palette: ChunkyPalette.grape,
            label: nextRequirement == null
                ? l10n.profileXpMax(MoneyFormat.count(profile.xp))
                : l10n.profileXp(
                    MoneyFormat.count(profile.xp),
                    MoneyFormat.count(nextRequirement.xp),
                  ),
          ),
          if (next != null && nextRequirement != null) ...[
            const SizedBox(height: GameDimens.spaceS),
            Text(
              l10n.profileNextRank(next.title(l10n), nextRequirement.reputation.round()),
              style: textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}

class _RankLadderRow extends StatelessWidget {
  const _RankLadderRow({required this.current});

  final MinisterialRank current;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: 124,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: MinisterialRank.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: GameDimens.spaceM),
        itemBuilder: (context, index) {
          final rank = MinisterialRank.values[index];
          return SizedBox(
            width: 78,
            child: Column(
              children: [
                RankInsignia(rank: rank, size: 50, locked: !current.isAtLeast(rank)),
                const SizedBox(height: GameDimens.spaceXS),
                Text(
                  rank.title(l10n),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.5,
                    height: 1.1,
                    fontWeight: rank == current ? FontWeight.w700 : FontWeight.w500,
                    color: current.isAtLeast(rank) ? GameColors.ink : GameColors.inkFaint,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AchievementTile extends StatelessWidget {
  const _AchievementTile({required this.achievement, required this.unlocked});

  final AchievementId achievement;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ChunkyCard(
      color: unlocked ? GameColors.paper : GameColors.sand,
      depth: 3,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Row(
        children: [
          IconBubble(
            icon: unlocked ? achievement.icon : Icons.lock_rounded,
            palette: unlocked ? achievement.palette : ChunkyPalette.stone,
            size: 44,
          ),
          const SizedBox(width: GameDimens.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(achievement.title(l10n), style: Theme.of(context).textTheme.titleMedium),
                Text(achievement.description(l10n), style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: GameDimens.spaceS),
          GameTag(
            label: '+${achievement.xp} XP',
            palette: unlocked ? ChunkyPalette.grape : ChunkyPalette.snow,
          ),
        ],
      ),
    );
  }
}

class _CareerGrid extends StatelessWidget {
  const _CareerGrid({required this.profile});

  final MinisterProfile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final career = profile.career;
    final stats = [
      (Icons.calendar_month_rounded, l10n.careerDays, career.daysServed, ChunkyPalette.sunny),
      (Icons.directions_bus_rounded, l10n.careerBuses, career.busesBought, ChunkyPalette.ocean),
      (Icons.upgrade_rounded, l10n.careerUpgrades, career.busUpgrades, ChunkyPalette.grape),
      (
        Icons.construction_rounded,
        l10n.careerProjects,
        career.projectsCompleted,
        ChunkyPalette.tangerine,
      ),
      (Icons.shield_rounded, l10n.careerCrises, career.crisesAverted, ChunkyPalette.lagoon),
      (Icons.how_to_vote_rounded, l10n.careerDecisions, career.decisionsMade, ChunkyPalette.ocean),
      (
        Icons.thunderstorm_rounded,
        l10n.careerDisasters,
        career.disastersHandled,
        ChunkyPalette.coral,
      ),
      (Icons.gavel_rounded, l10n.careerDismissals, career.dismissals, ChunkyPalette.coral),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = (constraints.maxWidth - GameDimens.spaceM) / 2;
        return Wrap(
          spacing: GameDimens.spaceM,
          runSpacing: GameDimens.spaceM,
          children: [
            for (final (icon, label, value, palette) in stats)
              SizedBox(
                width: width,
                child: ChunkyCard(
                  depth: 3,
                  padding: const EdgeInsets.all(GameDimens.spaceS),
                  child: Row(
                    children: [
                      IconBubble(icon: icon, palette: palette, size: 34),
                      const SizedBox(width: GameDimens.spaceS),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MoneyFormat.count(value),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
