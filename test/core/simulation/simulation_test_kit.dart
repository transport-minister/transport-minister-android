import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/day_simulator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';

CityState newBaku({int seed = 7}) => const BakuScenario().create(seed: seed);

CityState applied(CommandOutcome outcome) => switch (outcome) {
  CommandApplied(:final state) => state,
  CommandRejected(:final reason) => throw StateError('Command rejected: $reason'),
};

RejectionReason rejected(CommandOutcome outcome) => switch (outcome) {
  CommandRejected(:final reason) => reason,
  CommandApplied() => throw StateError('Command was applied'),
};

({CityState state, List<CityEvent> events}) runDays(CityState start, int days) {
  var state = start;
  final events = <CityEvent>[];
  for (var day = 0; day < days; day++) {
    final result = const DaySimulator().advance(state);
    state = result.state;
    events.addAll(result.events);
  }
  return (state: state, events: events);
}
