import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/dashboard_screen.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/tutorial/application/tutorial_controller.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  test('the tour waits for the player to open a district and buy a bus', () {
    final container = ProviderContainer(
      overrides: [documentStoreProvider.overrideWithValue(InMemoryDocumentStore())],
    );
    addTearDown(container.dispose);
    final tutorial = container.read(tutorialProvider.notifier)..start();

    for (var step = 0; step < 4; step++) {
      tutorial.next();
    }
    tutorial.next();
    final waiting = container.read(tutorialProvider);
    tutorial
      ..onDistrictOpened()
      ..onDistrictClosed();
    final reverted = container.read(tutorialProvider);
    tutorial
      ..onDistrictOpened()
      ..onCityEvents(const [BusPurchased(BusModelId.cityRunner, DistrictId.oilHarbor)]);

    expect(waiting, TutorialStep.district);
    expect(reverted, TutorialStep.district);
    expect(container.read(tutorialProvider), TutorialStep.busBought);
  });

  testWidgets('a new minister is greeted by Mr. Bus and can skip the tour', (tester) async {
    final store = InMemoryDocumentStore();
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: FakeNow(DateTime(2026, 11, 16, 9)),
      tutorialDone: false,
    );

    expect(find.text('Hi Minister!'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.textContaining('This is your budget'), findsOneWidget);

    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    expect(find.textContaining('This is your budget'), findsNothing);
    expect((await LocalProfileRepository(store).load())?.tutorialDone, isTrue);
  });
}
