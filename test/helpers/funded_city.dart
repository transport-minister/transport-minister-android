import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';

import 'fake_now.dart';

const fundedBudget = 2500000;

Future<void> saveFundedBaku(InMemoryDocumentStore store, FakeNow now) {
  final city = const BakuScenario().create(seed: now.current.millisecondsSinceEpoch & 0x7fffffff);
  return LocalCitySaveRepository(store).store(
    CityId.baku,
    CitySave(
      city: city.copyWith(budget: fundedBudget),
      anchor: TimeAnchor(syncedAtMs: now.current.millisecondsSinceEpoch),
    ),
  );
}
