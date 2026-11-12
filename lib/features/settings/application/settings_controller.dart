import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/settings/data/local_settings_repository.dart';
import 'package:transport_minister/features/settings/domain/app_language.dart';
import 'package:transport_minister/features/settings/domain/settings_repository.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => LocalSettingsRepository(ref.watch(documentStoreProvider)),
);

final languageProvider = AsyncNotifierProvider<LanguageController, AppLanguage?>(
  LanguageController.new,
);

final appVersionProvider = FutureProvider<String>(
  (ref) async => (await PackageInfo.fromPlatform()).version,
);

class LanguageController extends AsyncNotifier<AppLanguage?> {
  @override
  Future<AppLanguage?> build() => ref.read(settingsRepositoryProvider).loadLanguage();

  Future<void> choose(AppLanguage language) async {
    state = AsyncData(language);
    await ref.read(settingsRepositoryProvider).saveLanguage(language);
  }
}
