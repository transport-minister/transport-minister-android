import 'package:transport_minister/core/simulation/catalog/city_levels.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';

abstract final class CityGoal {
  static const happiness = 78.0;
  static const parts = 3;

  static bool levelReached(CityState city) => city.level >= CityLevels.targetLevel;

  static bool everyTechnology(CityState city) => city.technologies.containsAll(TechnologyId.values);

  static bool happy(CityState city) => city.overallSatisfaction >= happiness;

  static int partsDone(CityState city) =>
      [levelReached(city), everyTechnology(city), happy(city)].where((done) => done).length;

  static bool isMet(CityState city) => partsDone(city) == parts;
}
