import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/design/mascot/mr_bus.dart';
import 'package:transport_minister/core/design/mascot/mr_bus_says.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/decisions/decision_desk.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/pending_decision.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/decisions/presentation/decision_texts.dart';
import 'package:transport_minister/features/decisions/presentation/effect_chips.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

class DecisionResult {
  const DecisionResult({required this.riskHit, required this.riskEffects});

  final bool riskHit;
  final List<DecisionEffect> riskEffects;
}

Future<void> showDecision(BuildContext context, CityId cityId, int decisionId) async {
  final result = await showChunkySheet<DecisionResult>(
    context: context,
    builder: (context) => DecisionSheet(cityId: cityId, decisionId: decisionId),
  );
  if (result == null || !context.mounted) {
    return;
  }
  await showChunkySheet<void>(
    context: context,
    builder: (context) =>
        DecisionResultSheet(riskHit: result.riskHit, riskEffects: result.riskEffects),
  );
}

Future<void> showNews(BuildContext context, CityId cityId, List<PendingDecision> decisions) {
  if (decisions.length == 1) {
    return showDecision(context, cityId, decisions.single.id);
  }
  return showChunkySheet<void>(
    context: context,
    builder: (sheetContext) => NewsListSheet(
      cityId: cityId,
      onOpen: (decision) {
        Navigator.of(sheetContext).pop();
        showDecision(context, cityId, decision.id);
      },
    ),
  );
}

class DecisionSheet extends ConsumerWidget {
  const DecisionSheet({super.key, required this.cityId, required this.decisionId});

  final CityId cityId;
  final int decisionId;

