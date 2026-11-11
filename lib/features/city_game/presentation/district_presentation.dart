import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/chunky_palette.dart';
import 'package:transport_minister/core/simulation/catalog/district_catalog.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension DistrictPresentation on DistrictId {
  String displayName(AppLocalizations l10n) => switch (this) {
    DistrictId.oldFortress => l10n.districtOldFortress,
    DistrictId.seasideBoulevard => l10n.districtSeasideBoulevard,
    DistrictId.flameHills => l10n.districtFlameHills,
    DistrictId.oilHarbor => l10n.districtOilHarbor,
    DistrictId.windHeights => l10n.districtWindHeights,
    DistrictId.caspianGardens => l10n.districtCaspianGardens,
  };

  String tagline(AppLocalizations l10n) => switch (this) {
    DistrictId.oldFortress => l10n.districtOldFortressTagline,
    DistrictId.seasideBoulevard => l10n.districtSeasideBoulevardTagline,
    DistrictId.flameHills => l10n.districtFlameHillsTagline,
    DistrictId.oilHarbor => l10n.districtOilHarborTagline,
    DistrictId.windHeights => l10n.districtWindHeightsTagline,
    DistrictId.caspianGardens => l10n.districtCaspianGardensTagline,
  };

  IconData get icon => switch (this) {
    DistrictId.oldFortress => Icons.fort_rounded,
    DistrictId.seasideBoulevard => Icons.beach_access_rounded,
    DistrictId.flameHills => Icons.local_fire_department_rounded,
    DistrictId.oilHarbor => Icons.anchor_rounded,
    DistrictId.windHeights => Icons.air_rounded,
    DistrictId.caspianGardens => Icons.park_rounded,
  };

  ChunkyPalette get palette => switch (this) {
    DistrictId.oldFortress => ChunkyPalette.sunny,
    DistrictId.seasideBoulevard => ChunkyPalette.lagoon,
    DistrictId.flameHills => ChunkyPalette.tangerine,
    DistrictId.oilHarbor => ChunkyPalette.ocean,
    DistrictId.windHeights => ChunkyPalette.grape,
    DistrictId.caspianGardens => ChunkyPalette.green,
  };

  Color get landColor => switch (this) {
    DistrictId.oldFortress => const Color(0xFFF6DFA8),
    DistrictId.seasideBoulevard => const Color(0xFFBFEBDD),
    DistrictId.flameHills => const Color(0xFFFFD2B0),
    DistrictId.oilHarbor => const Color(0xFFCFE0F2),
    DistrictId.windHeights => const Color(0xFFE2D6FA),
    DistrictId.caspianGardens => const Color(0xFFD3EFC4),
  };

  Offset get mapCenter => switch (this) {
    DistrictId.windHeights => const Offset(0.27, 0.19),
    DistrictId.caspianGardens => const Offset(0.73, 0.16),
    DistrictId.flameHills => const Offset(0.23, 0.5),
    DistrictId.oldFortress => const Offset(0.54, 0.43),
    DistrictId.oilHarbor => const Offset(0.8, 0.47),
    DistrictId.seasideBoulevard => const Offset(0.44, 0.73),
  };

  double get mapRadius => switch (this) {
    DistrictId.windHeights => 0.19,
    DistrictId.caspianGardens => 0.16,
    DistrictId.flameHills => 0.16,
    DistrictId.oldFortress => 0.12,
    DistrictId.oilHarbor => 0.13,
    DistrictId.seasideBoulevard => 0.15,
  };
}

abstract final class CityRoads {
  static const links = [
    (DistrictId.windHeights, DistrictId.caspianGardens),
    (DistrictId.windHeights, DistrictId.flameHills),
    (DistrictId.windHeights, DistrictId.oldFortress),
    (DistrictId.caspianGardens, DistrictId.oldFortress),
    (DistrictId.caspianGardens, DistrictId.oilHarbor),
    (DistrictId.flameHills, DistrictId.oldFortress),
    (DistrictId.flameHills, DistrictId.seasideBoulevard),
    (DistrictId.oldFortress, DistrictId.seasideBoulevard),
    (DistrictId.oldFortress, DistrictId.oilHarbor),
    (DistrictId.oilHarbor, DistrictId.seasideBoulevard),
  ];
}
