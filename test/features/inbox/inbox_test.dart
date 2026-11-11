import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/inbox/application/inbox_controller.dart';
import 'package:transport_minister/features/inbox/data/local_inbox_repository.dart';
import 'package:transport_minister/features/inbox/domain/inbox.dart';
import 'package:transport_minister/features/inbox/domain/inbox_rules.dart';
import 'package:transport_minister/features/inbox/presentation/inbox_screen.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/progression_event.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  const rules = InboxRules();
  final now = DateTime(2026, 11, 11, 9);

  test('important city news lands in the inbox, routine days do not', () {
    final inbox = rules.addCityEvents(const Inbox(), CityId.baku, const [
      DayClosed(4, 40),
      DecisionArrived(DecisionId.flood, DistrictId.oilHarbor),
      ProjectCompleted(ProjectType.roadRepair, DistrictId.windHeights),
      BudgetAllocated(450000),
    ], now);

    expect(inbox.items.map((item) => item.kind), [
      NotificationKind.budget,
      NotificationKind.project,
      NotificationKind.disaster,
    ]);
    expect(inbox.unread, 3);
    expect(rules.markAllRead(inbox).unread, 0);
  });

  test('the inbox keeps only the latest notifications', () {
    var inbox = const Inbox();
    for (var index = 0; index < InboxRules.capacity + 10; index++) {
      inbox = rules.addCityEvents(inbox, CityId.baku, const [BusesDelivered(1)], now);
    }

    expect(inbox.items, hasLength(InboxRules.capacity));
    expect(inbox.items.first.id, InboxRules.capacity + 10);
  });

  test('progress news is saved by the controller', () async {
    final store = InMemoryDocumentStore();
    final container = ProviderContainer(
      overrides: [
        documentStoreProvider.overrideWithValue(store),
        nowProvider.overrideWithValue(() => now),
      ],
    );
    addTearDown(container.dispose);

    await container.read(inboxProvider.future);
    await container.read(inboxProvider.notifier).recordProgress(const [
      AchievementUnlocked(AchievementId.firstBus),
    ]);

    final saved = await LocalInboxRepository(store).load();
    expect(saved?.items.single.kind, NotificationKind.achievement);
  });

  testWidgets('opening the inbox shows the news and marks it read', (tester) async {
    final store = InMemoryDocumentStore();
    await LocalInboxRepository(store)
        .save(rules.addCityEvents(const Inbox(), CityId.baku, const [BusesDelivered(3)], now));

    await pumpGameScreen(
      tester,
      const InboxScreen(),
      store: store,
      now: FakeNow(now.add(const Duration(minutes: 5))),
    );

    expect(find.text('3 new buses joined the fleet'), findsOneWidget);
    expect(find.text('5 min ago'), findsOneWidget);
    expect((await LocalInboxRepository(store).load())?.unread, 0);
  });
}
