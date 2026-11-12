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

  Offset get worldCenter => CityWorld.place(_layoutCenter);

  Offset get _layoutCenter => switch (this) {
    DistrictId.windHeights => const Offset(230, 240),
    DistrictId.caspianGardens => const Offset(690, 210),
    DistrictId.flameHills => const Offset(200, 660),
    DistrictId.oldFortress => const Offset(500, 510),
    DistrictId.oilHarbor => const Offset(730, 690),
    DistrictId.seasideBoulevard => const Offset(440, 940),
  };

  double get worldRadius => switch (this) {
    DistrictId.windHeights => 120,
    DistrictId.caspianGardens => 105,
    DistrictId.flameHills => 110,
    DistrictId.oldFortress => 90,
    DistrictId.oilHarbor => 95,
    DistrictId.seasideBoulevard => 105,
  };
}

abstract final class CityWorld {
  static const spread = 1.22;
  static const margin = 300.0;
  static const size = Size(900 * spread + margin * 2, 1200 * spread + margin * 2);

  static Offset place(Offset layout) => layout * spread + const Offset(margin, margin);

  static final districtBounds = DistrictId.values
      .map(
        (district) => Rect.fromCircle(center: district.worldCenter, radius: district.worldRadius),
      )
      .reduce((bounds, area) => bounds.expandToInclude(area));
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
