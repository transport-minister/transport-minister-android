import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';

void main() {
  const clock = SimulationClock();
  final start = DateTime(2026, 11, 11, 9);
  final anchor = TimeAnchor(syncedAtMs: start.millisecondsSinceEpoch);

  test('one game day passes every real minute', () {
    final reading = clock.read(anchor, start.add(const Duration(seconds: 90)));

    expect(reading.days, 1);
    expect(reading.dayProgress, closeTo(0.5, 0.001));
    expect(reading.anchor.carriedMs, 30000);
  });

  test('partial minutes add up across readings', () {
    final first = clock.read(anchor, start.add(const Duration(seconds: 40)));
    final second = clock.read(first.anchor, start.add(const Duration(seconds: 80)));

    expect(first.days, 0);
    expect(second.days, 1);
  });

  test('time away is capped at a week of game days', () {
    final reading = clock.read(anchor, start.add(const Duration(hours: 3)));

    expect(reading.days, 7);
    expect(reading.capped, isTrue);
    expect(reading.dayProgress, 0);
  });

  test('a clock turned back does not move the city', () {
    final reading = clock.read(anchor, start.subtract(const Duration(hours: 1)));

    expect(reading.days, 0);
  });
}
