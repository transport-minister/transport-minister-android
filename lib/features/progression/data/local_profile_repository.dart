import 'package:transport_minister/core/storage/document_store.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/progression/domain/profile_repository.dart';

class LocalProfileRepository implements ProfileRepository {
  const LocalProfileRepository(this._store);

  final DocumentStore _store;

  static const _collection = 'profiles';
  static const _key = 'minister';
  static const _version = 1;

  @override
  Future<MinisterProfile?> load() async {
    final document = await _store.read(_collection, _key);
    return document == null ? null : MinisterProfile.fromJson(document.payload);
  }

  @override
  Future<void> save(MinisterProfile profile) =>
      _store.write(_collection, _key, profile.toJson(), version: _version);
}
