// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityStats _$CityStatsFromJson(Map<String, dynamic> json) => _CityStats(
  busesBought: (json['busesBought'] as num?)?.toInt() ?? 0,
  busesSold: (json['busesSold'] as num?)?.toInt() ?? 0,
  busUpgrades: (json['busUpgrades'] as num?)?.toInt() ?? 0,
  projectsCompleted: (json['projectsCompleted'] as num?)?.toInt() ?? 0,
  positiveBudgetStreak: (json['positiveBudgetStreak'] as num?)?.toInt() ?? 0,
  bestPositiveBudgetStreak: (json['bestPositiveBudgetStreak'] as num?)?.toInt() ?? 0,
  totalRiders: (json['totalRiders'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CityStatsToJson(_CityStats instance) => <String, dynamic>{
  'busesBought': instance.busesBought,
  'busesSold': instance.busesSold,
  'busUpgrades': instance.busUpgrades,
  'projectsCompleted': instance.projectsCompleted,
  'positiveBudgetStreak': instance.positiveBudgetStreak,
  'bestPositiveBudgetStreak': instance.bestPositiveBudgetStreak,
  'totalRiders': instance.totalRiders,
};
