import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/city_badge.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';

sealed class ProgressionEvent {
  const ProgressionEvent();
}

final class RankPromoted extends ProgressionEvent {
  const RankPromoted(this.rank);

  final MinisterialRank rank;
}

final class AchievementUnlocked extends ProgressionEvent {
  const AchievementUnlocked(this.achievement);

  final AchievementId achievement;
}

final class BadgeEarned extends ProgressionEvent {
  const BadgeEarned(this.city, this.tier);

  final CityId city;
  final BadgeTier tier;
}
