import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';
import 'package:transport_minister/features/inbox/application/inbox_controller.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/progression/domain/profile_repository.dart';
import 'package:transport_minister/features/progression/domain/progression_event.dart';
import 'package:transport_minister/features/progression/domain/progression_rules.dart';
import 'package:transport_minister/features/progression/domain/rank_ladder.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => LocalProfileRepository(ref.watch(documentStoreProvider)),
);

final profileProvider = AsyncNotifierProvider<ProfileController, MinisterProfile>(
  ProfileController.new,
);

final progressionFeedProvider = NotifierProvider<ProgressionFeed, List<ProgressionEvent>>(
  ProgressionFeed.new,
);

class ProgressionFeed extends Notifier<List<ProgressionEvent>> {
  @override
  List<ProgressionEvent> build() => const [];

  void publish(List<ProgressionEvent> events) => state = List.unmodifiable(events);
}

class ProfileController extends AsyncNotifier<MinisterProfile> {
  var _queue = Future<void>.value();

  @override
  Future<MinisterProfile> build() async =>
      await ref.read(profileRepositoryProvider).load() ?? const MinisterProfile();

  Future<void> completeTutorial() => _change(
    (profile) => profile.tutorialDone
        ? profile
        : profile.copyWith(
            tutorialDone: true,
            diamonds: profile.diamonds + DiamondRules.welcomeGift,
          ),
  );

  Future<void> addDiamonds(int amount) =>
      _change((profile) => profile.copyWith(diamonds: profile.diamonds + amount));

  Future<bool> spendDiamonds(int amount) async {
    var spent = false;
    await _change((profile) {
      if (profile.diamonds < amount) {
        return profile;
      }
      spent = true;
      return profile.copyWith(diamonds: profile.diamonds - amount);
    });
    return spent;
  }

  Future<void> _change(MinisterProfile Function(MinisterProfile profile) change) {
    return _queue = _queue.then((_) async {
      if (!ref.mounted) {
        return;
      }
      final profile = await future;
      if (!ref.mounted) {
        return;
      }
      final next = change(profile);
      if (next == profile) {
        return;
      }
      state = AsyncData(next);
      await ref.read(profileRepositoryProvider).save(next);
    });
  }

  Future<void> addXp(int xp) {
    return _queue = _queue.then((_) async {
      if (!ref.mounted) {
        return;
      }
      final profile = await future;
      if (!ref.mounted) {
        return;
      }
      final next = profile.copyWith(xp: profile.xp + xp);
      final rank = RankLadder.earned(current: next.rank, xp: next.xp, reputation: next.reputation);
      final promoted = next.copyWith(rank: rank);
      state = AsyncData(promoted);
      await ref.read(profileRepositoryProvider).save(promoted);
      if (rank != profile.rank && ref.mounted) {
        final events = [RankPromoted(rank)];
        ref.read(progressionFeedProvider.notifier).publish(events);
        await ref.read(inboxProvider.notifier).recordProgress(events);
      }
    });
  }

  Future<void> applyCity(CityId city, CityState state, List<CityEvent> events) {
    return _queue = _queue.then((_) => _apply(city, state, events));
  }

  Future<void> _apply(CityId city, CityState state, List<CityEvent> events) async {
    if (!ref.mounted) {
      return;
    }
    final profile = await future;
    final update = const ProgressionRules().apply(
      profile,
      city: city,
      state: state,
      events: events,
    );
    if (update.profile == profile || !ref.mounted) {
      return;
    }
    this.state = AsyncData(update.profile);
    await ref.read(profileRepositoryProvider).save(update.profile);
    if (update.events.isNotEmpty && ref.mounted) {
      ref.read(progressionFeedProvider.notifier).publish(update.events);
      await ref.read(inboxProvider.notifier).recordProgress(update.events);
    }
  }
}
