import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/app/transport_minister_app.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/data/static_city_repository.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';

import '../../helpers/phone_viewport.dart';

Future<void> _openCitySelection(WidgetTester tester) async {
  usePhoneViewport(tester);
  tester.platformDispatcher.accessibilityFeaturesTestValue = const FakeAccessibilityFeatures(
    disableAnimations: true,
  );
  addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        documentStoreProvider.overrideWithValue(InMemoryDocumentStore()),
        tickIntervalProvider.overrideWithValue(const Duration(hours: 1)),
      ],
      child: const TransportMinisterApp(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  test('only Baku is playable at launch', () {
    final playable = const StaticCityRepository()
        .fetchCities()
        .where((city) => city.isPlayable)
        .map((city) => city.id);

    expect(playable, [CityId.baku]);
  });

  testWidgets('playing Baku opens its dashboard', (tester) async {
    await _openCitySelection(tester);

    await tester.tap(find.text('Play'));
    await tester.pumpAndSettle();

    expect(find.text('Wind Heights'), findsWidgets);
  });

  testWidgets('coming soon city explains it is on its way', (tester) async {
    await _openCitySelection(tester);

    await tester.scrollUntilVisible(find.text('Istanbul'), 200);
    await tester.tap(find.text('Istanbul'));
    await tester.pumpAndSettle();

    expect(find.text('Istanbul is on its way!'), findsOneWidget);
  });

  testWidgets('locked city names the rank that unlocks it', (tester) async {
    await _openCitySelection(tester);

    await tester.scrollUntilVisible(find.text('Tokyo'), 200);
    await tester.tap(find.text('Tokyo'));
    await tester.pumpAndSettle();

    expect(find.text('Tokyo is locked'), findsOneWidget);
    expect(
      find.text('Reach the rank of Senior Transport Minister to unlock this city.'),
      findsOneWidget,
    );
  });
}
