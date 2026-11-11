import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/city_badge.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/domain/progression_event.dart';
import 'package:transport_minister/features/progression/domain/progression_rules.dart';

import '../../core/simulation/simulation_test_kit.dart';

void main() {
  const rules = ProgressionRules();
  final city = newBaku();

  ProgressionUpdate apply(MinisterProfile profile, List<CityEvent> events, {int points = 0}) {
    return rules.apply(
      profile,
      city: CityId.baku,
      state: city.copyWith(developmentPoints: points),
      events: events,
    );
  }

  test('actions earn XP and the first bus unlocks an achievement', () {
    final update = apply(const MinisterProfile(), const [
      DayClosed(1, 40),
      BusPurchased(BusModelId.cityRunner, DistrictId.windHeights),
    ]);

    expect(update.profile.xp, 2 + 10 + AchievementId.firstBus.xp);
    expect(update.profile.career.busesBought, 1);
    expect(
      update.events.whereType<AchievementUnlocked>().single.achievement,
      AchievementId.firstBus,
    );
  });

  test('promotion needs both XP and reputation', () {
    const ready = MinisterProfile(xp: 295, reputation: 45);
    const unpopular = MinisterProfile(xp: 5000, reputation: 30);

    final promoted = apply(ready, const [DayClosed(1, 45), DayClosed(2, 45), DayClosed(3, 45)]);
    final stuck = apply(unpopular, const [DayClosed(1, 30)]);

    expect(promoted.profile.rank, MinisterialRank.inspector);
    expect(promoted.events.whereType<RankPromoted>().single.rank, MinisterialRank.inspector);
    expect(stuck.profile.rank, MinisterialRank.juniorOfficial);
  });

  test('ranks are never taken away', () {
    final update = apply(
      const MinisterProfile(rank: MinisterialRank.director, reputation: 10),
      const [MinisterDismissed()],
    );

    expect(update.profile.rank, MinisterialRank.director);
    expect(update.profile.career.dismissals, 1);
  });

  test('reputation follows satisfaction and drops on warnings', () {
    final calm = apply(const MinisterProfile(), const [DayClosed(1, 70)]);
    final warned = apply(const MinisterProfile(), const [CrisisWarning(1)]);

    expect(calm.profile.reputation, closeTo(51, 0.001));
    expect(warned.profile.reputation, 45);
  });

  test('city badges come with city levels', () {
    final update = apply(const MinisterProfile(), const [], points: 110);

    expect(update.profile.bestLevelIn(CityId.baku), 3);
    expect(update.events.whereType<BadgeEarned>().single.tier, BadgeTier.bronze);
  });

  test('averting a crisis unlocks Survivor', () {
    final update = apply(const MinisterProfile(), const [CrisisAverted()]);

    expect(update.profile.achievements, contains(AchievementId.survivor));
  });

  test('decisions earn XP and shift reputation', () {
    final update = apply(const MinisterProfile(), const [
      DecisionResolved(DecisionId.flood, riskTriggered: false, automatic: false),
      DecisionResolved(DecisionId.festival, riskTriggered: false, automatic: true),
      ReputationShift(4),
    ]);

    expect(update.profile.xp, ProgressionRules.xpPerDisaster);
    expect(update.profile.career.decisionsMade, 1);
    expect(update.profile.career.disastersHandled, 1);
    expect(update.profile.reputation, 54);
  });
}
