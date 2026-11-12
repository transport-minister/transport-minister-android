import 'package:transport_minister/core/storage/document_store.dart';
import 'package:transport_minister/features/settings/domain/app_language.dart';
import 'package:transport_minister/features/settings/domain/settings_repository.dart';

class LocalSettingsRepository implements SettingsRepository {
  const LocalSettingsRepository(this._store);

  final DocumentStore _store;

  static const _collection = 'settings';
  static const _key = 'app';
  static const _version = 1;
  static const _language = 'language';

  @override
  Future<AppLanguage?> loadLanguage() async {
    final document = await _store.read(_collection, _key);
    return AppLanguage.fromCode(document?.payload[_language] as String?);
  }

  @override
  Future<void> saveLanguage(AppLanguage language) =>
      _store.write(_collection, _key, {_language: language.code}, version: _version);
}
