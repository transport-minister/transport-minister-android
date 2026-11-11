import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/domain/city_repository.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';

class StaticCityRepository implements CityRepository {
  const StaticCityRepository();

  static const _cities = [
    City(id: CityId.baku, availability: CityAvailability.playable),
    City(id: CityId.istanbul, availability: CityAvailability.comingSoon),
    City(id: CityId.london, availability: CityAvailability.comingSoon),
    City(
      id: CityId.tokyo,
      availability: CityAvailability.locked,
      requiredRank: MinisterialRank.seniorMinister,
    ),
    City(
      id: CityId.newYork,
      availability: CityAvailability.locked,
      requiredRank: MinisterialRank.regionalGovernor,
    ),
  ];

  @override
  List<City> fetchCities() => _cities;
}
