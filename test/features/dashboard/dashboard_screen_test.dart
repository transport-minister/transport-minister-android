import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/boost_rules.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/bus.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/advisor/presentation/advisor_sheet.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/dashboard_screen.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_map.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/city_stats_panel.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/dashboard_hud.dart';
import 'package:transport_minister/features/inbox/data/local_inbox_repository.dart';
import 'package:transport_minister/features/inbox/domain/inbox.dart';
import 'package:transport_minister/features/inbox/domain/inbox_rules.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/sound/domain/game_sound.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/fake_rewarded_ads.dart';
import '../../helpers/fake_sound_output.dart';
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

  testWidgets('a new city shows its budget and level without days', (tester) async {
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );

    expect(find.text('DAY'), findsNothing);
    expect(find.text('\$2.5M'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsNothing);
    expect(find.byIcon(Icons.settings_rounded), findsOneWidget);
    expect(find.byIcon(Icons.handshake_rounded), findsWidgets);
    expect(find.byIcon(Icons.diamond_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.diamond_rounded));
    await tester.pumpAndSettle();

    expect(find.text('How to earn them'), findsOneWidget);
    await tester.tapAt(const Offset(200, 40));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<StatPill>(
            find.descendant(
              of: find.byType(DashboardHud),
              matching: find.widgetWithIcon(StatPill, Icons.handshake_rounded),
            ),
          )
          .onPressed,
      isNull,
    );
    expect(
      find.descendant(of: find.byType(CityStatsPanel), matching: find.textContaining('/s')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: find.byType(CityStatsPanel), matching: find.textContaining(',')),
      findsOneWidget,
    );
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
    expect(find.text('Make citizens 78% happy'), findsOneWidget);
    expect(find.text('Complete Baku to unlock Istanbul.'), findsOneWidget);
  });

  testWidgets('a gridlock crisis is named in the banner', (tester) async {
    await saveBaku(
      syncedAt: now.current,
      crisis: const CrisisState(seconds: 120, warnings: 1, cause: CrisisCause.gridlock),
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

    now.advance(const Duration(seconds: 5));
    controller.tick();
    await tester.pumpAndSettle();
    final whilePlaying = container.read(cityGameProvider(CityId.baku)).requireValue.city.tick;

    unawaited(
      tester
          .state<NavigatorState>(find.byType(Navigator))
          .pushReplacement(MaterialPageRoute<void>(builder: (context) => const SizedBox())),
    );
    await tester.pumpAndSettle();
    now.advance(const Duration(minutes: 30));
    controller.tick();

    expect(whilePlaying, 5);
    expect(container.read(cityGameProvider(CityId.baku)).requireValue.city.tick, 5);
  });

  testWidgets('the city map has its own sounds and arriving buses hiss their doors', (
    tester,
  ) async {
    final sound = FakeSoundOutput();
    final city = const BakuScenario().create(seed: 1);
    await LocalCitySaveRepository(store).store(
      CityId.baku,
      CitySave(
        city: city.copyWith(
          fleet: [
            ...city.fleet,
            const Bus(
              id: 999,
              model: BusModelId.cityRunner,
              districtId: DistrictId.oldFortress,
              deliveryTick: 3,
            ),
          ],
        ),
        anchor: TimeAnchor(syncedAtMs: now.current.millisecondsSinceEpoch),
      ),
    );
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
      sound: sound,
    );

    expect(sound.loops.keys, unorderedEquals(GameLoop.values));

    final container = ProviderScope.containerOf(tester.element(find.byType(DashboardScreen)));
    now.advance(const Duration(seconds: 3));
    container.read(cityGameProvider(CityId.baku).notifier).tick();
    await tester.pumpAndSettle();

    expect(sound.played.map((played) => played.$1), contains(GameSound.busDoors));

    unawaited(
      tester
          .state<NavigatorState>(find.byType(Navigator))
          .pushReplacement(MaterialPageRoute<void>(builder: (context) => const SizedBox())),
    );
    await tester.pumpAndSettle();

    expect(sound.loops.keys, [GameLoop.music]);
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

  testWidgets('a dismissed minister can start over with an empty inbox', (tester) async {
    await saveBaku(
      syncedAt: now.current,
      crisis: const CrisisState(seconds: 300, warnings: 3, dismissed: true),
    );
    await LocalInboxRepository(store).save(
      const InboxRules().addCityEvents(const Inbox(), CityId.baku, const [
        CrisisWarning(3),
        MinisterDismissed(),
      ], now.current),
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
    expect((await LocalInboxRepository(store).load())?.items, isEmpty);
  });

  testWidgets('a returning minister collects the money the city earned', (tester) async {
    await saveBaku(syncedAt: now.current.subtract(const Duration(hours: 1)));

    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );
    final container = ProviderScope.containerOf(tester.element(find.byType(DashboardScreen)));
    final before = container.read(cityGameProvider(CityId.baku)).requireValue;

    expect(find.text('Welcome back, Minister!'), findsOneWidget);
    expect(before.welcome?.awaySeconds, 3600);

    await tester.tap(find.textContaining('Collect'));
    await tester.pumpAndSettle();
    final after = container.read(cityGameProvider(CityId.baku)).requireValue;

    expect(find.text('Welcome back, Minister!'), findsNothing);
    expect(after.city.budget, before.city.budget + before.welcome!.earnings);
  });

  testWidgets('a video doubles the welcome back money', (tester) async {
    final ads = FakeRewardedAds();
    await saveBaku(syncedAt: now.current.subtract(const Duration(hours: 1)));

    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
      ads: ads,
    );
    final container = ProviderScope.containerOf(tester.element(find.byType(DashboardScreen)));
    final before = container.read(cityGameProvider(CityId.baku)).requireValue;

    await tester.tap(find.textContaining('watch a video'));
    await tester.pumpAndSettle();
    final after = container.read(cityGameProvider(CityId.baku)).requireValue;

    expect(ads.shows, 1);
    expect(after.city.budget, before.city.budget + before.welcome!.earnings * 2);
  });

  testWidgets('a video keeps the seat once for free', (tester) async {
    final ads = FakeRewardedAds();
    await saveBaku(
      syncedAt: now.current,
      crisis: const CrisisState(seconds: 300, warnings: 3, dismissed: true),
    );

    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
      ads: ads,
    );
    await tester.tap(find.text('Keep my seat · watch a video'));
    await tester.pumpAndSettle();
    final container = ProviderScope.containerOf(tester.element(find.byType(DashboardScreen)));
    final city = container.read(cityGameProvider(CityId.baku)).requireValue.city;

    expect(find.text('Wind Heights'), findsWidgets);
    expect(city.videoContinueUsed, isTrue);
    expect((await LocalProfileRepository(store).load())?.diamonds, 0);

    await container
        .read(cityGameProvider(CityId.baku).notifier)
        .perform(
          (city) => CommandApplied(city.copyWith(crisis: city.crisis.copyWith(dismissed: true))),
        );
    await tester.pumpAndSettle();

    expect(find.text('You have been dismissed'), findsOneWidget);
    expect(find.text('Keep my seat · watch a video'), findsNothing);
  });

  testWidgets('the diamond mine pays two diamonds per video', (tester) async {
    final ads = FakeRewardedAds();
    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
      ads: ads,
    );

    await tester.tap(find.byIcon(Icons.diamond_rounded).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Watch'));
    await tester.pumpAndSettle();

    expect(find.text('+2 for a short video · 2 left today'), findsOneWidget);
    expect((await LocalProfileRepository(store).load())?.diamonds, 2);
  });

  testWidgets('a dismissed minister can keep the seat for diamonds', (tester) async {
    await LocalProfileRepository(store)
        .save(const MinisterProfile(tutorialDone: true, diamonds: BoostRules.continueCost));
    await saveBaku(
      syncedAt: now.current,
      crisis: const CrisisState(seconds: 300, warnings: 3, dismissed: true),
    );

    await pumpGameScreen(
      tester,
      const DashboardScreen(cityId: CityId.baku),
      store: store,
      now: now,
    );
    await tester.tap(find.text('Keep my seat · ${BoostRules.continueCost}'));
    await tester.pumpAndSettle();

    expect(find.text('You have been dismissed'), findsNothing);
    expect(find.text('Wind Heights'), findsWidgets);
    expect((await LocalProfileRepository(store).load())?.diamonds, 0);
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
