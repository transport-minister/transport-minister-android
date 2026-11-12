import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/inbox/domain/inbox.dart';
import 'package:transport_minister/features/progression/domain/progression_event.dart';

class InboxRules {
  const InboxRules();

  static const capacity = 60;

  Inbox addCityEvents(Inbox inbox, CityId city, List<CityEvent> events, DateTime now) {
    final entries = <(NotificationKind, Map<String, String>)>[
      for (final event in events)
        ?switch (event) {
          DecisionArrived(:final decision, :final district)
              when decision.kind == DecisionKind.disaster =>
            (NotificationKind.disaster, {'decision': decision.name, 'district': ?district?.name}),
          CityLeveledUp(:final level, :final reward) => (
            NotificationKind.levelUp,
            {'city': city.name, 'level': '$level', 'reward': '$reward'},
          ),
          CrisisWarning(:final level) => (NotificationKind.warning, {'level': '$level'}),
          CrisisAverted() => (NotificationKind.averted, const <String, String>{}),
          MinisterDismissed() => (NotificationKind.dismissed, const <String, String>{}),
          MetroLineOpened(:final from, :final to) => (
            NotificationKind.metro,
            {'from': from.name, 'to': to.name},
          ),
          CityCompleted() => (NotificationKind.cityComplete, {'city': city.name}),
          _ => null,
        },
    ];
    return _append(inbox, entries, now);
  }

  Inbox addProgress(Inbox inbox, List<ProgressionEvent> events, DateTime now) {
    final entries = <(NotificationKind, Map<String, String>)>[
      for (final event in events)
        switch (event) {
          RankPromoted(:final rank) => (NotificationKind.promotion, {'rank': rank.name}),
          AchievementUnlocked(:final achievement) => (
            NotificationKind.achievement,
            {'achievement': achievement.name},
          ),
          BadgeEarned(:final city, :final tier) => (
            NotificationKind.badge,
            {'city': city.name, 'tier': tier.name},
          ),
        },
    ];
    return _append(inbox, entries, now);
  }

  Inbox clear(Inbox inbox) => inbox.copyWith(items: const []);

  Inbox markAllRead(Inbox inbox) =>
      inbox.copyWith(items: [for (final item in inbox.items) item.copyWith(read: true)]);

  Inbox _append(Inbox inbox, List<(NotificationKind, Map<String, String>)> entries, DateTime now) {
    if (entries.isEmpty) {
      return inbox;
    }
    var nextId = inbox.nextId;
    final fresh = [
      for (final (kind, data) in entries)
        GameNotification(
          id: nextId++,
          kind: kind,
          data: data,
          createdAtMs: now.millisecondsSinceEpoch,
        ),
    ];
    final items = [...fresh.reversed, ...inbox.items];
    return inbox.copyWith(
      items: items.length > capacity ? items.sublist(0, capacity) : items,
      nextId: nextId,
    );
  }
}
