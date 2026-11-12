import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/simulation/catalog/bus_catalog.dart';
import 'package:transport_minister/core/simulation/catalog/game_balance.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension BusModelPresentation on BusModelId {
  IconData get icon => switch (this) {
    BusModelId.veteran => Icons.directions_bus_filled_rounded,
    BusModelId.hopMini => Icons.airport_shuttle_rounded,
    BusModelId.cityRunner => Icons.directions_bus_rounded,
    BusModelId.megaLink => Icons.directions_transit_filled_rounded,
    BusModelId.voltaE => Icons.bolt_rounded,
  };

  ChunkyPalette get palette => switch (this) {
    BusModelId.veteran => ChunkyPalette.stone,
    BusModelId.hopMini => ChunkyPalette.lagoon,
    BusModelId.cityRunner => ChunkyPalette.ocean,
    BusModelId.megaLink => ChunkyPalette.tangerine,
    BusModelId.voltaE => ChunkyPalette.green,
  };

  int get runningCostPerSecond =>
      (spec.energyPerSecond + spec.maintenancePerSecond + GameBalance.driverWagePerBusSecond)
          .round();

  String eco(AppLocalizations l10n) {
    final emission = spec.emission;
    if (emission == 0) {
      return l10n.ecoZero;
    }
    if (emission < 0.6) {
      return l10n.ecoLow;
    }
    return emission < 1 ? l10n.ecoMedium : l10n.ecoHigh;
  }
}
