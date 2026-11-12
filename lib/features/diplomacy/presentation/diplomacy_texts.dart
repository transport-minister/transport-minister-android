import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/design_system.dart';
import 'package:transport_minister/core/simulation/decisions/diplomacy_actions.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

abstract final class DiplomacyStyle {
  static const icon = Icons.handshake_rounded;
  static const palette = ChunkyPalette.lagoon;
}

extension DiplomacyActionText on DiplomacyActionId {
  String title(AppLocalizations l10n) => switch (this) {
    DiplomacyActionId.cheaperTickets => l10n.actionCheaperTickets,
    DiplomacyActionId.hackathon => l10n.actionHackathon,
    DiplomacyActionId.driverRaise => l10n.actionDriverRaise,
    DiplomacyActionId.shopTaxBreak => l10n.actionShopTaxBreak,
    DiplomacyActionId.cleanAir => l10n.actionCleanAir,
    DiplomacyActionId.cityFestival => l10n.actionCityFestival,
  };

  String body(AppLocalizations l10n) => switch (this) {
    DiplomacyActionId.cheaperTickets => l10n.actionCheaperTicketsBody,
    DiplomacyActionId.hackathon => l10n.actionHackathonBody,
    DiplomacyActionId.driverRaise => l10n.actionDriverRaiseBody,
    DiplomacyActionId.shopTaxBreak => l10n.actionShopTaxBreakBody,
    DiplomacyActionId.cleanAir => l10n.actionCleanAirBody,
    DiplomacyActionId.cityFestival => l10n.actionCityFestivalBody,
  };

  IconData get icon => switch (this) {
    DiplomacyActionId.cheaperTickets => Icons.confirmation_number_rounded,
    DiplomacyActionId.hackathon => Icons.computer_rounded,
    DiplomacyActionId.driverRaise => Icons.payments_rounded,
    DiplomacyActionId.shopTaxBreak => Icons.storefront_rounded,
    DiplomacyActionId.cleanAir => Icons.eco_rounded,
    DiplomacyActionId.cityFestival => Icons.celebration_rounded,
  };

  ChunkyPalette get palette => switch (this) {
    DiplomacyActionId.cheaperTickets => ChunkyPalette.ocean,
    DiplomacyActionId.hackathon => ChunkyPalette.grape,
    DiplomacyActionId.driverRaise => ChunkyPalette.sunny,
    DiplomacyActionId.shopTaxBreak => ChunkyPalette.tangerine,
    DiplomacyActionId.cleanAir => ChunkyPalette.green,
    DiplomacyActionId.cityFestival => ChunkyPalette.coral,
  };
}
