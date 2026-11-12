import 'dart:math' as math;

import 'package:transport_minister/core/simulation/decisions/decision_effect.dart';

abstract final class DiplomacyRules {
  static const perLevel = 5;
  static const maxPerDecision = 6;

  static int perMinute(double satisfaction) {
    if (satisfaction >= 80) {
      return 3;
    }
    if (satisfaction >= 65) {
      return 2;
    }
    return satisfaction >= 50 ? 1 : 0;
  }

  static int forChoice(List<DecisionEffect> effects) {
    var score = 0.0;
    for (final effect in effects) {
      score += switch (effect) {
        Mood(:final delta) => delta / 4,
        Reputation(:final delta) => delta * 0.75,
        _ => 0,
      };
    }
    return math.min(math.max(score.round(), 0), maxPerDecision);
  }
}
