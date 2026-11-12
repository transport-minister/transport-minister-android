// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CareerStats _$CareerStatsFromJson(Map<String, dynamic> json) => _CareerStats(
  minutesServed: (json['minutesServed'] as num?)?.toInt() ?? 0,
  busesBought: (json['busesBought'] as num?)?.toInt() ?? 0,
  electricBusesBought: (json['electricBusesBought'] as num?)?.toInt() ?? 0,
  busUpgrades: (json['busUpgrades'] as num?)?.toInt() ?? 0,
  projectsCompleted: (json['projectsCompleted'] as num?)?.toInt() ?? 0,
  roadRepairs: (json['roadRepairs'] as num?)?.toInt() ?? 0,
  crisesAverted: (json['crisesAverted'] as num?)?.toInt() ?? 0,
  dismissals: (json['dismissals'] as num?)?.toInt() ?? 0,
  decisionsMade: (json['decisionsMade'] as num?)?.toInt() ?? 0,
  disastersHandled: (json['disastersHandled'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CareerStatsToJson(_CareerStats instance) => <String, dynamic>{
  'minutesServed': instance.minutesServed,
  'busesBought': instance.busesBought,
  'electricBusesBought': instance.electricBusesBought,
  'busUpgrades': instance.busUpgrades,
  'projectsCompleted': instance.projectsCompleted,
  'roadRepairs': instance.roadRepairs,
  'crisesAverted': instance.crisesAverted,
  'dismissals': instance.dismissals,
  'decisionsMade': instance.decisionsMade,
  'disastersHandled': instance.disastersHandled,
};
