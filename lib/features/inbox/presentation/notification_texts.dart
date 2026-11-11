import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/formatting/money_format.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/core/simulation/decisions/decision_id.dart';
import 'package:transport_minister/features/city_game/presentation/district_presentation.dart';
import 'package:transport_minister/features/city_game/presentation/simulation_texts.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/city_selection/presentation/city_presentation.dart';
import 'package:transport_minister/features/decisions/presentation/decision_texts.dart';
import 'package:transport_minister/features/inbox/domain/inbox.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/city_badge.dart';
import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/features/progression/presentation/ministerial_rank_text.dart';
import 'package:transport_minister/features/progression/presentation/progression_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension NotificationTexts on GameNotification {
  String message(AppLocalizations l10n) {
    final district = _byName(DistrictId.values, data['district']);
    return switch (kind) {
      NotificationKind.decision ||
      NotificationKind.disaster => l10n.eventDecisionArrived(_decision.title(l10n, district)),
      NotificationKind.autoDecision => l10n.eventDecisionAutomatic(_decision.title(l10n, null)),
      NotificationKind.project =>
        district == null
            ? l10n.eventProjectCompleted(_project.label(l10n))
            : l10n.notificationProjectIn(_project.label(l10n), district.displayName(l10n)),
      NotificationKind.buses => l10n.eventBusesDelivered(_int('count')),
      NotificationKind.budget => l10n.eventBudgetAllocated(MoneyFormat.compact(_int('amount'))),
      NotificationKind.levelUp => l10n.notificationLevelUp(
        _city.displayName(l10n),
        _int('level'),
        MoneyFormat.compact(_int('reward')),
      ),
      NotificationKind.promotion => l10n.notificationPromotion(
        _byName(MinisterialRank.values, data['rank'])!.title(l10n),
      ),
      NotificationKind.achievement => () {
        final achievement = _byName(AchievementId.values, data['achievement'])!;
        return l10n.achievementToast(achievement.title(l10n), achievement.xp);
      }(),
      NotificationKind.badge => l10n.badgeEarnedToast(
        _byName(BadgeTier.values, data['tier'])!.label(l10n),
        _city.displayName(l10n),
      ),
      NotificationKind.warning => l10n.eventCrisisWarning(_int('level')),
      NotificationKind.averted => l10n.eventCrisisAverted,
      NotificationKind.dismissed => l10n.dismissedTitle,
    };
  }

  IconData get icon => switch (kind) {
    NotificationKind.decision || NotificationKind.autoDecision => Icons.campaign_rounded,
    NotificationKind.disaster => Icons.warning_rounded,
    NotificationKind.project => Icons.construction_rounded,
    NotificationKind.buses => Icons.directions_bus_rounded,
    NotificationKind.budget => Icons.account_balance_rounded,
    NotificationKind.levelUp => Icons.flag_rounded,
    NotificationKind.promotion => Icons.military_tech_rounded,
    NotificationKind.achievement => Icons.emoji_events_rounded,
    NotificationKind.badge => Icons.workspace_premium_rounded,
    NotificationKind.warning => Icons.gavel_rounded,
    NotificationKind.averted => Icons.shield_rounded,
    NotificationKind.dismissed => Icons.sentiment_very_dissatisfied_rounded,
  };

  ChunkyPalette get palette => switch (kind) {
    NotificationKind.disaster ||
    NotificationKind.warning ||
    NotificationKind.dismissed => ChunkyPalette.coral,
    NotificationKind.decision || NotificationKind.autoDecision => ChunkyPalette.sunny,
    NotificationKind.project => ChunkyPalette.tangerine,
    NotificationKind.buses => ChunkyPalette.ocean,
    NotificationKind.budget || NotificationKind.averted => ChunkyPalette.green,
    NotificationKind.levelUp || NotificationKind.promotion => ChunkyPalette.grape,
    NotificationKind.achievement || NotificationKind.badge => ChunkyPalette.bubblegum,
  };

  DecisionId get _decision => _byName(DecisionId.values, data['decision'])!;

  ProjectType get _project => _byName(ProjectType.values, data['project'])!;

  CityId get _city => _byName(CityId.values, data['city']) ?? CityId.baku;

  int _int(String key) => int.tryParse(data[key] ?? '') ?? 0;

  static T? _byName<T extends Enum>(List<T> values, String? name) =>
      name == null ? null : values.asNameMap()[name];
}

String timeAgo(AppLocalizations l10n, DateTime now, int createdAtMs) {
  final elapsed = now.difference(DateTime.fromMillisecondsSinceEpoch(createdAtMs));
  if (elapsed.inMinutes < 1) {
    return l10n.timeJustNow;
  }
  if (elapsed.inHours < 1) {
    return l10n.timeMinutesAgo(elapsed.inMinutes);
  }
  if (elapsed.inDays < 1) {
    return l10n.timeHoursAgo(elapsed.inHours);
  }
  return l10n.timeDaysAgo(elapsed.inDays);
}
