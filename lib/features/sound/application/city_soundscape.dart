import 'dart:math' as math;

import 'package:transport_minister/features/sound/domain/game_sound.dart';

class CitySoundscape {
  const CitySoundscape();

  static const _calmChance = 0.08;
  static const _jamExtraChance = 0.2;
  static const _jamFrom = 40.0;
  static const _jamRange = 30.0;

  GameSound? next({
    required double congestion,
    required bool hasMetro,
    required math.Random random,
  }) {
    final jam = ((congestion - _jamFrom) / _jamRange).clamp(0.0, 1.0);
    if (random.nextDouble() >= _calmChance + _jamExtraChance * jam) {
      return null;
    }
    final weights = {
      GameSound.busHorn: 1 + 6 * jam,
      GameSound.busPass: 4.0,
      if (hasMetro) GameSound.metroTrain: 2.0,
    };
    var roll = random.nextDouble() * weights.values.fold(0.0, (sum, weight) => sum + weight);
    for (final MapEntry(key: sound, value: weight) in weights.entries) {
      roll -= weight;
      if (roll < 0) {
        return sound;
      }
    }
    return GameSound.busPass;
  }
}
