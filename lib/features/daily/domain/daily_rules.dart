import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/daily/domain/daily_state.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';

class DailyRules {
  const DailyRules();

  static const tasksPerDay = 3;
  static const streakMoney = [50000, 75000, 100000, 125000, 150000, 200000, 300000];
  static const streakXp = [10, 15, 20, 25, 30, 40, 60];
  static const streakDiamonds = [0, 0, 0, 0, 0, 0, DiamondRules.streakFinale];

  static int keyOf(DateTime date) => date.year * 10000 + date.month * 100 + date.day;

  DailyState refresh(DailyState state, DateTime today) {
    final key = keyOf(today);
    if (state.dateKey == key) {
      return state;
    }
    final random = math.Random(key);
    final pool = [...TaskType.values]..shuffle(random);
    final picked = <TaskType>[];
    for (final type in pool) {
      final overlaps =
          (type == TaskType.repairRoad && picked.contains(TaskType.finishProject)) ||
          (type == TaskType.finishProject && picked.contains(TaskType.repairRoad));
      if (!overlaps) {
        picked.add(type);
      }
      if (picked.length == tasksPerDay) {
        break;
      }
    }
    return state.copyWith(
      dateKey: key,
      tasks: [for (final type in picked) DailyTask(type: type)],
    );
  }

  DailyState track(DailyState state, List<CityEvent> events, CityState city) {
    return state.copyWith(
      tasks: [
        for (final task in state.tasks)
          task.claimed ? task : task.copyWith(progress: _progress(task, events, city)),
      ],
    );
  }

  (DailyState, Reward?) claimTask(DailyState state, int index) {
    if (index < 0 || index >= state.tasks.length || !state.tasks[index].claimable) {
      return (state, null);
    }
    final task = state.tasks[index];
    return (
      state.copyWith(
        tasks: [
          for (var position = 0; position < state.tasks.length; position++)
            position == index ? task.copyWith(claimed: true) : state.tasks[position],
        ],
      ),
      Reward(money: task.type.money, xp: task.type.xp),
    );
  }

  bool canClaimStreak(DailyState state, DateTime today) => state.lastStreakKey != keyOf(today);

  int nextStreakDay(DailyState state, DateTime today) {
    final yesterday = keyOf(today.subtract(const Duration(days: 1)));
    final continues = state.lastStreakKey == yesterday || state.lastStreakKey == keyOf(today);
    return continues ? state.streakDays % streakMoney.length + 1 : 1;
  }

  (DailyState, Reward?) claimStreak(DailyState state, DateTime today) {
    if (!canClaimStreak(state, today)) {
      return (state, null);
    }
    final day = nextStreakDay(state, today);
    final continues = day > 1;
    return (
      state.copyWith(streakDays: continues ? state.streakDays + 1 : 1, lastStreakKey: keyOf(today)),
      Reward(money: streakMoney[day - 1], xp: streakXp[day - 1], diamonds: streakDiamonds[day - 1]),
    );
  }

  int claimable(DailyState state, DateTime today) =>
      state.tasks.where((task) => task.claimable).length + (canClaimStreak(state, today) ? 1 : 0);

  int _progress(DailyTask task, List<CityEvent> events, CityState city) {
    final gained = switch (task.type) {
      TaskType.buyBuses => events.whereType<BusPurchased>().fold(0, (sum, e) => sum + e.count),
      TaskType.makeDecisions =>
        events.whereType<DecisionResolved>().where((e) => !e.automatic).length,
      TaskType.runMinutes => events.whereType<MinutePassed>().length,
      TaskType.earnTickets => events.whereType<MinutePassed>().fold(0, (sum, e) => sum + e.tickets),
      TaskType.finishProject => events.whereType<ProjectCompleted>().length,
      TaskType.repairRoad =>
        events
            .whereType<ProjectCompleted>()
            .where((event) => event.type == ProjectType.roadRepair)
            .length,
      TaskType.reachSatisfaction => 0,
    };
    if (task.type == TaskType.reachSatisfaction) {
      return math.max(task.progress, city.overallSatisfaction.floor());
    }
    return math.min(task.progress + gained, task.type.target);
  }
}
