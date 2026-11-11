import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/career_stats.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';

part 'minister_profile.freezed.dart';
part 'minister_profile.g.dart';

@freezed
abstract class MinisterProfile with _$MinisterProfile {
  const factory MinisterProfile({
    @Default(0) int xp,
    @Default(50) double reputation,
    @Default(MinisterialRank.juniorOfficial) MinisterialRank rank,
    @Default({}) Map<CityId, int> bestCityLevels,
    @Default({}) Set<AchievementId> achievements,
    @Default(CareerStats()) CareerStats career,
  }) = _MinisterProfile;

  const MinisterProfile._();

  factory MinisterProfile.fromJson(Map<String, dynamic> json) => _$MinisterProfileFromJson(json);

  int bestLevelIn(CityId city) => bestCityLevels[city] ?? 0;
}