  static const _desk = DecisionDesk();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final city = ref.watch(cityGameProvider(cityId)).value?.city;
    final decision = city?.decisions.where((pending) => pending.id == decisionId).firstOrNull;
    if (city == null || decision == null) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context);
    final kind = decision.template.kind;
    final choices = _desk.choices(city, decision);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.82),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                GameTag(
                  label: kind.label(l10n),
                  palette: kind == DecisionKind.disaster
                      ? ChunkyPalette.coral
                      : ChunkyPalette.sunny,
                  icon: kind == DecisionKind.disaster
                      ? Icons.warning_rounded
                      : Icons.campaign_rounded,
                ),
                const SizedBox(width: GameDimens.spaceS),
                GameTag(
                  label: l10n.decisionDaysLeft(decision.expiresDay - city.day),
                  palette: ChunkyPalette.snow,
                  icon: Icons.hourglass_bottom_rounded,
                ),
              ],
            ),
            const SizedBox(height: GameDimens.spaceM),
            MrBusSays(
              mood: kind.mood,
              title: decision.template.title(l10n, decision.district),
              message: decision.template.body(l10n, decision.district),
              mascotSize: 80,
            ),
            const SizedBox(height: GameDimens.spaceL),
            for (var index = 0; index < choices.length; index++) ...[
              _OptionCard(
                label: decision.template.option(l10n, index),
                choice: choices[index],
                onChoose: () => _choose(context, ref, decision, index),
              ),
              const SizedBox(height: GameDimens.spaceM),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _choose(
    BuildContext context,
    WidgetRef ref,
    PendingDecision decision,
    int index,
  ) async {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppLocalizations.of(context);
    final city = ref.read(cityGameProvider(cityId)).requireValue.city;
    final option = _desk.choices(city, decision)[index].option;
    final outcome = await ref
        .read(cityGameProvider(cityId).notifier)
        .perform((current) => _desk.choose(current, decision.id, index));
    switch (outcome) {
      case CommandRejected(:final reason):
        messenger.showSnackBar(SnackBar(content: Text(reason.message(l10n))));
      case CommandApplied(:final events):
        final riskHit = events.whereType<DecisionResolved>().any((event) => event.riskTriggered);
        navigator.pop(
          DecisionResult(
            riskHit: riskHit,
            riskEffects: riskHit ? option.risk?.effects ?? const [] : const [],
          ),
        );
    }
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({required this.label, required this.choice, required this.onChoose});

  final String label;
  final DecisionChoice choice;
  final VoidCallback onChoose;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final risk = choice.option.risk;
    return ChunkyCard(
      depth: 3,
      padding: const EdgeInsets.all(GameDimens.spaceM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(label, style: textTheme.titleMedium)),
              const SizedBox(width: GameDimens.spaceS),
              GameTag(
                label: choice.cost > 0
                    ? l10n.decisionCost(MoneyFormat.compact(choice.cost))
                    : l10n.decisionFree,
                palette: choice.cost > 0 ? ChunkyPalette.sunny : ChunkyPalette.green,
              ),
            ],
          ),
          if (choice.option.effects.any((effect) => effect is! Spend)) ...[
            const SizedBox(height: GameDimens.spaceS),
            EffectChips(effects: choice.option.effects, includeMoney: false),
          ],
          if (risk != null) ...[
            const SizedBox(height: GameDimens.spaceS),
            Row(
              children: [
                Icon(Icons.casino_rounded, size: 16, color: ChunkyPalette.coral.deep),
                const SizedBox(width: 4),
                Text(
                  l10n.decisionRisk((risk.chance * 100).round()),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ChunkyPalette.coral.deep,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            EffectChips(effects: risk.effects),
          ],
          const SizedBox(height: GameDimens.spaceM),
          ChunkyButton(
            label: l10n.decisionChoose,
            size: ChunkySize.small,
            expanded: true,
            onPressed: choice.available ? onChoose : null,
          ),
          if (!choice.available) ...[
            const SizedBox(height: GameDimens.spaceXS),
            Text(
              choice.problems.first.message(l10n),
              textAlign: TextAlign.center,
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

class DecisionResultSheet extends StatelessWidget {
  const DecisionResultSheet({super.key, required this.riskHit, required this.riskEffects});

  final bool riskHit;
  final List<DecisionEffect> riskEffects;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MrBusSays(
          mood: riskHit ? MrBusMood.shocked : MrBusMood.happy,
          title: l10n.decisionResultTitle,
          message: riskHit ? l10n.decisionResultRisk : l10n.decisionResultCalm,
        ),
        if (riskHit) ...[
          const SizedBox(height: GameDimens.spaceM),
          EffectChips(effects: riskEffects),
        ],
        const SizedBox(height: GameDimens.spaceXL),
        ChunkyButton(
          label: l10n.decisionResultOk,
          expanded: true,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

class NewsListSheet extends ConsumerWidget {
  const NewsListSheet({super.key, required this.cityId, required this.onOpen});

  final CityId cityId;
  final ValueChanged<PendingDecision> onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final city = ref.watch(cityGameProvider(cityId)).value?.city;
    final decisions = city?.decisions ?? const <PendingDecision>[];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MrBusSays(
          mood: MrBusMood.excited,
          title: l10n.newsTitle,
          message: l10n.newsCount(decisions.length),
          mascotSize: 72,
        ),
        const SizedBox(height: GameDimens.spaceL),
        for (final decision in decisions) ...[
          ChunkyCard(
            onPressed: () => onOpen(decision),
            semanticsLabel: decision.template.title(l10n, decision.district),
            depth: 3,
            padding: const EdgeInsets.all(GameDimens.spaceM),
            child: Row(
              children: [
                IconBubble(
                  icon: decision.template.kind == DecisionKind.disaster
                      ? Icons.warning_rounded
                      : Icons.campaign_rounded,
                  palette: decision.template.kind == DecisionKind.disaster
                      ? ChunkyPalette.coral
                      : ChunkyPalette.sunny,
                  size: 38,
                ),
                const SizedBox(width: GameDimens.spaceM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        decision.template.title(l10n, decision.district),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        l10n.decisionDaysLeft(decision.expiresDay - (city?.day ?? 0)),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
          const SizedBox(height: GameDimens.spaceS),
        ],
      ],
    );
  }
}
