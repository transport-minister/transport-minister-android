import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/presentation/profile_screen.dart';

import '../../helpers/fake_now.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  testWidgets('the profile shows rank, reputation and achievements', (tester) async {
    final store = InMemoryDocumentStore();
    await LocalProfileRepository(store).save(
      const MinisterProfile(
        xp: 450,
        reputation: 62,
        rank: MinisterialRank.inspector,
        achievements: {AchievementId.firstBus},
      ),
    );

    await pumpGameScreen(
      tester,
      const ProfileScreen(),
      store: store,
      now: FakeNow(DateTime(2026, 11, 11)),
    );

    expect(find.text('Transport Inspector'), findsWidgets);
    expect(find.text('62%'), findsOneWidget);
    expect(find.text('450 / 900 XP'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Achievements 1/17'),
      300,
      scrollable: find.byType(Scrollable).first,
    );

    expect(find.text('Achievements 1/17'), findsOneWidget);
  });
}
