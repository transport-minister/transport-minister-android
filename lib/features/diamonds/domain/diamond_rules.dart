import 'package:transport_minister/core/simulation/model/city_event.dart';

abstract final class DiamondRules {
  static const welcomeGift = 15;
  static const perCityLevel = 2;
  static const perAchievement = 3;
  static const perCityCompleted = 25;
  static const streakFinale = 5;

  static int forCityEvents(Iterable<CityEvent> events) {
    var total = 0;
    for (final event in events) {
      total += switch (event) {
        CityLeveledUp() => perCityLevel,
        CityCompleted() => perCityCompleted,
        _ => 0,
      };
    }
    return total;
  }
}
