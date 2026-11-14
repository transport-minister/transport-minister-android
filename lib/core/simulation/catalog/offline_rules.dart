import 'dart:math' as math;

abstract final class OfflineRules {
  static const rate = 0.5;
  static const capSeconds = 7200;
  static const minimumSeconds = 60;

  static int earnings({required int incomePerSecond, required int awaySeconds}) {
    if (awaySeconds < minimumSeconds || incomePerSecond <= 0) {
      return 0;
    }
    return (incomePerSecond * rate * math.min(awaySeconds, capSeconds)).round();
  }
}
