import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/advisor/presentation/advisor_sheet.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/dashboard_screen.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district_strip.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  late InMemoryDocumentStore store;
  late FakeNow now;

  setUp(() {
    store = InMemoryDocumentStore();
    now = FakeNow(DateTime(2026, 11, 11, 8));
  });

  Future<void> saveBaku({required DateTime syncedAt, CrisisState? crisis}) {
    final city = const BakuScenario().create(seed: 1);
    return LocalCitySaveRepository(store).store(
      CityId.baku,
      CitySave(
        city: crisis == null ? city : city.copyWith(crisis: crisis),
        anchor: TimeAnchor(syncedAtMs: syncedAt.millisecondsSinceEpoch),
      ),
    );
  }

  testWidgets('a new city shows its day, budget and mood', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    expect(find.text('1'), findsOneWidget);
    expect(find.text('\$2.5M'), findsOneWidget);
    expect(find.text('Wind Heights'), findsWidgets);
    expect(find.text('Yesterday\'s money'), findsNothing);
  });

  testWidgets('adding a bus from a district spends the budget', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    await tester.tap(
      find.descendant(of: find.byType(DistrictMarker), matching: find.text('Old Fortress')),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add bus · \$210K'));
    await tester.pumpAndSettle();

    expect(find.text('\$2.29M'), findsOneWidget);
    expect(find.text('Bus ordered! It joins the fleet tomorrow.'), findsOneWidget);
  });

  testWidgets('coming back after a few minutes shows what happened', (tester) async {
    await saveBaku(syncedAt: now.current.subtract(const Duration(minutes: 4)));

    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    expect(find.text('While you were away'), findsOneWidget);
    expect(find.text('4 days passed in Baku'), findsOneWidget);

    await tester.tap(find.text('Let\'s go!'));
    await tester.pumpAndSettle();

    expect(find.text('While you were away'), findsNothing);
    expect(find.text('Yesterday\'s money'), findsOneWidget);
  });

  testWidgets('a dismissed minister can start over', (tester) async {
    await saveBaku(
      syncedAt: now.current,
      crisis: const CrisisState(days: 10, warnings: 3, dismissed: true),
    );

    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    expect(find.text('You have been dismissed'), findsOneWidget);

    await tester.tap(find.text('Start over'));
    await tester.pumpAndSettle();

    expect(find.text('You have been dismissed'), findsNothing);
    expect(find.text('Wind Heights'), findsWidgets);
  });

  testWidgets('the busiest district comes first in the strip and opens on tap', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    await tester.tap(
      find.descendant(of: find.byType(DistrictStrip), matching: find.text('Oil Harbor')),
    );
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    expect(find.text('Cranes, trucks and the city\'s cargo gate'), findsOneWidget);
  });

  testWidgets('tapping a district on the map opens it', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    await tester.tap(
      find.descendant(of: find.byType(DistrictMarker), matching: find.text('Old Fortress')),
    );
    await tester.pumpAndSettle();

    expect(find.text('Narrow lanes, ancient walls, crowds of tourists'), findsOneWidget);
  });

  testWidgets('Mr. Bus gives a tip and can show the district', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    await tester.tap(find.byType(MrBusButton));
    await tester.pumpAndSettle();

    expect(find.text('Mr. Bus says'), findsOneWidget);
    expect(find.textContaining('People in Oil Harbor wait'), findsOneWidget);

    await tester.tap(find.text('Show me'));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pumpAndSettle();

    expect(find.text('Cranes, trucks and the city\'s cargo gate'), findsOneWidget);
  });
}
