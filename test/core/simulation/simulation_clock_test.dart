import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';

void main() {
  const clock = SimulationClock();
  final start = DateTime(2026, 11, 11, 9);
  final anchor = TimeAnchor(syncedAtMs: start.millisecondsSinceEpoch);

  test('the city moves one tick every real second', () {
    final reading = clock.read(anchor, start.add(const Duration(milliseconds: 2500)));

    expect(reading.ticks, 2);
    expect(reading.anchor.carriedMs, 500);
  });

  test('partial seconds add up across readings', () {
    final first = clock.read(anchor, start.add(const Duration(milliseconds: 600)));
    final second = clock.read(first.anchor, start.add(const Duration(milliseconds: 1200)));

    expect(first.ticks, 0);
    expect(second.ticks, 1);
  });

  test('a long gap is capped to one minute of ticks', () {
    final reading = clock.read(anchor, start.add(const Duration(hours: 3)));

    expect(reading.ticks, 60);
    expect(reading.capped, isTrue);
    expect(reading.anchor.carriedMs, 0);
  });

  test('a clock turned back does not move the city', () {
    final reading = clock.read(anchor, start.subtract(const Duration(hours: 1)));

    expect(reading.ticks, 0);
  });
}
