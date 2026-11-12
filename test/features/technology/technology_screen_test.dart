import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/technology/presentation/technology_screen.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  testWidgets('diplomacy points and money unlock a bus contract', (tester) async {
    final store = InMemoryDocumentStore();
    final now = FakeNow(DateTime(2026, 11, 12, 9));
    await LocalCitySaveRepository(store).store(
      CityId.baku,
      CitySave(
        city: const BakuScenario().create(seed: 1).copyWith(diplomacyPoints: 20, budget: 2500000),
        anchor: TimeAnchor(syncedAtMs: now.current.millisecondsSinceEpoch),
      ),
    );

    await pumpGameScreen(
      tester,
      const TechnologyScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    expect(find.text('Hop Mini contract'), findsOneWidget);
    expect(find.text('Needs Hop Mini contract'), findsOneWidget);

    await tester.tap(find.text('Unlock').first);
    await tester.pumpAndSettle();

    final saved = await LocalCitySaveRepository(store).load(CityId.baku);
    expect(saved?.city.technologies, {TechnologyId.minibusContract});
    expect(saved?.city.diplomacyPoints, 20 - TechnologyId.minibusContract.diplomacy);
    expect(find.text('UNLOCKED'), findsOneWidget);
  });
}
