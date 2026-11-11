import 'package:freezed_annotation/freezed_annotation.dart';

part 'career_stats.freezed.dart';
part 'career_stats.g.dart';

@freezed
abstract class CareerStats with _$CareerStats {
  const factory CareerStats({
    @Default(0) int daysServed,
    @Default(0) int busesBought,
    @Default(0) int electricBusesBought,
    @Default(0) int busUpgrades,
    @Default(0) int projectsCompleted,
    @Default(0) int roadRepairs,
    @Default(0) int crisesAverted,
    @Default(0) int dismissals,
    @Default(0) int decisionsMade,
    @Default(0) int disastersHandled,
  }) = _CareerStats;

  factory CareerStats.fromJson(Map<String, dynamic> json) => _$CareerStatsFromJson(json);
}
