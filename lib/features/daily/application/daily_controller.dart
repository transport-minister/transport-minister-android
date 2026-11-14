import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/daily/data/local_daily_repository.dart';
import 'package:transport_minister/features/daily/domain/daily_rules.dart';
import 'package:transport_minister/features/daily/domain/daily_state.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';

final dailyRepositoryProvider = Provider<DailyRepository>(
  (ref) => LocalDailyRepository(ref.watch(documentStoreProvider)),
);

final dailyProvider = AsyncNotifierProvider<DailyController, DailyState>(DailyController.new);

class DailyController extends AsyncNotifier<DailyState> {
  static const _rules = DailyRules();

  var _queue = Future<void>.value();

  DateTime get _today => ref.read(nowProvider)();

  @override
  Future<DailyState> build() async {
    final saved = await ref.read(dailyRepositoryProvider).load() ?? const DailyState();
    return _rules.refresh(saved, _today);
  }

  Future<void> track(List<CityEvent> events, CityState city) {
    final today = _today;
    return _update((state) => (_rules.track(_rules.refresh(state, today), events, city), null));
  }

  Future<Reward?> claimTask(CityId city, int index) {
    return _claim(city, (state) => _rules.claimTask(state, index));
  }

  Future<Reward?> claimStreak(CityId city) {
    final today = _today;
    return _claim(city, (state) => _rules.claimStreak(_rules.refresh(state, today), today));
  }

  Future<int?> claimVideoDiamonds() async {
    int? diamonds;
    final today = _today;
    await _update((state) {
      final (next, granted) = _rules.claimVideoDiamonds(state, today);
      diamonds = granted;
      return (next, null);
    });
    final granted = diamonds;
    if (granted != null && ref.mounted) {
      await ref.read(profileProvider.notifier).addDiamonds(granted);
    }
    return granted;
  }

  Future<Reward?> _claim(CityId city, (DailyState, Reward?) Function(DailyState) claim) async {
    Reward? reward;
    await _update((state) {
      final (next, granted) = claim(state);
      reward = granted;
      return (next, granted);
    });
    final granted = reward;
    if (granted != null && ref.mounted) {
      await ref
          .read(cityGameProvider(city).notifier)
          .perform((state) => const CityCommands().grantReward(state, granted.money));
      await ref.read(profileProvider.notifier).addXp(granted.xp);
      if (granted.diamonds > 0) {
        await ref.read(profileProvider.notifier).addDiamonds(granted.diamonds);
      }
    }
    return granted;
  }

  Future<void> _update((DailyState, Reward?) Function(DailyState state) change) {
    return _queue = _queue.then((_) async {
      if (!ref.mounted) {
        return;
      }
      final current = await future;
      if (!ref.mounted) {
        return;
      }
      final (next, _) = change(current);
      if (next == current) {
        return;
      }
      state = AsyncData(next);
      await ref.read(dailyRepositoryProvider).save(next);
    });
  }
}
