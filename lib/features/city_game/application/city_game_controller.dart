import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/city_game/application/away_summary.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_session.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/daily/application/daily_controller.dart';
import 'package:transport_minister/features/inbox/application/inbox_controller.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';

typedef CityCommand = CommandOutcome Function(CityState city);

class CityGameController extends AsyncNotifier<CityGameSession> {
  CityGameController(this.cityId);

  final CityId cityId;

  late TimeAnchor _anchor;
  Timer? _ticker;
  var _paused = false;

  DateTime _now() => ref.read(nowProvider)();

  @override
  Future<CityGameSession> build() async {
    ref.onDispose(_stopTicker);
    final now = _now();
    final saved = await ref.read(citySaveRepositoryProvider).load(cityId);
    final city = saved?.city ?? _newCity(now);
    _anchor = saved?.anchor ?? TimeAnchor(syncedAtMs: now.millisecondsSinceEpoch);
    final session = _catchUp(city, now, summarize: saved != null);
    await _persist(session.city);
    _recordProgress(session.city, session.latestEvents);
    _startTicker();
    return session;
  }

  void tick() {
    final session = state.value;
    if (session == null || _paused || session.city.crisis.dismissed) {
      return;
    }
    final reading = ref.read(simulationClockProvider).read(_anchor, _now());
    _anchor = reading.anchor;
    if (reading.days == 0) {
      state = AsyncData(session.copyWith(dayProgress: reading.dayProgress));
      return;
    }
    final (city, events) = _simulate(session.city, reading.days);
    state = AsyncData(
      session.copyWith(city: city, dayProgress: reading.dayProgress, latestEvents: events),
    );
    unawaited(_persist(city));
    _recordProgress(city, events);
  }

  void pause() {
    tick();
    _paused = true;
    _stopTicker();
  }

  void resume() {
    final session = state.value;
    if (session == null || !_paused) {
      return;
    }
    _paused = false;
    final resumed = _catchUp(session.city, _now(), summarize: true);
    state = AsyncData(resumed.copyWith(awaySummary: resumed.awaySummary ?? session.awaySummary));
    unawaited(_persist(resumed.city));
    _recordProgress(resumed.city, resumed.latestEvents);
    _startTicker();
  }

  Future<CommandOutcome> perform(CityCommand command) async {
    final session = state.requireValue;
    final outcome = command(session.city);
    if (outcome case CommandApplied(state: final city, :final events)) {
      state = AsyncData(session.copyWith(city: city, latestEvents: events));
      await _persist(city);
      _recordProgress(city, events);
    }
    return outcome;
  }

  void dismissAwaySummary() {
    final session = state.value;
    if (session != null) {
      state = AsyncData(session.copyWith(awaySummary: null));
    }
  }

  Future<void> restartCity() async {
    final now = _now();
    _anchor = TimeAnchor(syncedAtMs: now.millisecondsSinceEpoch);
    final city = _newCity(now);
    state = AsyncData(CityGameSession(city: city, dayProgress: 0));
    await _persist(city);
    _startTicker();
  }

  CityGameSession _catchUp(CityState city, DateTime now, {required bool summarize}) {
    final reading = ref.read(simulationClockProvider).read(_anchor, now);
    _anchor = reading.anchor;
    if (reading.days == 0 || city.crisis.dismissed) {
      return CityGameSession(city: city, dayProgress: reading.dayProgress);
    }
    final (next, events) = _simulate(city, reading.days);
    return CityGameSession(
      city: next,
      dayProgress: reading.dayProgress,
      latestEvents: events,
      awaySummary: summarize
          ? AwaySummary.between(city, next, events, capped: reading.capped)
          : null,
    );
  }

  void _recordProgress(CityState city, List<CityEvent> events) {
    unawaited(ref.read(profileProvider.notifier).applyCity(cityId, city, events));
    if (events.isNotEmpty) {
      unawaited(ref.read(inboxProvider.notifier).recordCity(cityId, events));
    }
    unawaited(ref.read(dailyProvider.notifier).track(events, city));
  }

  (CityState, List<CityEvent>) _simulate(CityState city, int days) {
    final simulator = ref.read(cityDayRunnerProvider);
    var current = city;
    final events = <CityEvent>[];
    for (var day = 0; day < days && !current.crisis.dismissed; day++) {
      final result = simulator.advance(current);
      current = result.state;
      events.addAll(result.events);
    }
    return (current, events);
  }

  CityState _newCity(DateTime now) =>
      ref.read(bakuScenarioProvider).create(seed: now.millisecondsSinceEpoch & 0x7fffffff);

  Future<void> _persist(CityState city) {
    return ref
        .read(citySaveRepositoryProvider)
        .store(cityId, CitySave(city: city, anchor: _anchor));
  }

  void _startTicker() {
    _ticker ??= Timer.periodic(ref.read(tickIntervalProvider), (_) => tick());
  }

  void _stopTicker() {
    _ticker?.cancel();
    _ticker = null;
  }
}
