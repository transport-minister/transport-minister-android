import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/features/city_selection/data/static_city_repository.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/domain/city_repository.dart';

final cityRepositoryProvider = Provider<CityRepository>((ref) => const StaticCityRepository());

final citiesProvider = Provider<List<City>>(
  (ref) => ref.watch(cityRepositoryProvider).fetchCities(),
);
