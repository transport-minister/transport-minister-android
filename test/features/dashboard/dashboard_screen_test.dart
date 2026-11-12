import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/advisor/presentation/advisor_sheet.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/dashboard_screen.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/day_clock_badge.dart';

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

    expect(
      find.descendant(of: find.byType(DayClockBadge), matching: find.text('1')),
      findsOneWidget,
    );
    expect(find.text('\$2.5M'), findsOneWidget);
    expect(find.text('Wind Heights'), findsWidgets);
    expect(find.text('Level 1'), findsOneWidget);
    expect(find.text('Yesterday\'s money'), findsNothing);
    expect(find.text('Smooth'), findsNothing);
    expect(find.byIcon(Icons.add_rounded), findsNothing);
    expect(find.text('58%'), findsNothing);
  });

  testWidgets('the goal chip opens the city goal', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    expect(find.text('GOAL 0/3'), findsOneWidget);

    await tester.tap(find.text('GOAL 0/3'));
    await tester.pumpAndSettle();

    expect(find.text('City goal'), findsOneWidget);
    expect(find.text('Level 1/10'), findsOneWidget);
    expect(find.text('0/13'), findsOneWidget);
    expect(find.text('Make citizens 75% happy'), findsOneWidget);
    expect(find.text('Complete Baku to unlock Istanbul.'), findsOneWidget);
  });

  testWidgets('a gridlock crisis is named in the banner', (tester) async {
    await saveBaku(
      syncedAt: now.current,
      crisis: const CrisisState(days: 4, warnings: 1, cause: CrisisCause.gridlock),
    );

    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    expect(find.text("President's warning 1/3: clear the traffic!"), findsOneWidget);
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
    await tester.ensureVisible(find.text('Sign · \$210K'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sign · \$210K'));
    await tester.pumpAndSettle();

    expect(find.text('\$2.29M'), findsOneWidget);
    expect(find.byType(SnackBar), findsNothing);
  });

  testWidgets('the clock stops when the minister leaves the dashboard', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );
    final container = ProviderScope.containerOf(tester.element(find.byType(DashboardScreen)));
    final controller = container.read(cityGameProvider(CityId.baku).notifier);

    now.advance(const Duration(seconds: 61));
    controller.tick();
    await tester.pumpAndSettle();
    final whilePlaying = container.read(cityGameProvider(CityId.baku)).requireValue.city.day;

    unawaited(
      tester
          .state<NavigatorState>(find.byType(Navigator))
          .pushReplacement(MaterialPageRoute<void>(builder: (context) => const SizedBox())),
    );
    await tester.pumpAndSettle();
    now.advance(const Duration(minutes: 30));
    controller.tick();

    expect(whilePlaying, 2);
    expect(container.read(cityGameProvider(CityId.baku)).requireValue.city.day, 2);
  });

  testWidgets('a level up is celebrated once', (tester) async {
    final city = const BakuScenario().create(seed: 1).copyWith(developmentPoints: 39);
    await LocalCitySaveRepository(store).store(
      CityId.baku,
      CitySave(
        city: city,
        anchor: TimeAnchor(syncedAtMs: now.current.millisecondsSinceEpoch),
      ),
    );
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );
    final container = ProviderScope.containerOf(tester.element(find.byType(DashboardScreen)));
    final controller = container.read(cityGameProvider(CityId.baku).notifier);

    now.advance(const Duration(seconds: 61));
    controller.tick();
    await tester.pumpAndSettle();
    for (var second = 0; second < 3; second++) {
      now.advance(const Duration(seconds: 1));
      controller.tick();
      await tester.pumpAndSettle();
    }

    expect(find.text('Hooray!'), findsOneWidget);

    await tester.tap(find.text('Hooray!'));
    await tester.pumpAndSettle();

    expect(find.text('Hooray!'), findsNothing);
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
