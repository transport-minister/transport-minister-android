import 'dart:math' as math;

abstract final class BoostRules {
  static const continueCost = 40;
  static const continueReliefSeconds = 120;
  static const continueCongestionRelief = -15.0;
  static const continueMoodLift = 10.0;
  static const rushSecondsPerDiamond = 20;
  static const diplomacyRushSecondsPerDiamond = 30;
  static const doubleEarningsCost = 20;
  static const doubleEarningsSeconds = 600;
  static const earningsBoost = 2.0;

  static int rushCost(int remainingSeconds, {int secondsPerDiamond = rushSecondsPerDiamond}) =>
      math.max(1, (remainingSeconds / secondsPerDiamond).ceil());
}
