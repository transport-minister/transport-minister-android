import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/router/app_route.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/boost_rules.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effects.dart';
import 'package:transport_minister/core/simulation/decisions/diplomacy_actions.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/city_game/presentation/time_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/decisions/presentation/effect_chips.dart';
import 'package:transport_minister/features/diamonds/presentation/diamond_button.dart';
import 'package:transport_minister/features/diplomacy/presentation/diplomacy_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DiplomacyScreen extends ConsumerWidget {
  const DiplomacyScreen({super.key, required this.cityId});

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
              title: l10n.diplomacyTitle,
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
                          palette: DiplomacyStyle.palette,
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
                      message: l10n.diplomacyIntro,
                      mood: MrBusMood.thinking,
                      mascotSize: 64,
                    ),
                    const SizedBox(height: GameDimens.spaceL),
                    _TechnologyCard(
                      ready: TechnologyId.values
                          .where(
                            (technology) =>
                                const CityCommands().technologyProblem(city, technology) == null,
                          )
                          .length,
                      onOpen: () => context.push(AppRoute.technology.forCity(cityId.name)),
                    ),
                    const SizedBox(height: GameDimens.spaceXL),
                    Text(l10n.diplomacyActionsTitle, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: GameDimens.spaceM),
                    for (final action in DiplomacyActionId.values) ...[
                      _ActionCard(
                        action: action,
                        city: city,
                        onTake: () => ref
                            .read(cityGameProvider(cityId).notifier)
                            .perform(
                              (city) => const CityCommands().takeDiplomacyAction(city, action),
                            ),
                        onRush: (cost) => buyBoost(
                          context,
                          ref,
                          cityId,
                          cost: cost,
                          command: (city) => const CityCommands().rushDiplomacy(city, action),
                        ),
                      ),
                      const SizedBox(height: GameDimens.spaceM),
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

class _TechnologyCard extends StatelessWidget {
  const _TechnologyCard({required this.ready, required this.onOpen});

  final int ready;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    return ChunkyCard(
      depth: 3,
      color: DiplomacyStyle.palette.glow.withValues(alpha: 0.35),
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const IconBubble(
                icon: Icons.science_rounded,
                palette: DiplomacyStyle.palette,
                size: 46,
              ),
              const SizedBox(width: GameDimens.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.technologyTitle, style: textTheme.titleMedium),
                    Text(l10n.diplomacyTechnologyBody, style: textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: GameDimens.spaceS),
          ChunkyButton(
            label: ready > 0 ? l10n.diplomacyTechnologyReady(ready) : l10n.diplomacyOpenTechnology,
            icon: Icons.arrow_forward_rounded,
            palette: DiplomacyStyle.palette,
            size: ChunkySize.small,
            expanded: true,
            onPressed: onOpen,
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.action,
    required this.city,
    required this.onTake,
    required this.onRush,
  });

  final DiplomacyActionId action;
  final CityState city;
  final VoidCallback onTake;
  final ValueChanged<int> onRush;

  int get _rushCost => BoostRules.rushCost(
    (city.diplomacyReadyAt[action] ?? city.tick) - city.tick,
    secondsPerDiamond: BoostRules.diplomacyRushSecondsPerDiamond,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final spec = action.spec;
    final problem = const CityCommands().diplomacyProblem(city, action);
    final cooling = problem == RejectionReason.coolingDown;
    return ChunkyCard(
      depth: 3,
      color: cooling ? GameColors.sand : GameColors.paper,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconBubble(icon: action.icon, palette: action.palette, size: 46),
              const SizedBox(width: GameDimens.spaceM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(action.title(l10n), style: textTheme.titleMedium),
                    Text(action.body(l10n), style: textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: GameDimens.spaceS),
          Wrap(
            spacing: GameDimens.spaceXS,
            runSpacing: GameDimens.spaceXS,
            children: [
              ToneChip(label: l10n.diplomacyGain(spec.diplomacy), tone: EffectTone.good),
              ToneChip(label: l10n.diplomacyXp(spec.xp), tone: EffectTone.good),
            ],
          ),
          const SizedBox(height: GameDimens.spaceXS),
          EffectChips(effects: spec.effects, includeMoney: false),
          const SizedBox(height: GameDimens.spaceS),
          if (cooling)
            Row(
              children: [
                GameTag(
                  label: l10n.diplomacyReadyIn(
                    TimeTexts.duration(l10n, city.diplomacyReadyAt[action]! - city.tick),
                  ),
                  palette: ChunkyPalette.snow,
                  icon: Icons.hourglass_top_rounded,
                ),
                const SizedBox(width: GameDimens.spaceS),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: DiamondButton(
                      label: l10n.boostReadyNow,
                      cost: _rushCost,
                      onPressed: () => onRush(_rushCost),
                    ),
                  ),
                ),
              ],
            )
          else
            Align(
              alignment: Alignment.centerRight,
              child: ChunkyButton(
                label: l10n.diplomacyAct(
                  MoneyFormat.compact(const DecisionEffects().cost(city, spec.effects)),
                ),
                icon: action.icon,
                palette: DiplomacyStyle.palette,
                size: ChunkySize.small,
                onPressed: problem == null ? onTake : null,
              ),
            ),
          if (problem != null && !cooling) ...[
            const SizedBox(height: GameDimens.spaceXS),
            Text(
              problem.message(l10n),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ChunkyPalette.coral.deep,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
