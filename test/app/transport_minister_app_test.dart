import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/transport_minister_app.dart';
import 'package:transport_minister/core/design/widgets/sticker_text.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/settings/data/local_settings_repository.dart';
import 'package:transport_minister/features/settings/domain/app_language.dart';
import 'package:transport_minister/features/sound/application/sound_providers.dart';

import '../helpers/fake_sound_output.dart';
import '../helpers/phone_viewport.dart';

Widget _app(InMemoryDocumentStore store) {
  return ProviderScope(
    overrides: [
      documentStoreProvider.overrideWithValue(store),
      nowProvider.overrideWithValue(() => DateTime(2026, 11, 11, 8)),
      tickIntervalProvider.overrideWithValue(const Duration(hours: 1)),
      soundOutputProvider.overrideWithValue(FakeSoundOutput()),
    ],
    child: const TransportMinisterApp(),
  );
}

Future<InMemoryDocumentStore> _sworn() async {
  final store = InMemoryDocumentStore();
  await LocalProfileRepository(store).save(const MinisterProfile(oathTaken: true));
  return store;
}

Finder _sticker(String text) {
  return find.byWidgetPredicate((widget) => widget is StickerText && widget.text == text);
}

void main() {
  testWidgets('the first launch asks for the oath, then opens the city selection', (tester) async {
    usePhoneViewport(tester);
    tester.platformDispatcher.accessibilityFeaturesTestValue = const FakeAccessibilityFeatures(
      disableAnimations: true,
    );
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
    final store = InMemoryDocumentStore();
    await tester.pumpWidget(_app(store));
    await tester.pump(const Duration(milliseconds: 1200));

    expect(_sticker('Transport'), findsOneWidget);
    expect(_sticker('Minister'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Decree of appointment'), findsOneWidget);

    await tester.tap(find.text('Sign the decree'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Take office'));
    await tester.pumpAndSettle();

    expect(find.text('Choose your city'), findsOneWidget);
    expect(find.text('Baku'), findsOneWidget);
    expect((await LocalProfileRepository(store).load())?.diamonds, DiamondRules.welcomeGift);
  });

  testWidgets('a sworn minister goes straight to the city selection', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(_app(await _sworn()));
    await tester.pumpAndSettle();

    expect(find.text('Choose your city'), findsOneWidget);
  });

  testWidgets('a chosen language translates the whole app', (tester) async {
    for (final (language, title) in const [
      (AppLanguage.turkish, 'Şehrini seç'),
      (AppLanguage.russian, 'Выбери свой город'),
    ]) {
      final store = await _sworn();
      await LocalSettingsRepository(store).saveLanguage(language);
      usePhoneViewport(tester);
      await tester.pumpWidget(_app(store));
      await tester.pumpAndSettle();

      expect(find.text(title), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    }
  });

  testWidgets('tapping the splash skips to the city selection', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(_app(await _sworn()));
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tapAt(const Offset(200, 400));
    await tester.pumpAndSettle();

    expect(find.text('Choose your city'), findsOneWidget);
  });

  testWidgets('a saved city opens straight after the splash', (tester) async {
    usePhoneViewport(tester);
    tester.platformDispatcher.accessibilityFeaturesTestValue = const FakeAccessibilityFeatures(
      disableAnimations: true,
    );
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
    final store = await _sworn();
    await LocalCitySaveRepository(store).store(
      CityId.baku,
      CitySave(
        city: const BakuScenario().create(seed: 1),
        anchor: TimeAnchor(syncedAtMs: DateTime(2026, 11, 11, 8).millisecondsSinceEpoch),
      ),
    );

    await tester.pumpWidget(_app(store));
    await tester.pumpAndSettle();

    expect(find.text('Choose your city'), findsNothing);
    expect(find.text('Wind Heights'), findsWidgets);
  });
}
