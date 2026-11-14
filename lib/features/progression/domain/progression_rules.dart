import 'dart:math' as math;

import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/core/simulation/decisions/diplomacy_actions.dart';
import 'package:transport_minister/core/simulation/model/city_event.dart';
import 'package:transport_minister/core/simulation/model/city_state.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/diamonds/domain/diamond_rules.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/career_stats.dart';
import 'package:transport_minister/features/progression/domain/city_badge.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/progression/domain/progression_event.dart';
import 'package:transport_minister/features/progression/domain/rank_ladder.dart';

class ProgressionUpdate {
  const ProgressionUpdate(this.profile, this.events);

  final MinisterProfile profile;
  final List<ProgressionEvent> events;
}

class ProgressionRules {
  const ProgressionRules();

  static const xpPerMinute = 4;
  static const xpPerBus = 10;
  static const xpPerUpgrade = 8;
  static const xpPerProject = 40;
  static const xpPerCityLevel = 50;
  static const reputationDrift = 0.1;
  static const warningPenalty = 5.0;
  static const dismissalPenalty = 20.0;
  static const levelUpBonus = 2.0;
  static const xpPerDecision = 15;
  static const xpPerDisaster = 25;
  static const xpPerTechnology = 30;
  static const xpPerMetroLine = 60;
  static const xpPerCityCompletion = 500;

  ProgressionUpdate apply(
    MinisterProfile profile, {
    required CityId city,
    required CityState state,
    required List<CityEvent> events,
  }) {
    final career = _career(profile.career, events);
    var xp = profile.xp + _xp(events);
    final reputation = _reputation(profile.reputation, events);
    final bestLevel = math.max(profile.bestLevelIn(city), state.level);
    var next = profile.copyWith(
      career: career,
      reputation: reputation,
      bestCityLevels: {...profile.bestCityLevels, city: bestLevel},
      completedCities: {...profile.completedCities, if (state.completed) city},
    );
    final progression = <ProgressionEvent>[];

    final unlocked = [
      for (final achievement in AchievementId.values)
        if (!profile.achievements.contains(achievement) &&
            _earned(achievement, next, state, events))
          achievement,
    ];
    for (final achievement in unlocked) {
      xp += achievement.xp;
      progression.add(AchievementUnlocked(achievement));
    }

    final oldTier = BadgeTier.forLevel(profile.bestLevelIn(city));
    final newTier = BadgeTier.forLevel(bestLevel);
    if (newTier != null && newTier != oldTier) {
      progression.add(BadgeEarned(city, newTier));
    }

    final rank = RankLadder.earned(current: profile.rank, xp: xp, reputation: reputation);
    if (rank != profile.rank) {
      progression.add(RankPromoted(rank));
    }
    next = next.copyWith(
      xp: xp,
      rank: rank,
      achievements: {...profile.achievements, ...unlocked},
      diamonds:
          profile.diamonds +
          DiamondRules.forCityEvents(events) +
          unlocked.length * DiamondRules.perAchievement,
    );
    return ProgressionUpdate(next, progression);
  }

  CareerStats _career(CareerStats career, List<CityEvent> events) {
    var next = career;
    for (final event in events) {
      next = switch (event) {
        MinutePassed() => next.copyWith(minutesServed: next.minutesServed + 1),
        BusPurchased(:final model, :final count) => next.copyWith(
          busesBought: next.busesBought + count,
          electricBusesBought: next.electricBusesBought + (model.spec.electric ? count : 0),
        ),
        BusUpgraded() => next.copyWith(busUpgrades: next.busUpgrades + 1),
        ProjectCompleted(:final type) => next.copyWith(
          projectsCompleted: next.projectsCompleted + 1,
          roadRepairs: next.roadRepairs + (type == ProjectType.roadRepair ? 1 : 0),
        ),
        CrisisAverted() => next.copyWith(crisesAverted: next.crisesAverted + 1),
        MinisterDismissed() => next.copyWith(dismissals: next.dismissals + 1),
        DecisionResolved(:final decision, automatic: false) => next.copyWith(
          decisionsMade: next.decisionsMade + 1,
          disastersHandled:
              next.disastersHandled + (decision.kind == DecisionKind.disaster ? 1 : 0),
        ),
        _ => next,
      };
    }
    return next;
  }

  int _xp(List<CityEvent> events) {
    var xp = 0;
    for (final event in events) {
      xp += switch (event) {
        MinutePassed() => xpPerMinute,
        BusPurchased(:final count) => xpPerBus * count,
        BusUpgraded() => xpPerUpgrade,
        ProjectCompleted() => xpPerProject,
        CityLeveledUp(:final level) => xpPerCityLevel * level,
        DecisionResolved(:final decision, automatic: false) =>
          decision.kind == DecisionKind.disaster ? xpPerDisaster : xpPerDecision,
        TechnologyUnlocked() => xpPerTechnology,
        DiplomacyActionTaken(:final action) => action.spec.xp,
        MetroLineOpened() => xpPerMetroLine,
        CityCompleted() => xpPerCityCompletion,
        _ => 0,
      };
    }
    return xp;
  }

  double _reputation(double reputation, List<CityEvent> events) {
    var value = reputation;
    for (final event in events) {
      value = switch (event) {
        MinutePassed(:final satisfaction) => value + (satisfaction - value) * reputationDrift,
        CrisisWarning() => value - warningPenalty,
        MinisterDismissed() => value - dismissalPenalty,
        CityLeveledUp() => value + levelUpBonus,
        ReputationShift(:final delta) => value + delta,
        _ => value,
      };
    }
    return value.clamp(0, 100).toDouble();
  }

  bool _earned(
    AchievementId achievement,
    MinisterProfile profile,
    CityState city,
    List<CityEvent> events,
  ) {
    final career = profile.career;
    return switch (achievement) {
      AchievementId.firstBus => career.busesBought >= 1,
      AchievementId.fleetBuilder => city.fleet.length >= 40,
      AchievementId.modernCity =>
        city.fleet.length >= 20 && city.fleet.every((bus) => bus.model != BusModelId.veteran),
      AchievementId.greenRevolution => career.electricBusesBought >= 1,
      AchievementId.upgradeEnthusiast => career.busUpgrades >= 10,
      AchievementId.roadWarrior => career.roadRepairs >= 10,
      AchievementId.bikeFriendly => city.districts.where((d) => d.hasBikeLanes).length >= 3,
      AchievementId.infrastructureMaster => career.projectsCompleted >= 50,
      AchievementId.economicStrategist => city.stats.bestPositiveBudgetStreak >= 900,
      AchievementId.smilingCity => city.overallSatisfaction >= 60,
      AchievementId.happyCitizens => city.overallSatisfaction >= 90,
      AchievementId.risingCity => city.level >= 5,
      AchievementId.cityChampion => city.completed,
      AchievementId.survivor => career.crisesAverted >= 1,
      AchievementId.decisive => career.decisionsMade >= 25,
      AchievementId.stormChaser => career.disastersHandled >= 5,
      AchievementId.innovator => city.technologies.length >= 5,
      AchievementId.metroPioneer => city.metroLines.any((line) => line.isOpen),
      AchievementId.veteranMinister => career.minutesServed >= 180,
    };
  }
}
