import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diplomacy/presentation/diplomacy_texts.dart';
import 'package:transport_minister/features/technology/presentation/technology_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class TechnologyScreen extends ConsumerWidget {
  const TechnologyScreen({super.key, required this.cityId});

  final CityId cityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final city = ref.watch(cityGameProvider(cityId)).value?.city;
    return Scaffold(
      body: GameBackdrop(
        child: Column(
          children: [
            GameTopBar(
              title: l10n.technologyTitle,
              backLabel: l10n.commonBack,
              onBack: () => context.pop(),
            ),
            if (city != null)
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    GameDimens.spaceL,
                    GameDimens.spaceS,
                    GameDimens.spaceL,
                    GameDimens.spaceXXL,
                  ),
                  children: [
                    Row(
                      children: [
                        StatPill(
                          icon: DiplomacyStyle.icon,
                          value: '${city.diplomacyPoints}',
                          palette: ChunkyPalette.lagoon,
                        ),
                        const SizedBox(width: GameDimens.spaceM),
                        StatPill(
                          icon: Icons.account_balance_wallet_rounded,
                          value: MoneyFormat.compact(city.budget),
                        ),
                      ],
                    ),
                    const SizedBox(height: GameDimens.spaceL),
                    MrBusSays(
                      message: l10n.technologyIntro,
                      mood: MrBusMood.thinking,
                      mascotSize: 64,
                    ),
                    for (final branch in TechBranch.values) ...[
                      const SizedBox(height: GameDimens.spaceXL),
                      Text(branch.label(l10n), style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: GameDimens.spaceM),
                      for (final technology in TechnologyId.values.where(
                        (technology) => technology.branch == branch,
                      )) ...[
                        if (technology.requires != null) const _Connector(),
                        _TechnologyCard(
                          technology: technology,
                          city: city,
                          onUnlock: () => ref
                              .read(cityGameProvider(cityId).notifier)
                              .perform(
                                (city) => const CityCommands().unlockTechnology(city, technology),
                              ),
                        ),
                      ],
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Connector extends StatelessWidget {
  const _Connector();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(width: 5, height: 18, color: GameColors.ink),
      ),
    );
  }
}

class _TechnologyCard extends StatelessWidget {
  const _TechnologyCard({required this.technology, required this.city, required this.onUnlock});

  final TechnologyId technology;
  final CityState city;
  final VoidCallback onUnlock;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final unlocked = city.technologies.contains(technology);
    final problem = const CityCommands().technologyProblem(city, technology);
    final prerequisite = technology.requires;
    final waiting = prerequisite != null && !city.has(prerequisite);
    return ChunkyCard(
      depth: 3,
      color: unlocked
          ? ChunkyPalette.green.glow.withValues(alpha: 0.5)
          : (waiting ? GameColors.sand : GameColors.paper),
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              IconBubble(
                icon: waiting ? Icons.lock_rounded : technology.icon,
                palette: waiting ? ChunkyPalette.stone : technology.branch.palette,
                size: 46,
              ),
              const SizedBox(width: GameDimens.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(technology.label(l10n), style: textTheme.titleMedium),
                    Text(technology.description(l10n), style: textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: GameDimens.spaceS),
          if (unlocked)
            Align(
              alignment: Alignment.centerLeft,
              child: GameTag(
                label: l10n.technologyUnlocked,
                palette: ChunkyPalette.green,
                icon: Icons.check_rounded,
              ),
            )
          else ...[
            Row(
              children: [
                GameTag(
                  label: MoneyFormat.compact(technology.money),
                  palette: ChunkyPalette.sunny,
                  icon: Icons.payments_rounded,
                ),
                const SizedBox(width: GameDimens.spaceS),
                GameTag(
                  label: '${technology.diplomacy}',
                  palette: ChunkyPalette.lagoon,
                  icon: DiplomacyStyle.icon,
                ),
                const Spacer(),
                ChunkyButton(
                  label: l10n.technologyUnlock,
                  size: ChunkySize.small,
                  palette: ChunkyPalette.lagoon,
                  onPressed: problem == null ? onUnlock : null,
                ),
              ],
            ),
            if (problem != null) ...[
              const SizedBox(height: GameDimens.spaceXS),
              Text(
                waiting ? l10n.technologyRequires(prerequisite.label(l10n)) : problem.message(l10n),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ChunkyPalette.coral.deep,
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }
}
