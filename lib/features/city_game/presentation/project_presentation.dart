import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/simulation/catalog/project_catalog.dart';
import 'package:transport_minister/features/decisions/presentation/effect_chips.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension ProjectPresentation on ProjectType {
  IconData get icon => switch (this) {
    ProjectType.roadRepair => Icons.construction_rounded,
    ProjectType.roadExpansion => Icons.add_road_rounded,
    ProjectType.bikeLanes => Icons.pedal_bike_rounded,
    ProjectType.smartSignals => Icons.traffic_rounded,
    ProjectType.modernStops => Icons.storefront_rounded,
    ProjectType.chargingDepot => Icons.ev_station_rounded,
    ProjectType.depotExpansion => Icons.warehouse_rounded,
  };

  ChunkyPalette get palette => switch (this) {
    ProjectType.roadRepair || ProjectType.roadExpansion => ChunkyPalette.tangerine,
    ProjectType.bikeLanes => ChunkyPalette.lagoon,
    ProjectType.smartSignals => ChunkyPalette.coral,
    ProjectType.modernStops => ChunkyPalette.ocean,
    ProjectType.chargingDepot => ChunkyPalette.green,
    ProjectType.depotExpansion => ChunkyPalette.grape,
  };

  String info(AppLocalizations l10n) => switch (this) {
    ProjectType.roadRepair => l10n.projectRoadRepairInfo,
    ProjectType.roadExpansion => l10n.projectRoadExpansionInfo,
    ProjectType.bikeLanes => l10n.projectBikeLanesInfo,
    ProjectType.smartSignals => l10n.projectSmartSignalsInfo,
    ProjectType.modernStops => l10n.projectModernStopsInfo,
    ProjectType.chargingDepot => l10n.projectChargingDepotInfo,
    ProjectType.depotExpansion => l10n.projectDepotExpansionInfo,
  };

  List<(String, EffectTone)> highlights(AppLocalizations l10n) => switch (this) {
    ProjectType.roadRepair => [
      (l10n.chipRoadFull, EffectTone.good),
      (l10n.chipDriversHappier, EffectTone.good),
      (l10n.chipSafer, EffectTone.good),
    ],
    ProjectType.roadExpansion => [
      (l10n.chipTrafficDown, EffectTone.good),
      (l10n.chipRoadFull, EffectTone.good),
      (l10n.chipJams, EffectTone.bad),
    ],
    ProjectType.bikeLanes => [
      (l10n.chipCyclists, EffectTone.good),
      (l10n.chipCleanAir, EffectTone.good),
      (l10n.chipJams, EffectTone.bad),
    ],
    ProjectType.smartSignals => [
      (l10n.chipTrafficDown, EffectTone.good),
      (l10n.chipSafer, EffectTone.good),
    ],
    ProjectType.modernStops => [
      (l10n.chipCoverage, EffectTone.good),
      (l10n.chipPassengersHappier, EffectTone.good),
    ],
    ProjectType.chargingDepot => [(l10n.chipElectric, EffectTone.neutral)],
    ProjectType.depotExpansion => [(l10n.chipDepot, EffectTone.good)],
  };
}
