// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyTask _$DailyTaskFromJson(Map<String, dynamic> json) => _DailyTask(
  type: $enumDecode(_$TaskTypeEnumMap, json['type']),
  progress: (json['progress'] as num?)?.toInt() ?? 0,
  claimed: json['claimed'] as bool? ?? false,
);

Map<String, dynamic> _$DailyTaskToJson(_DailyTask instance) => <String, dynamic>{
  'type': _$TaskTypeEnumMap[instance.type]!,
  'progress': instance.progress,
  'claimed': instance.claimed,
};

const _$TaskTypeEnumMap = {
  TaskType.buyBuses: 'buyBuses',
  TaskType.makeDecisions: 'makeDecisions',
  TaskType.runDays: 'runDays',
  TaskType.earnTickets: 'earnTickets',
  TaskType.finishProject: 'finishProject',
  TaskType.repairRoad: 'repairRoad',
  TaskType.reachSatisfaction: 'reachSatisfaction',
};

_DailyState _$DailyStateFromJson(Map<String, dynamic> json) => _DailyState(
  dateKey: (json['dateKey'] as num?)?.toInt() ?? 0,
  tasks:
      (json['tasks'] as List<dynamic>?)
          ?.map((e) => DailyTask.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
  lastStreakKey: (json['lastStreakKey'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DailyStateToJson(_DailyState instance) => <String, dynamic>{
  'dateKey': instance.dateKey,
  'tasks': instance.tasks.map((e) => e.toJson()).toList(),
  'streakDays': instance.streakDays,
  'lastStreakKey': instance.lastStreakKey,
};
