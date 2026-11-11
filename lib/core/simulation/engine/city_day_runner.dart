import 'package:transport_minister/core/simulation/decisions/decision_desk.dart';
import 'package:transport_minister/core/simulation/engine/day_simulator.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

class CityDayRunner {
  const CityDayRunner({this.simulator = const DaySimulator(), this.desk = const DecisionDesk()});

  final DaySimulator simulator;
  final DecisionDesk desk;

  DayResult advance(CityState state) {
    final day = simulator.advance(state);
    if (day.state.crisis.dismissed) {
      return day;
    }
    final (next, events) = desk.onNewDay(day.state);
    return DayResult(state: next, report: day.report, events: [...day.events, ...events]);
  }
}
