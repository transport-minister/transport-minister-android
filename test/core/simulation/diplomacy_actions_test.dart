import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/decisions/diplomacy_actions.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/stakeholder_group.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/progression/domain/progression_rules.dart';

import 'simulation_test_kit.dart';

void main() {
  const commands = CityCommands();

  test('every gesture costs money and wins diplomacy points', () {
    for (final action in DiplomacyActionId.values) {
      final city = newBaku();
      final outcome = commands.takeDiplomacyAction(city, action);
      final after = applied(outcome);

      expect(after.budget, lessThan(city.budget), reason: action.name);
      expect(after.diplomacyPoints, city.diplomacyPoints + action.spec.diplomacy);
      expect(
        (outcome as CommandApplied).events.whereType<DiplomacyActionTaken>().single.action,
        action,
      );
    }
  });

  test('cheaper tickets cheer passengers right away', () {
    final city = newBaku();

    final after = applied(commands.takeDiplomacyAction(city, DiplomacyActionId.cheaperTickets));

    expect(
      after.satisfaction[StakeholderGroup.passengers],
      closeTo(city.satisfaction[StakeholderGroup.passengers]! + 8, 0.001),
    );
    expect(after.budget, city.budget - 120000);
  });

  test('a gesture needs time before it can be repeated', () {
    const action = DiplomacyActionId.hackathon;
    final once = applied(commands.takeDiplomacyAction(newBaku(), action));

    expect(rejected(commands.takeDiplomacyAction(once, action)), RejectionReason.coolingDown);
    expect(
      commands.takeDiplomacyAction(once, DiplomacyActionId.cheaperTickets),
      isA<CommandApplied>(),
    );

    final later = runSeconds(once, action.spec.cooldown).state;

    expect(commands.takeDiplomacyAction(later, action), isA<CommandApplied>());
  });

  test('an empty treasury cannot pay for a festival', () {
    final poor = newBaku(budget: 100000);

    expect(
      rejected(commands.takeDiplomacyAction(poor, DiplomacyActionId.cityFestival)),
      RejectionReason.insufficientFunds,
    );
  });

  test('gestures earn the minister XP', () {
    final update = const ProgressionRules().apply(
      const MinisterProfile(),
      city: CityId.baku,
      state: newBaku(),
      events: const [DiplomacyActionTaken(DiplomacyActionId.cityFestival)],
    );

    expect(update.profile.xp, DiplomacyActionId.cityFestival.spec.xp);
  });
}
