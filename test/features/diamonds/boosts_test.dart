import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diamonds/application/boosts.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';

void main() {
  late InMemoryDocumentStore store;
  late ProviderContainer container;

  setUp(() async {
    store = InMemoryDocumentStore();
    await LocalProfileRepository(store)
        .save(const MinisterProfile(tutorialDone: true, diamonds: 10));
    container = ProviderContainer(overrides: [documentStoreProvider.overrideWithValue(store)]);
    addTearDown(container.dispose);
    await container.read(profileProvider.future);
    await container.read(cityGameProvider(CityId.baku).future);
  });

  int diamonds() => container.read(profileProvider).requireValue.diamonds;

  test('a boost takes its diamonds and changes the city', () async {
    final outcome = await container
        .read(boostsProvider)
        .buy(CityId.baku, cost: 3, command: const CityCommands().boostEarnings);

    expect(outcome, BoostOutcome.applied);
    expect(diamonds(), 7);
    expect(container.read(cityGameProvider(CityId.baku)).requireValue.city.boostActive, isTrue);
    expect((await LocalProfileRepository(store).load())?.diamonds, 7);
  });

  test('without enough diamonds nothing changes', () async {
    final outcome = await container
        .read(boostsProvider)
        .buy(CityId.baku, cost: 50, command: const CityCommands().boostEarnings);

    expect(outcome, BoostOutcome.notEnoughDiamonds);
    expect(diamonds(), 10);
    expect(container.read(cityGameProvider(CityId.baku)).requireValue.city.boostActive, isFalse);
  });

  test('a boost the city refuses costs nothing', () async {
    final boosts = container.read(boostsProvider);
    await boosts.buy(CityId.baku, cost: 3, command: const CityCommands().boostEarnings);

    final again = await boosts.buy(
      CityId.baku,
      cost: 3,
      command: const CityCommands().boostEarnings,
    );

    expect(again, BoostOutcome.rejected);
    expect(diamonds(), 7);
  });
}
