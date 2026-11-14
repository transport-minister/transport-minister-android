import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/catalog/offline_rules.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/engine/economy_calculator.dart';
import 'package:transport_minister/core/simulation/engine/metrics_calculator.dart';
import 'package:transport_minister/core/simulation/engine/simulation_clock.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/simulation/model/command_outcome.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_session.dart';
import 'package:transport_minister/features/city_game/domain/city_save.dart';
import 'package:transport_minister/features/city_game/domain/welcome_back.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/daily/application/daily_controller.dart';
import 'package:transport_minister/features/inbox/application/inbox_controller.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';

typedef CityCommand = CommandOutcome Function(CityState city);

class CityGameController extends AsyncNotifier<CityGameSession> {
  CityGameController(this.cityId);

  static const _saveEveryTicks = 10;

  final CityId cityId;

  late TimeAnchor _anchor;
  var _savedTick = 0;
  Timer? _ticker;
  var _paused = true;
  var _onDashboard = false;
  var _appActive = true;

  DateTime _now() => ref.read(nowProvider)();

  @override
  Future<CityGameSession> build() async {
    ref.onDispose(_stopTicker);
    final now = _now();
    final saved = await ref.read(citySaveRepositoryProvider).load(cityId);
    final city = saved?.city ?? _newCity(now);
    final welcome = _welcomeFor(city, saved?.anchor, now);
    _anchor = _restartedAt(now, saved?.anchor);
    await _persist(city);
    _recordProgress(city, const []);
    return CityGameSession(city: city, welcome: welcome);
  }

  void tick() {
    if (!ref.mounted || _paused) {
      return;
    }
    _advanceTo(_now());
  }

  void _advanceTo(DateTime time) {
    final session = state.value;
    if (session == null || session.city.crisis.dismissed) {
      return;
    }
    final reading = ref.read(simulationClockProvider).read(_anchor, time);
    _anchor = reading.anchor;
    if (reading.ticks == 0) {
      return;
    }
    final (city, events) = _simulate(session.city, reading.ticks);
    state = AsyncData(session.copyWith(city: city, latestEvents: events));
    if (events.isNotEmpty || city.tick - _savedTick >= _saveEveryTicks) {
      unawaited(_persist(city));
    }
    if (events.isNotEmpty) {
      _recordProgress(city, events);
    }
  }

  void enterDashboard() {
    _onDashboard = true;
    _syncClock();
  }

  void leaveDashboard() {
    _onDashboard = false;
    _syncClock();
  }

  void appPaused() {
    _appActive = false;
    _syncClock();
  }

  void appResumed() {
    if (!_appActive) {
      _greet();
    }
    _appActive = true;
    _syncClock();
  }

  Future<void> collectWelcome({int multiplier = 1}) async {
    final session = state.value;
    final welcome = session?.welcome;
    if (session == null || welcome == null) {
      return;
    }
    state = AsyncData(session.copyWith(welcome: null));
    await perform((city) => const CityCommands().grantReward(city, welcome.earnings * multiplier));
  }

  void _greet() {
    final session = state.value;
    if (session == null || session.welcome != null) {
      return;
    }
    final welcome = _welcomeFor(session.city, _anchor, _now());
    if (welcome != null) {
      state = AsyncData(session.copyWith(welcome: welcome));
    }
  }

  WelcomeBack? _welcomeFor(CityState city, TimeAnchor? anchor, DateTime now) {
    if (anchor == null || city.crisis.dismissed) {
      return null;
    }
    final awaySeconds = (now.millisecondsSinceEpoch - anchor.syncedAtMs) ~/ 1000;
    final earnings = OfflineRules.earnings(
      incomePerSecond: const EconomyCalculator().netIncome(
        city,
        const MetricsCalculator().calculate(city),
      ),
      awaySeconds: awaySeconds,
    );
    return earnings > 0 ? WelcomeBack(awaySeconds: awaySeconds, earnings: earnings) : null;
  }

  void _syncClock() {
    if (!ref.mounted) {
      return;
    }
    final shouldRun = _onDashboard && _appActive;
    if (shouldRun && _paused) {
      _paused = false;
      _anchor = _restartedAt(_now(), _anchor);
      _startTicker();
    } else if (!shouldRun && !_paused) {
      final stoppedAt = _now();
      _paused = true;
      _stopTicker();
      scheduleMicrotask(() => _settle(stoppedAt));
    }
  }

  void _settle(DateTime stoppedAt) {
    if (!ref.mounted) {
      return;
    }
    _advanceTo(stoppedAt);
    final city = state.value?.city;
    if (city != null) {
      unawaited(_persist(city));
    }
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

  Future<CommandOutcome> revive(CityCommand command) {
    _anchor = TimeAnchor(syncedAtMs: _now().millisecondsSinceEpoch);
    return perform(command);
  }

  Future<void> restartCity() async {
    final now = _now();
    _anchor = TimeAnchor(syncedAtMs: now.millisecondsSinceEpoch);
    final city = _newCity(now);
    state = AsyncData(CityGameSession(city: city));
    await ref.read(inboxProvider.notifier).clear();
    await _persist(city);
    if (!_paused) {
      _startTicker();
    }
  }

  TimeAnchor _restartedAt(DateTime now, TimeAnchor? previous) =>
      TimeAnchor(syncedAtMs: now.millisecondsSinceEpoch, carriedMs: previous?.carriedMs ?? 0);

  void _recordProgress(CityState city, List<CityEvent> events) {
    unawaited(ref.read(profileProvider.notifier).applyCity(cityId, city, events));
    if (events.isNotEmpty) {
      unawaited(ref.read(inboxProvider.notifier).recordCity(cityId, events));
    }
    unawaited(ref.read(dailyProvider.notifier).track(events, city));
  }

  (CityState, List<CityEvent>) _simulate(CityState city, int ticks) {
    final simulator = ref.read(cityTickRunnerProvider);
    var current = city;
    final events = <CityEvent>[];
    for (var tick = 0; tick < ticks && !current.crisis.dismissed; tick++) {
      final result = simulator.advance(current);
      current = result.state;
      events.addAll(result.events);
    }
    return (current, events);
  }

  CityState _newCity(DateTime now) =>
      ref.read(bakuScenarioProvider).create(seed: now.millisecondsSinceEpoch & 0x7fffffff);

  Future<void> _persist(CityState city) {
    _savedTick = city.tick;
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
