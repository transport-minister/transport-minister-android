import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diplomacy/presentation/diplomacy_screen.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/funded_city.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  late InMemoryDocumentStore store;
  late FakeNow now;

  setUp(() async {
    store = InMemoryDocumentStore();
    now = FakeNow(DateTime(2026, 11, 11, 8));
    await saveFundedBaku(store, now);
  });

  testWidgets('a gesture spends money, wins points and then rests', (tester) async {
    await pumpGameScreen(
      tester,
      const DiplomacyScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );
    final container = ProviderScope.containerOf(tester.element(find.byType(DiplomacyScreen)));

    expect(find.text('Cheaper tickets'), findsOneWidget);
    expect(find.text('+8 diplomacy'), findsOneWidget);

    await tester.ensureVisible(find.text('Do it · \$120K'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Do it · \$120K'));
    await tester.pumpAndSettle();

    final city = container.read(cityGameProvider(CityId.baku)).requireValue.city;
    expect(city.budget, fundedBudget - 120000);
    expect(city.diplomacyPoints, 8);
    expect(find.text('READY IN 3M'), findsOneWidget);
  });
}
