import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

class AwaySummary {
  const AwaySummary({
    required this.days,
    required this.budgetChange,
    required this.satisfactionChange,
    required this.events,
    required this.capped,
  });

  factory AwaySummary.between(
    CityState before,
    CityState after,
    List<CityEvent> events, {
    required bool capped,
  }) {
    return AwaySummary(
      days: after.day - before.day,
      budgetChange: after.budget - before.budget,
      satisfactionChange: after.overallSatisfaction - before.overallSatisfaction,
      events: List.unmodifiable(events),
      capped: capped,
    );
  }

  final int days;
  final int budgetChange;
  final double satisfactionChange;
  final List<CityEvent> events;
  final bool capped;

  int get busesDelivered =>
      events.whereType<BusesDelivered>().fold(0, (sum, event) => sum + event.count);

  int get projectsCompleted => events.whereType<ProjectCompleted>().length;
}
