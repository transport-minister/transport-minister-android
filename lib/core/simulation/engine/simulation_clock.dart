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
  const ClockReading({
    required this.days,
    required this.anchor,
    required this.dayProgress,
    required this.capped,
  });

  final int days;
  final TimeAnchor anchor;
  final double dayProgress;
  final bool capped;
}

class SimulationClock {
  const SimulationClock({
    this.dayLength = GameBalance.dayLength,
    this.maxCatchUpDays = GameBalance.maxCatchUpDays,
  });

  final Duration dayLength;
  final int maxCatchUpDays;

  ClockReading read(TimeAnchor anchor, DateTime now) {
    final nowMs = now.millisecondsSinceEpoch;
    final elapsed = nowMs - anchor.syncedAtMs;
    final total = anchor.carriedMs + (elapsed < 0 ? 0 : elapsed);
    final length = dayLength.inMilliseconds;
    final days = total ~/ length;
    final capped = days > maxCatchUpDays;
    final carried = capped ? 0 : total % length;
    return ClockReading(
      days: capped ? maxCatchUpDays : days,
      anchor: TimeAnchor(syncedAtMs: nowMs, carriedMs: carried),
      dayProgress: carried / length,
      capped: capped,
    );
  }
}
