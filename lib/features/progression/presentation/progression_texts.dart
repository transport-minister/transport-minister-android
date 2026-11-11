import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/features/progression/domain/achievement.dart';
import 'package:transport_minister/features/progression/domain/city_badge.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension AchievementPresentation on AchievementId {
  String title(AppLocalizations l10n) => switch (this) {
    AchievementId.firstBus => l10n.achievementFirstBusTitle,
    AchievementId.fleetBuilder => l10n.achievementFleetBuilderTitle,
    AchievementId.modernCity => l10n.achievementModernCityTitle,
    AchievementId.greenRevolution => l10n.achievementGreenRevolutionTitle,
    AchievementId.upgradeEnthusiast => l10n.achievementUpgradeEnthusiastTitle,
    AchievementId.roadWarrior => l10n.achievementRoadWarriorTitle,
    AchievementId.bikeFriendly => l10n.achievementBikeFriendlyTitle,
    AchievementId.infrastructureMaster => l10n.achievementInfrastructureMasterTitle,
    AchievementId.economicStrategist => l10n.achievementEconomicStrategistTitle,
    AchievementId.smilingCity => l10n.achievementSmilingCityTitle,
    AchievementId.happyCitizens => l10n.achievementHappyCitizensTitle,
    AchievementId.risingCity => l10n.achievementRisingCityTitle,
    AchievementId.cityChampion => l10n.achievementCityChampionTitle,
    AchievementId.survivor => l10n.achievementSurvivorTitle,
    AchievementId.decisive => l10n.achievementDecisiveTitle,
    AchievementId.stormChaser => l10n.achievementStormChaserTitle,
    AchievementId.veteranMinister => l10n.achievementVeteranMinisterTitle,
  };

  String description(AppLocalizations l10n) => switch (this) {
    AchievementId.firstBus => l10n.achievementFirstBusDescription,
    AchievementId.fleetBuilder => l10n.achievementFleetBuilderDescription,
    AchievementId.modernCity => l10n.achievementModernCityDescription,
    AchievementId.greenRevolution => l10n.achievementGreenRevolutionDescription,
    AchievementId.upgradeEnthusiast => l10n.achievementUpgradeEnthusiastDescription,
    AchievementId.roadWarrior => l10n.achievementRoadWarriorDescription,
    AchievementId.bikeFriendly => l10n.achievementBikeFriendlyDescription,
    AchievementId.infrastructureMaster => l10n.achievementInfrastructureMasterDescription,
    AchievementId.economicStrategist => l10n.achievementEconomicStrategistDescription,
    AchievementId.smilingCity => l10n.achievementSmilingCityDescription,
    AchievementId.happyCitizens => l10n.achievementHappyCitizensDescription,
    AchievementId.risingCity => l10n.achievementRisingCityDescription,
    AchievementId.cityChampion => l10n.achievementCityChampionDescription,
    AchievementId.survivor => l10n.achievementSurvivorDescription,
    AchievementId.decisive => l10n.achievementDecisiveDescription,
    AchievementId.stormChaser => l10n.achievementStormChaserDescription,
    AchievementId.veteranMinister => l10n.achievementVeteranMinisterDescription,
  };

  IconData get icon => switch (this) {
    AchievementId.firstBus => Icons.directions_bus_rounded,
    AchievementId.fleetBuilder => Icons.garage_rounded,
    AchievementId.modernCity => Icons.auto_awesome_rounded,
    AchievementId.greenRevolution => Icons.electric_bolt_rounded,
    AchievementId.upgradeEnthusiast => Icons.upgrade_rounded,
    AchievementId.roadWarrior => Icons.construction_rounded,
    AchievementId.bikeFriendly => Icons.pedal_bike_rounded,
    AchievementId.infrastructureMaster => Icons.engineering_rounded,
    AchievementId.economicStrategist => Icons.savings_rounded,
    AchievementId.smilingCity => Icons.sentiment_satisfied_rounded,
    AchievementId.happyCitizens => Icons.favorite_rounded,
    AchievementId.risingCity => Icons.trending_up_rounded,
    AchievementId.cityChampion => Icons.emoji_events_rounded,
    AchievementId.survivor => Icons.shield_rounded,
    AchievementId.decisive => Icons.how_to_vote_rounded,
    AchievementId.stormChaser => Icons.thunderstorm_rounded,
    AchievementId.veteranMinister => Icons.military_tech_rounded,
  };

  ChunkyPalette get palette => switch (index % 5) {
    0 => ChunkyPalette.sunny,
    1 => ChunkyPalette.ocean,
    2 => ChunkyPalette.lagoon,
    3 => ChunkyPalette.grape,
    _ => ChunkyPalette.bubblegum,
  };
}

extension BadgeTierPresentation on BadgeTier {
  String label(AppLocalizations l10n) => switch (this) {
    BadgeTier.bronze => l10n.badgeBronze,
    BadgeTier.silver => l10n.badgeSilver,
    BadgeTier.gold => l10n.badgeGold,
  };

  Color get color => switch (this) {
    BadgeTier.bronze => const Color(0xFFE59A5C),
    BadgeTier.silver => const Color(0xFFD5DCE6),
    BadgeTier.gold => const Color(0xFFFFD84D),
  };
}
