import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/features/daily/domain/daily_rules.dart';
import 'package:transport_minister/features/daily/domain/daily_state.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';

import '../../core/simulation/simulation_test_kit.dart';

void main() {
  const rules = DailyRules();
  final monday = DateTime(2026, 11, 16, 9);

  test('every day brings three fresh, non-overlapping tasks', () {
    final today = rules.refresh(const DailyState(), monday);
    final again = rules.refresh(today, monday.add(const Duration(hours: 5)));
    final tomorrow = rules.refresh(today, monday.add(const Duration(days: 1)));
    final types = today.tasks.map((task) => task.type).toSet();

    expect(today.tasks, hasLength(DailyRules.tasksPerDay));
    expect(types, hasLength(DailyRules.tasksPerDay));
    expect(types.containsAll({TaskType.finishProject, TaskType.repairRoad}), isFalse);
    expect(again, today);
    expect(tomorrow.dateKey, DailyRules.keyOf(monday.add(const Duration(days: 1))));
  });

  test('city events move task progress up to the target', () {
    const state = DailyState(
      tasks: [
        DailyTask(type: TaskType.buyBuses),
        DailyTask(type: TaskType.earnTickets),
        DailyTask(type: TaskType.reachSatisfaction),
      ],
    );

    final tracked = rules.track(state, const [
      BusPurchased(BusModelId.cityRunner, DistrictId.windHeights, count: 3),
      MinutePassed(3, 40, tickets: 12000),
    ], newBaku());

    expect(tracked.tasks[0].progress, 2);
    expect(tracked.tasks[0].done, isTrue);
    expect(tracked.tasks[1].progress, 12000);
    expect(tracked.tasks[2].progress, newBaku().overallSatisfaction.floor());
  });

  test('a finished task pays out exactly once', () {
    const state = DailyState(tasks: [DailyTask(type: TaskType.runMinutes, progress: 10)]);

    final (claimed, reward) = rules.claimTask(state, 0);
    final (_, again) = rules.claimTask(claimed, 0);

    expect(reward?.money, TaskType.runMinutes.money);
    expect(again, isNull);
  });

  test('the gift streak grows day by day and resets after a gap', () {
    var state = const DailyState();
    final rewards = <int>[];
    final diamonds = <int>[];
    for (var day = 0; day < 8; day++) {
      final (next, reward) = rules.claimStreak(state, monday.add(Duration(days: day)));
      state = next;
      rewards.add(reward!.money);
      diamonds.add(reward.diamonds);
    }
    final (_, sameDay) = rules.claimStreak(state, monday.add(const Duration(days: 7)));
    final (afterGap, gapReward) = rules.claimStreak(state, monday.add(const Duration(days: 10)));

    expect(rewards, [...DailyRules.streakMoney, DailyRules.streakMoney.first]);
    expect(diamonds, [0, 0, 0, 0, 0, 0, DiamondRules.streakFinale, 0]);
    expect(sameDay, isNull);
    expect(gapReward?.money, DailyRules.streakMoney.first);
    expect(afterGap.streakDays, 1);
  });
}
