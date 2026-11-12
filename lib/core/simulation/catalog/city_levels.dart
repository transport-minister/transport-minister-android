import 'dart:math' as math;

abstract final class CityLevels {
  static const thresholds = [0, 40, 110, 220, 380, 600, 900, 1300, 1900, 2800];
  static const targetLevel = 10;
  static const rewardPerLevel = 100000;
  static const budgetRaisePercent = 5;

  static const busPurchasePoints = 4;
  static const busUpgradePoints = 3;
  static const projectCompletionPoints = 12;
  static const metroOpeningPoints = 30;
  static const positiveMinutePoints = 4;

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

  static int minutePoints({required double satisfaction, required bool positive}) {
    final mood = math.max(((satisfaction - 25) / 2.5).round(), 0);
    return mood + (positive ? positiveMinutePoints : 0);
  }

  static int rewardFor(int level) => rewardPerLevel * level;

  static double budgetBonus(int level) => 1 + (level - 1) * budgetRaisePercent / 100;
}
