import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';

abstract interface class CitySaveRepository {
  Future<CitySave?> load(CityId city);

  Future<void> store(CityId city, CitySave save);

  Future<void> remove(CityId city);
}
