import 'package:transport_minister/features/city_selection/domain/city.dart';

abstract interface class CityRepository {
  List<City> fetchCities();
}
