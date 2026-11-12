import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/city_goal.dart';
import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/tick_simulator.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';

import 'simulation_test_kit.dart';

void main() {
  CityState finished({double mood = 90, Set<TechnologyId>? technologies}) => newBaku().copyWith(
    developmentPoints: CityLevels.pointsFor(CityLevels.targetLevel),
    technologies: technologies ?? TechnologyId.values.toSet(),
    satisfaction: {for (final group in StakeholderGroup.values) group: mood},
  );

  test('a city is complete at level 10 with every technology and happy citizens', () {
    expect(CityGoal.partsDone(newBaku()), 0);
    expect(CityGoal.isMet(finished()), isTrue);
    expect(CityGoal.isMet(finished(mood: 60)), isFalse);
    expect(CityGoal.partsDone(finished(technologies: {TechnologyId.metroStudy})), 2);
  });

  test('the day the goal is met the city is completed once', () {
    final first = const TickSimulator().advance(finished());
    final second = const TickSimulator().advance(first.state);

    expect(first.state.completed, isTrue);
    expect(first.events.whereType<CityCompleted>(), hasLength(1));
    expect(second.events.whereType<CityCompleted>(), isEmpty);
  });
}
