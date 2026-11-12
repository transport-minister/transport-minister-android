import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/tick_simulator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';

const fundedBudget = 2500000;

CityState newBaku({int seed = 7, int budget = fundedBudget}) =>
    const BakuScenario().create(seed: seed).copyWith(budget: budget);

CityState applied(CommandOutcome outcome) => switch (outcome) {
  CommandApplied(:final state) => state,
  CommandRejected(:final reason) => throw StateError('Command rejected: $reason'),
};

RejectionReason rejected(CommandOutcome outcome) => switch (outcome) {
  CommandRejected(:final reason) => reason,
  CommandApplied() => throw StateError('Command was applied'),
};

({CityState state, List<CityEvent> events}) runSeconds(CityState start, int seconds) {
  var state = start;
  final events = <CityEvent>[];
  for (var second = 0; second < seconds; second++) {
    final result = const TickSimulator().advance(state);
    state = result.state;
    events.addAll(result.events);
  }
  return (state: state, events: events);
}
