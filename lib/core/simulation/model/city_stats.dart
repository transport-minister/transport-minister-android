import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_stats.freezed.dart';
part 'city_stats.g.dart';

@freezed
abstract class CityStats with _$CityStats {
  const factory CityStats({
    @Default(0) int busesBought,
    @Default(0) int busesSold,
    @Default(0) int busUpgrades,
    @Default(0) int projectsCompleted,
    @Default(0) int positiveBudgetStreak,
    @Default(0) int bestPositiveBudgetStreak,
    @Default(0) int totalRiders,
  }) = _CityStats;

  factory CityStats.fromJson(Map<String, dynamic> json) => _$CityStatsFromJson(json);
}
