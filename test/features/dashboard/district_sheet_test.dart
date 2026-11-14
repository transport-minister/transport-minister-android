import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/dashboard/presentation/widgets/district/district_sheet.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';

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

  Future<ProviderContainer> openOldFortress(
    WidgetTester tester, {
    VoidCallback? onOpenTechnology,
  }) async {
    await pumpGameScreen(
      tester,
      Scaffold(
        body: DistrictSheet(
          cityId: CityId.baku,
          district: DistrictId.oldFortress,
          onOpenTechnology: onOpenTechnology ?? () {},
        ),
      ),
      store: store,
      now: now,
    );
    return ProviderScope.containerOf(tester.element(find.byType(DistrictSheet)));
  }

  CityState cityIn(ProviderContainer container) =>
      container.read(cityGameProvider(CityId.baku)).requireValue.city;

  Finder cardOf(String title) =>
      find.ancestor(of: find.text(title), matching: find.byType(ChunkyCard));

  Future<void> reveal(WidgetTester tester, Finder finder) async {
    await tester.scrollUntilVisible(finder, 200, scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
  }

  testWidgets('a contract can order several buses at once', (tester) async {
    final container = await openOldFortress(tester);
    final before = cityIn(container);
    final card = cardOf('CityRunner 12');

    for (var extra = 0; extra < 2; extra++) {
      await tester.tap(find.descendant(of: card, matching: find.byIcon(Icons.add_rounded)));
      await tester.pump();
    }
    await tester.tap(find.text('Sign · \$630K'));
    await tester.pumpAndSettle();

    final after = cityIn(container);
    expect(after.budget, before.budget - 630000);
    expect(after.fleet, hasLength(before.fleet.length + 3));
    await reveal(tester, find.text('+3 COMING'));
    expect(find.text('+3 COMING'), findsOneWidget);
  });

  testWidgets('locked bus models lead to the technology tree', (tester) async {
    var opened = false;
    await openOldFortress(tester, onOpenTechnology: () => opened = true);

    await reveal(tester, find.text('Needs Hop Mini contract'));
    await tester.tap(find.descendant(of: cardOf('Hop Mini'), matching: find.text('Technology')));

    expect(opened, isTrue);
  });

  testWidgets('a bus can be sold for part of its value', (tester) async {
    final container = await openOldFortress(tester);
    final before = cityIn(container);

    await reveal(tester, find.text('Buses here'));
    await reveal(tester, find.textContaining('Sell ·').first);
    await tester.tap(find.textContaining('Sell ·').first);
    await tester.pumpAndSettle();

    final after = cityIn(container);
    expect(after.fleet, hasLength(before.fleet.length - 1));
    expect(after.budget, greaterThan(before.budget));
  });

  testWidgets('the build tab starts construction and blocks a second site', (tester) async {
    final container = await openOldFortress(tester);

    await tester.tap(find.text('Build'));
    await tester.pumpAndSettle();
    await reveal(tester, find.text('Build · \$180K'));
    await tester.tap(find.text('Build · \$180K'));
    await tester.pumpAndSettle();

    expect(cityIn(container).projects.single.districtId, DistrictId.oldFortress);
    expect(find.text('1M 30S LEFT'), findsOneWidget);
    expect(find.text('Work is already underway here'), findsWidgets);
  });

  testWidgets('a running project can be finished now with diamonds', (tester) async {
    await LocalProfileRepository(store)
        .save(const MinisterProfile(tutorialDone: true, diamonds: 20));
    final container = await openOldFortress(tester);

    await tester.tap(find.text('Build'));
    await tester.pumpAndSettle();
    await reveal(tester, find.text('Build · \$180K'));
    await tester.tap(find.text('Build · \$180K'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Finish now · 5'));
    await tester.pumpAndSettle();

    expect(cityIn(container).projects.single.remainingSeconds, 1);
    expect(container.read(profileProvider).requireValue.diamonds, 15);
  });

  testWidgets('a city park and a park and ride can be built from the build tab', (tester) async {
    final container = await openOldFortress(tester);

    await tester.tap(find.text('Build'));
    await tester.pumpAndSettle();
    await reveal(tester, find.text('Park & Ride'));

    expect(find.text('City park'), findsOneWidget);
    expect(find.text('Walkers happier'), findsOneWidget);
    expect(find.text('More bus riders'), findsOneWidget);

    final buildPark = find.descendant(
      of: cardOf('City park'),
      matching: find.text('Build · \$300K'),
    );
    await reveal(tester, buildPark);
    await tester.tap(buildPark);
    await tester.pumpAndSettle();

    expect(cityIn(container).projects.single.type, ProjectType.cityPark);
  });

  testWidgets('the metro tab leads to technology until the contract is signed', (tester) async {
    var opened = false;
    await openOldFortress(tester, onOpenTechnology: () => opened = true);

    await tester.tap(find.text('Metro'));
    await tester.pumpAndSettle();
    await reveal(tester, find.text('Needs Metro contract'));
    await tester.tap(find.text('Technology'));

    expect(opened, isTrue);
  });

  testWidgets('with the contract a tunnel can be dug to a neighbour', (tester) async {
    await LocalCitySaveRepository(store).store(
      CityId.baku,
      CitySave(
        city: const BakuScenario()
            .create(seed: 1)
            .copyWith(budget: fundedBudget, technologies: {TechnologyId.metroContract}),
        anchor: TimeAnchor(syncedAtMs: now.current.millisecondsSinceEpoch),
      ),
    );
    final container = await openOldFortress(tester);

    await tester.tap(find.text('Metro'));
    await tester.pumpAndSettle();
    await reveal(tester, find.text('Dig · \$1.5M').first);
    await tester.tap(find.text('Dig · \$1.5M').first);
    await tester.pumpAndSettle();

    final line = cityIn(container).metroLines.single;
    expect(line.joins(DistrictId.oldFortress, DistrictId.windHeights), isTrue);
    expect(find.text('4M LEFT'), findsOneWidget);
  });
}
