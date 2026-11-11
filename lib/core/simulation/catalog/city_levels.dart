import 'dart:math' as math;

abstract final class CityLevels {
  static const thresholds = [0, 40, 110, 220, 380, 600, 900, 1300, 1800, 2500];
  static const targetLevel = 10;
  static const rewardPerLevel = 100000;

  static const busPurchasePoints = 4;
  static const busUpgradePoints = 3;
  static const projectCompletionPoints = 12;
  static const positiveDayPoints = 2;

  static int levelFor(int points) {
    var level = 1;
    for (var index = 0; index < thresholds.length; index++) {
      if (points >= thresholds[index]) {
        level = index + 1;
      }
    }
    return level;
  }

  static int pointsFor(int level) => thresholds[level - 1];

  static bool isMaxLevel(int level) => level >= thresholds.length;

  static double progress(int points) {
    final level = levelFor(points);
    if (isMaxLevel(level)) {
      return 1;
    }
    final floor = pointsFor(level);
    return (points - floor) / (pointsFor(level + 1) - floor);
  }

  static int dailyPoints({required double satisfaction, required bool positiveDay}) {
    final mood = math.max(((satisfaction - 25) / 5).round(), 0);
    return mood + (positiveDay ? positiveDayPoints : 0);
  }

  static int rewardFor(int level) => rewardPerLevel * level;
}
