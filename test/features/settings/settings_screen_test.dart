import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/settings/application/settings_controller.dart';
import 'package:transport_minister/features/settings/data/local_settings_repository.dart';
import 'package:transport_minister/features/settings/domain/app_language.dart';
import 'package:transport_minister/features/settings/presentation/language_flag.dart';
import 'package:transport_minister/features/settings/presentation/settings_screen.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  late InMemoryDocumentStore store;

  setUp(() => store = InMemoryDocumentStore());

  Future<void> openSettings(WidgetTester tester) {
    return pumpGameScreen(
      tester,
      const SettingsScreen(),
      store: store,
      now: FakeNow(DateTime(2026, 11, 12, 9)),
      overrides: [appVersionProvider.overrideWith((ref) async => '0.1.0')],
    );
  }

  testWidgets('settings offer three languages with flags and the app version', (tester) async {
    await openSettings(tester);

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Türkçe'), findsOneWidget);
    expect(find.text('Русский'), findsOneWidget);
    expect(find.byType(LanguageFlag), findsNWidgets(3));
    expect(find.text('Version 0.1.0'), findsOneWidget);
  });

  testWidgets('choosing a language remembers it', (tester) async {
    await openSettings(tester);
    final container = ProviderScope.containerOf(tester.element(find.byType(SettingsScreen)));

    await tester.tap(find.text('Русский'));
    await tester.pumpAndSettle();

    expect(container.read(languageProvider).value, AppLanguage.russian);
    expect(await LocalSettingsRepository(store).loadLanguage(), AppLanguage.russian);
  });
}
