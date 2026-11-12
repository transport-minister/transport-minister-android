import 'package:transport_minister/core/simulation/decisions/decision_desk.dart';
import 'package:transport_minister/core/simulation/engine/tick_simulator.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

class CityTickRunner {
  const CityTickRunner({this.simulator = const TickSimulator(), this.desk = const DecisionDesk()});

  final TickSimulator simulator;
  final DecisionDesk desk;

  TickResult advance(CityState state) {
    final second = simulator.advance(state);
    if (second.state.crisis.dismissed) {
      return second;
    }
    final (next, events) = desk.onTick(second.state);
    return TickResult(state: next, report: second.report, events: [...second.events, ...events]);
  }
}
