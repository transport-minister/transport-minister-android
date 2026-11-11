import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/storage/document_store.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_game/domain/city_save_repository.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';

class LocalCitySaveRepository implements CitySaveRepository {
  const LocalCitySaveRepository(this._store);

  final DocumentStore _store;

  static const _collection = 'city_saves';
  static const _version = 1;

  @override
  Future<CitySave?> load(CityId city) async {
    final document = await _store.read(_collection, city.name);
    if (document == null) {
      return null;
    }
    return CitySave(
      city: CityState.fromJson(document.payload['city'] as Map<String, dynamic>),
      anchor: TimeAnchor.fromJson(document.payload['anchor'] as Map<String, dynamic>),
    );
  }

  @override
  Future<void> store(CityId city, CitySave save) {
    return _store.write(_collection, city.name, {
      'city': save.city.toJson(),
      'anchor': save.anchor.toJson(),
    }, version: _version);
  }

  @override
  Future<void> remove(CityId city) => _store.delete(_collection, city.name);
}
