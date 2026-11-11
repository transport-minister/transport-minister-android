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

import '../helpers/phone_viewport.dart';

Widget _app(InMemoryDocumentStore store) {
  return ProviderScope(
    overrides: [
      documentStoreProvider.overrideWithValue(store),
      nowProvider.overrideWithValue(() => DateTime(2026, 11, 11, 8)),
      tickIntervalProvider.overrideWithValue(const Duration(hours: 1)),
    ],
    child: const TransportMinisterApp(),
  );
}

Finder _sticker(String text) {
  return find.byWidgetPredicate((widget) => widget is StickerText && widget.text == text);
}

void main() {
  testWidgets('shows the splash and then the city selection', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(_app(InMemoryDocumentStore()));
    await tester.pump(const Duration(milliseconds: 1200));

    expect(_sticker('Transport'), findsOneWidget);
    expect(_sticker('Minister'), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Choose your city'), findsOneWidget);
    expect(find.text('Baku'), findsOneWidget);
  });

  testWidgets('tapping the splash skips to the city selection', (tester) async {
    usePhoneViewport(tester);
    await tester.pumpWidget(_app(InMemoryDocumentStore()));
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
    final store = InMemoryDocumentStore();
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
    expect(find.text('Wind Heights'), findsOneWidget);
  });
}
