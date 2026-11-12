import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/inbox/data/local_inbox_repository.dart';
import 'package:transport_minister/features/inbox/domain/inbox.dart';
import 'package:transport_minister/features/inbox/domain/inbox_rules.dart';
import 'package:transport_minister/features/progression/domain/progression_event.dart';

final inboxRepositoryProvider = Provider<InboxRepository>(
  (ref) => LocalInboxRepository(ref.watch(documentStoreProvider)),
);

final inboxProvider = AsyncNotifierProvider<InboxController, Inbox>(InboxController.new);

class InboxController extends AsyncNotifier<Inbox> {
  static const _rules = InboxRules();

  var _queue = Future<void>.value();

  @override
  Future<Inbox> build() async => await ref.read(inboxRepositoryProvider).load() ?? const Inbox();

  Future<void> recordCity(CityId city, List<CityEvent> events) =>
      _update((inbox) => _rules.addCityEvents(inbox, city, events, ref.read(nowProvider)()));

  Future<void> recordProgress(List<ProgressionEvent> events) =>
      _update((inbox) => _rules.addProgress(inbox, events, ref.read(nowProvider)()));

  Future<void> markAllRead() => _update(_rules.markAllRead);

  Future<void> clear() => _update(_rules.clear);

  Future<void> _update(Inbox Function(Inbox inbox) change) {
    return _queue = _queue.then((_) async {
      if (!ref.mounted) {
        return;
      }
      final inbox = await future;
      if (!ref.mounted) {
        return;
      }
      final next = change(inbox);
      if (next == inbox || !ref.mounted) {
        return;
      }
      state = AsyncData(next);
      await ref.read(inboxRepositoryProvider).save(next);
    });
  }
}
