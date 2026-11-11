import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';

class CityUnlocks {
  const CityUnlocks();

  CityAccess accessFor(City city, MinisterProfile profile) {
    final requirement = city.unlockAfter;
    final unlocked =
        requirement == null || profile.bestLevelIn(requirement) >= CityLevels.targetLevel;
    if (!unlocked) {
      return CityAccess.locked;
    }
    return city.contentReady ? CityAccess.playable : CityAccess.comingSoon;
  }

  double progressFor(City city, MinisterProfile profile) {
    final requirement = city.unlockAfter;
    if (requirement == null) {
      return 1;
    }
    return (profile.bestLevelIn(requirement) / CityLevels.targetLevel).clamp(0, 1).toDouble();
  }

  City? unlockedBy(List<City> cities, CityId completed) {
    for (final city in cities) {
      if (city.unlockAfter == completed) {
        return city;
      }
    }
    return null;
  }
}
