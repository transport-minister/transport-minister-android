import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/engine/baku_scenario.dart';
import 'package:transport_minister/core/simulation/engine/day_simulator.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_controller.dart';
import 'package:transport_minister/features/city_game/application/city_game_session.dart';
import 'package:transport_minister/features/city_game/data/local_city_save_repository.dart';
import 'package:transport_minister/features/city_game/domain/city_save_repository.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';

final citySaveRepositoryProvider = Provider<CitySaveRepository>(
  (ref) => LocalCitySaveRepository(ref.watch(documentStoreProvider)),
);

final simulationClockProvider = Provider<SimulationClock>((ref) => const SimulationClock());

final daySimulatorProvider = Provider<DaySimulator>((ref) => const DaySimulator());

final bakuScenarioProvider = Provider<BakuScenario>((ref) => const BakuScenario());

final tickIntervalProvider = Provider<Duration>((ref) => const Duration(seconds: 1));

final cityGameProvider = AsyncNotifierProvider.family<CityGameController, CityGameSession, CityId>(
  CityGameController.new,
);
