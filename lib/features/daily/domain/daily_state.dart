import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_state.freezed.dart';
part 'daily_state.g.dart';

enum TaskType {
  buyBuses(target: 2, money: 80000, xp: 40),
  makeDecisions(target: 2, money: 60000, xp: 40),
  runDays(target: 10, money: 50000, xp: 30),
  earnTickets(target: 30000, money: 70000, xp: 40),
  finishProject(target: 1, money: 90000, xp: 50),
  repairRoad(target: 1, money: 90000, xp: 50),
  reachSatisfaction(target: 45, money: 100000, xp: 50);

  const TaskType({required this.target, required this.money, required this.xp});

  final int target;
  final int money;
  final int xp;
}

@freezed
abstract class DailyTask with _$DailyTask {
  const factory DailyTask({
    required TaskType type,
    @Default(0) int progress,
    @Default(false) bool claimed,
  }) = _DailyTask;

  const DailyTask._();

  factory DailyTask.fromJson(Map<String, dynamic> json) => _$DailyTaskFromJson(json);

  bool get done => progress >= type.target;

  bool get claimable => done && !claimed;
}

@freezed
abstract class DailyState with _$DailyState {
  const factory DailyState({
    @Default(0) int dateKey,
    @Default([]) List<DailyTask> tasks,
    @Default(0) int streakDays,
    @Default(0) int lastStreakKey,
  }) = _DailyState;

  const DailyState._();

  factory DailyState.fromJson(Map<String, dynamic> json) => _$DailyStateFromJson(json);
}

class Reward {
  const Reward({required this.money, required this.xp});

  final int money;
  final int xp;
}
