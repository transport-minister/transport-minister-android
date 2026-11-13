import 'package:transport_minister/core/storage/document_store.dart';
import 'package:transport_minister/features/sound/domain/sound_settings.dart';
import 'package:transport_minister/features/sound/domain/sound_settings_repository.dart';

class LocalSoundSettingsRepository implements SoundSettingsRepository {
  const LocalSoundSettingsRepository(this._store);

  final DocumentStore _store;

  static const _collection = 'settings';
  static const _key = 'sound';
  static const _version = 1;

  @override
  Future<SoundSettings?> load() async {
    final document = await _store.read(_collection, _key);
    if (document == null || document.version != _version) {
      return null;
    }
    return SoundSettings.fromJson(document.payload);
  }

  @override
  Future<void> save(SoundSettings settings) =>
      _store.write(_collection, _key, settings.toJson(), version: _version);
}
