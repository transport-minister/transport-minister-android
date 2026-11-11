import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';

import '../../helpers/fake_now.dart';

void main() {
  late InMemoryDocumentStore store;
  late FakeNow now;

  setUp(() {
    store = InMemoryDocumentStore();
    now = FakeNow(DateTime(2026, 11, 11, 8));
  });

  ProviderContainer openGame() {
    final container = ProviderContainer(
      overrides: [
        documentStoreProvider.overrideWithValue(store),
        nowProvider.overrideWithValue(now.call),
        tickIntervalProvider.overrideWithValue(const Duration(days: 1)),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final baku = cityGameProvider(CityId.baku);

  test('the first visit founds a fresh Baku and saves it', () async {
    final session = await openGame().read(baku.future);
    final saved = await openGame().read(citySaveRepositoryProvider).load(CityId.baku);

    expect(session.city.day, 1);
    expect(session.awaySummary, isNull);
    expect(saved?.city, session.city);
  });

  test('coming back later replays the missed days and summarizes them', () async {
    await openGame().read(baku.future);
    now.advance(const Duration(minutes: 3, seconds: 20));

    final session = await openGame().read(baku.future);

    expect(session.city.day, 4);
    expect(session.dayProgress, closeTo(1 / 3, 0.01));
    expect(session.awaySummary?.days, 3);
    expect(session.awaySummary?.capped, isFalse);
  });

  test('a long absence is capped at seven days', () async {
    await openGame().read(baku.future);
    now.advance(const Duration(hours: 5));

    final session = await openGame().read(baku.future);

    expect(session.city.day, 8);
    expect(session.awaySummary?.capped, isTrue);
  });

  test('time ticks into new days while playing', () async {
    final container = openGame();
    await container.read(baku.future);

    now.advance(const Duration(seconds: 61));
    container.read(baku.notifier).tick();

    expect(container.read(baku).requireValue.city.day, 2);
  });

  test('a paused city waits and catches up with a summary on resume', () async {
    final container = openGame();
    await container.read(baku.future);
    final controller = container.read(baku.notifier)..pause();

    now.advance(const Duration(minutes: 5));
    controller.tick();
    final whilePaused = container.read(baku).requireValue.city.day;
    controller.resume();
    final resumed = container.read(baku).requireValue;

    expect(whilePaused, 1);
    expect(resumed.city.day, 6);
    expect(resumed.awaySummary?.days, 5);
  });

  test('applied commands are saved and rejected ones change nothing', () async {
    final container = openGame();
    final before = await container.read(baku.future);
    final controller = container.read(baku.notifier);

    final bought = await controller.perform(
      (city) => const CityCommands().buyBus(
        city,
        model: BusModelId.cityRunner,
        district: DistrictId.windHeights,
      ),
    );
    final refused = await controller.perform((city) => const CityCommands().setFare(city, 999));
    final saved = await container.read(citySaveRepositoryProvider).load(CityId.baku);

    expect(bought, isA<CommandApplied>());
    expect(refused, isA<CommandRejected>());
    expect(saved?.city.fleet, hasLength(before.city.fleet.length + 1));
    expect(saved?.city.fare, before.city.fare);
  });
}
