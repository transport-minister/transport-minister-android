import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/simulation/catalog/technology_catalog.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension TechnologyTexts on TechnologyId {
  String label(AppLocalizations l10n) => switch (this) {
    TechnologyId.minibusContract => l10n.techMinibusContractName,
    TechnologyId.articulatedContract => l10n.techArticulatedContractName,
    TechnologyId.electricContract => l10n.techElectricContractName,
    TechnologyId.engineTuning => l10n.techEngineTuningName,
    TechnologyId.biggerCabins => l10n.techBiggerCabinsName,
    TechnologyId.comfortKit => l10n.techComfortKitName,
    TechnologyId.smartBuses => l10n.techSmartBusesName,
    TechnologyId.metroStudy => l10n.techMetroStudyName,
    TechnologyId.metroContract => l10n.techMetroContractName,
    TechnologyId.metroAutomation => l10n.techMetroAutomationName,
    TechnologyId.smartTicketing => l10n.techSmartTicketingName,
    TechnologyId.ecoDriving => l10n.techEcoDrivingName,
    TechnologyId.depotRobotics => l10n.techDepotRoboticsName,
  };

  String description(AppLocalizations l10n) => switch (this) {
    TechnologyId.minibusContract => l10n.techMinibusContractDescription,
    TechnologyId.articulatedContract => l10n.techArticulatedContractDescription,
    TechnologyId.electricContract => l10n.techElectricContractDescription,
    TechnologyId.engineTuning => l10n.techEngineTuningDescription,
    TechnologyId.biggerCabins => l10n.techBiggerCabinsDescription,
    TechnologyId.comfortKit => l10n.techComfortKitDescription,
    TechnologyId.smartBuses => l10n.techSmartBusesDescription,
    TechnologyId.metroStudy => l10n.techMetroStudyDescription,
    TechnologyId.metroContract => l10n.techMetroContractDescription,
    TechnologyId.metroAutomation => l10n.techMetroAutomationDescription,
    TechnologyId.smartTicketing => l10n.techSmartTicketingDescription,
    TechnologyId.ecoDriving => l10n.techEcoDrivingDescription,
    TechnologyId.depotRobotics => l10n.techDepotRoboticsDescription,
  };

  IconData get icon => switch (this) {
    TechnologyId.minibusContract => Icons.airport_shuttle_rounded,
    TechnologyId.articulatedContract => Icons.directions_bus_filled_rounded,
    TechnologyId.electricContract => Icons.electric_bolt_rounded,
    TechnologyId.engineTuning => Icons.build_rounded,
    TechnologyId.biggerCabins => Icons.groups_rounded,
    TechnologyId.comfortKit => Icons.weekend_rounded,
    TechnologyId.smartBuses => Icons.memory_rounded,
    TechnologyId.metroStudy => Icons.travel_explore_rounded,
    TechnologyId.metroContract => Icons.subway_rounded,
    TechnologyId.metroAutomation => Icons.smart_toy_rounded,
    TechnologyId.smartTicketing => Icons.qr_code_2_rounded,
    TechnologyId.ecoDriving => Icons.eco_rounded,
    TechnologyId.depotRobotics => Icons.precision_manufacturing_rounded,
  };
}

extension TechBranchTexts on TechBranch {
  String label(AppLocalizations l10n) => switch (this) {
    TechBranch.buses => l10n.branchBuses,
    TechBranch.upgrades => l10n.branchUpgrades,
    TechBranch.metro => l10n.branchMetro,
    TechBranch.operations => l10n.branchOperations,
  };

  ChunkyPalette get palette => switch (this) {
    TechBranch.buses => ChunkyPalette.ocean,
    TechBranch.upgrades => ChunkyPalette.sunny,
    TechBranch.metro => ChunkyPalette.grape,
    TechBranch.operations => ChunkyPalette.lagoon,
  };
}
