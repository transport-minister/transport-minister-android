import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/city_selection/data/static_city_repository.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/domain/city_unlocks.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';

import '../../core/simulation/simulation_test_kit.dart';

void main() {
  late InMemoryDocumentStore store;

  ProviderContainer open() {
    final container = ProviderContainer(
      overrides: [documentStoreProvider.overrideWithValue(store)],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() => store = InMemoryDocumentStore());

  test('keeps the best level reached in each city', () async {
    final container = open();
    await container.read(profileProvider.future);
    final controller = container.read(profileProvider.notifier);

    await controller.applyCity(CityId.baku, newBaku().copyWith(developmentPoints: 220), const []);
    await controller.applyCity(CityId.baku, newBaku().copyWith(developmentPoints: 40), const []);

    expect((await open().read(profileProvider.future)).bestLevelIn(CityId.baku), 4);
  });

  test('the oath brings diamonds once, and they can be spent only once', () async {
    final container = open();
    await container.read(profileProvider.future);
    final controller = container.read(profileProvider.notifier);

    await controller.takeOath();
    await controller.takeOath();
    final afterGift = container.read(profileProvider).requireValue.diamonds;
    final spent = await controller.spendDiamonds(DiamondRules.welcomeGift);
    final refused = await controller.spendDiamonds(1);

    expect(afterGift, DiamondRules.welcomeGift);
    expect(container.read(profileProvider).requireValue.oathTaken, isTrue);
    expect(spent, isTrue);
    expect(refused, isFalse);
    expect((await open().read(profileProvider.future)).diamonds, 0);
  });

  test('cities unlock one after another', () {
    const unlocks = CityUnlocks();
    final cities = const StaticCityRepository().fetchCities();
    final istanbul = cities.firstWhere((city) => city.id == CityId.istanbul);
    final london = cities.firstWhere((city) => city.id == CityId.london);
    const levelTen = MinisterProfile(bestCityLevels: {CityId.baku: 10});
    const finishedBaku = MinisterProfile(
      bestCityLevels: {CityId.baku: 10},
      completedCities: {CityId.baku},
    );

    expect(unlocks.accessFor(istanbul, const MinisterProfile()), CityAccess.locked);
    expect(unlocks.accessFor(istanbul, levelTen), CityAccess.locked);
    expect(unlocks.accessFor(istanbul, finishedBaku), CityAccess.comingSoon);
    expect(unlocks.accessFor(london, finishedBaku), CityAccess.locked);
    expect(
      unlocks.progressFor(istanbul, const MinisterProfile(bestCityLevels: {CityId.baku: 5})),
      closeTo(0.45, 0.001),
    );
    expect(unlocks.progressFor(istanbul, finishedBaku), 1);
    expect(unlocks.unlockedBy(cities, CityId.baku)?.id, CityId.istanbul);
  });
}
