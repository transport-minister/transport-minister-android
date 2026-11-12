import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';

part 'simulation_clock.freezed.dart';
part 'simulation_clock.g.dart';

@freezed
abstract class TimeAnchor with _$TimeAnchor {
  const factory TimeAnchor({required int syncedAtMs, @Default(0) int carriedMs}) = _TimeAnchor;

  factory TimeAnchor.fromJson(Map<String, dynamic> json) => _$TimeAnchorFromJson(json);
}

class ClockReading {
  const ClockReading({required this.ticks, required this.anchor, required this.capped});

  final int ticks;
  final TimeAnchor anchor;
  final bool capped;
}

class SimulationClock {
  const SimulationClock({
    this.tickLength = GameBalance.tickLength,
    this.maxCatchUpTicks = GameBalance.maxCatchUpTicks,
  });

  final Duration tickLength;
  final int maxCatchUpTicks;

  ClockReading read(TimeAnchor anchor, DateTime now) {
    final nowMs = now.millisecondsSinceEpoch;
    final elapsed = nowMs - anchor.syncedAtMs;
    final total = anchor.carriedMs + (elapsed < 0 ? 0 : elapsed);
    final length = tickLength.inMilliseconds;
    final ticks = total ~/ length;
    final capped = ticks > maxCatchUpTicks;
    return ClockReading(
      ticks: capped ? maxCatchUpTicks : ticks,
      anchor: TimeAnchor(syncedAtMs: nowMs, carriedMs: capped ? 0 : total % length),
      capped: capped,
    );
  }
}
