import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/domain/city_repository.dart';

class StaticCityRepository implements CityRepository {
  const StaticCityRepository();

  static const _cities = [
    City(id: CityId.baku, contentReady: true),
    City(id: CityId.istanbul, contentReady: false, unlockAfter: CityId.baku),
    City(id: CityId.london, contentReady: false, unlockAfter: CityId.istanbul),
    City(id: CityId.tokyo, contentReady: false, unlockAfter: CityId.london),
    City(id: CityId.newYork, contentReady: false, unlockAfter: CityId.tokyo),
  ];

  @override
  List<City> fetchCities() => _cities;
}
