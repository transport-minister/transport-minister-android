import 'package:transport_minister/features/settings/domain/app_language.dart';

abstract interface class SettingsRepository {
  Future<AppLanguage?> loadLanguage();

  Future<void> saveLanguage(AppLanguage language);
}
