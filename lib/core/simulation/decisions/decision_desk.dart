import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/diplomacy_rules.dart';
import 'package:transport_minister/core/simulation/decisions/decision_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';
import 'package:transport_minister/core/simulation/decisions/decision_effects.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/engine/city_development.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/pending_decision.dart';

class DecisionChoice {
  const DecisionChoice({
    required this.option,
    required this.problems,
    required this.cost,
    required this.diplomacy,
  });

  final DecisionOption option;
  final List<RejectionReason> problems;
  final int cost;
  final int diplomacy;

  bool get available => problems.isEmpty;
}

class DecisionDesk {
  const DecisionDesk({
    this.effects = const DecisionEffects(),
    this.metrics = const MetricsCalculator(),
    this.development = const CityDevelopment(),
  });

  final DecisionEffects effects;
  final MetricsCalculator metrics;
  final CityDevelopment development;

  static const maxPending = 3;
  static const firstDecisionTick = 90;
  static const chancePerSecond = 0.012;
  static const guaranteedAfterSeconds = 120;
  static const disasterChancePerSecond = 0.0012;
  static const firstDisasterTick = 180;
  static const historyLimit = 20;
  static const decisionPoints = 6;
  static const disasterPoints = 10;

  DecisionContext context(CityState state) => DecisionContext(state, metrics.calculate(state));

  List<DecisionChoice> choices(CityState state, PendingDecision decision) {
    final template = DecisionCatalog.of(decision.template);
    return [
      for (final option in template.options(context(state), decision.district))
        DecisionChoice(
          option: option,
          problems: effects.problems(state, option.effects),
          cost: effects.cost(state, option.effects),
          diplomacy: DiplomacyRules.forChoice(option.effects),
        ),
    ];
  }

  CommandOutcome choose(CityState state, int decisionId, int optionIndex) {
    final decision = state.decisions.where((pending) => pending.id == decisionId).firstOrNull;
    if (decision == null) {
      return const CommandRejected(RejectionReason.invalidTarget);
    }
    final options = choices(state, decision);
    if (optionIndex < 0 || optionIndex >= options.length) {
      return const CommandRejected(RejectionReason.invalidTarget);
    }
    final choice = options[optionIndex];
    if (!choice.available) {
      return CommandRejected(choice.problems.first);
    }
    final (resolved, events) = _resolve(
      state,
      decision,
      optionIndex,
      choice.option,
      automatic: false,
    );
    return CommandApplied(resolved, events: events);
  }

  bool rollsRisk(CityState state, PendingDecision decision, int optionIndex, DecisionRisk risk) {
    final random = math.Random(state.seed ^ (decision.id * 7919) ^ (optionIndex * 104729));
    return random.nextDouble() < risk.chance;
  }

  (CityState, List<CityEvent>) onTick(CityState state) {
    var next = state;
    final events = <CityEvent>[];
    for (final decision in state.decisions.where((pending) => pending.expiresTick < state.tick)) {
      final options = DecisionCatalog.of(decision.template)
          .options(context(next), decision.district);
      final (resolved, resolvedEvents) = _resolve(
        next,
        decision,
        options.length - 1,
        options.last,
        automatic: true,
      );
      next = resolved;
      events.addAll(resolvedEvents);
    }
    final (spawned, spawnEvents) = _spawn(next);
    return (spawned, [...events, ...spawnEvents]);
  }

  (CityState, List<CityEvent>) _resolve(
    CityState state,
    PendingDecision decision,
    int optionIndex,
    DecisionOption option, {
    required bool automatic,
  }) {
    final risk = option.risk;
    final triggered = risk != null && rollsRisk(state, decision, optionIndex, risk);
    final applied = [
      if (!triggered || !risk.replacesOutcome) ...option.effects,
      if (triggered) ...risk.effects,
    ];
    var (next, events) = effects.apply(state, applied);
    next = next.copyWith(
      decisions: [
        for (final pending in next.decisions)
          if (pending.id != decision.id) pending,
      ],
      decisionLog: [
        ...next.decisionLog,
        DecisionRecord(
          template: decision.template,
          option: optionIndex,
          tick: state.tick,
          riskTriggered: triggered,
          automatic: automatic,
          district: decision.district,
        ),
      ].reversed.take(historyLimit).toList().reversed.toList(),
    );
    final resolvedEvents = <CityEvent>[
      ...events,
      DecisionResolved(decision.template, riskTriggered: triggered, automatic: automatic),
    ];
    if (!automatic) {
      final diplomacy = triggered ? 0 : DiplomacyRules.forChoice(option.effects);
      if (diplomacy > 0) {
        next = next.copyWith(diplomacyPoints: next.diplomacyPoints + diplomacy);
        resolvedEvents.add(DiplomacyEarned(diplomacy));
      }
      final points = decision.template.kind == DecisionKind.disaster
          ? disasterPoints
          : decisionPoints;
      final (developed, levelEvents) = development.award(next, points);
      next = developed;
      resolvedEvents.addAll(levelEvents);
    }
    return (next, resolvedEvents);
  }

  (CityState, List<CityEvent>) _spawn(CityState state) {
    if (state.tick < firstDecisionTick || state.decisions.length >= maxPending) {
      return (state, const []);
    }
    final random = math.Random(state.seed * 31 + state.tick);
    final disaster =
        state.tick >= firstDisasterTick && random.nextDouble() < disasterChancePerSecond;
    final quiet = state.tick - state.lastDecisionTick;
    if (!disaster && quiet < guaranteedAfterSeconds && random.nextDouble() >= chancePerSecond) {
      return (state, const []);
    }
    final situation = context(state);
    final pendingIds = state.decisions.map((pending) => pending.template).toSet();
    final candidates = [
      for (final template in DecisionCatalog.all)
        if ((template.id.kind == DecisionKind.disaster) == disaster &&
            !pendingIds.contains(template.id))
          (template, template.weight(situation)),
    ].where((entry) => entry.$2 > 0).toList();
    if (candidates.isEmpty) {
      return (state, const []);
    }
    final total = candidates.fold(0.0, (sum, entry) => sum + entry.$2);
    var pick = random.nextDouble() * total;
    var chosen = candidates.last.$1;
    for (final (template, weight) in candidates) {
      pick -= weight;
      if (pick <= 0) {
        chosen = template;
        break;
      }
    }
    final district = chosen.district?.call(situation, random);
    final decision = PendingDecision(
      id: state.nextId,
      template: chosen.id,
      district: district,
      createdTick: state.tick,
      expiresTick: state.tick + chosen.expiresIn,
    );
    var next = state.copyWith(
      decisions: [...state.decisions, decision],
      nextId: state.nextId + 1,
      lastDecisionTick: state.tick,
    );
    final events = <CityEvent>[DecisionArrived(chosen.id, district)];
    final arrival = chosen.arrival;
    if (arrival != null) {
      final (hit, hitEvents) = effects.apply(next, arrival(situation, district));
      next = hit;
      events.addAll(hitEvents);
    }
    return (next, events);
  }
}
