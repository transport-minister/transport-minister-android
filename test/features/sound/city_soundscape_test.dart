import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/features/sound/application/city_soundscape.dart';
import 'package:transport_minister/features/sound/domain/game_sound.dart';

void main() {
  const soundscape = CitySoundscape();
  const seconds = 6000;

  Map<GameSound?, int> listen({required double congestion, bool hasMetro = false}) {
    final random = math.Random(3);
    final heard = <GameSound?, int>{};
    for (var second = 0; second < seconds; second++) {
      final sound = soundscape.next(congestion: congestion, hasMetro: hasMetro, random: random);
      heard[sound] = (heard[sound] ?? 0) + 1;
    }
    return heard;
  }

  int sounds(Map<GameSound?, int> heard) => seconds - (heard[null] ?? 0);

  test('calm roads stay mostly quiet with a sound every ten seconds or so', () {
    final heard = listen(congestion: 30);

    expect(sounds(heard), inInclusiveRange(380, 600));
    expect(heard[GameSound.busHorn]!, lessThan(heard[GameSound.busPass]!));
    expect(heard[GameSound.metroTrain], isNull);
  });

  test('jammed roads are louder and full of horns', () {
    final calm = listen(congestion: 30);
    final jammed = listen(congestion: 75);

    expect(sounds(jammed), greaterThan(sounds(calm) * 2.5));
    expect(jammed[GameSound.busHorn]!, greaterThan(jammed[GameSound.busPass]!));
  });

  test('metro trains rumble once a line is open', () {
    expect(listen(congestion: 50, hasMetro: true)[GameSound.metroTrain], greaterThan(0));
  });
}
