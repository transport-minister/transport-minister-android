import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/illustrations/city_skyline.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension CityPresentation on CityId {
  String displayName(AppLocalizations l10n) => switch (this) {
    CityId.baku => l10n.cityBakuName,
    CityId.istanbul => l10n.cityIstanbulName,
    CityId.london => l10n.cityLondonName,
    CityId.tokyo => l10n.cityTokyoName,
    CityId.newYork => l10n.cityNewYorkName,
  };

  String tagline(AppLocalizations l10n) => switch (this) {
    CityId.baku => l10n.cityBakuTagline,
    CityId.istanbul => l10n.cityIstanbulTagline,
    CityId.london => l10n.cityLondonTagline,
    CityId.tokyo => l10n.cityTokyoTagline,
    CityId.newYork => l10n.cityNewYorkTagline,
  };

  SkylineScene get scene => switch (this) {
    CityId.baku => _baku,
    CityId.istanbul => _istanbul,
    CityId.london => _london,
    CityId.tokyo => _tokyo,
    CityId.newYork => _newYork,
  };
}

const _baku = SkylineScene(
  skyTop: Color(0xFFAEE2FF),
  skyBottom: Color(0xFFE6F7FF),
  base: SkylineBase.water,
  baseColor: Color(0xFF4BA3F5),
  buildings: [
    SkylineBuilding(left: 0.03, width: 0.13, height: 0.32, color: Color(0xFFF3D9A4)),
    SkylineBuilding(
      left: 0.16,
      width: 0.08,
      height: 0.5,
      color: Color(0xFFE8A87C),
      roof: RoofStyle.dome,
    ),
    SkylineBuilding(
      left: 0.3,
      width: 0.12,
      height: 0.78,
      color: Color(0xFF5BB4F2),
      roof: RoofStyle.flame,
    ),
    SkylineBuilding(
      left: 0.43,
      width: 0.14,
      height: 0.95,
      color: Color(0xFF3F9BE8),
      roof: RoofStyle.flame,
    ),
    SkylineBuilding(
      left: 0.58,
      width: 0.12,
      height: 0.72,
      color: Color(0xFF5BB4F2),
      roof: RoofStyle.flame,
    ),
    SkylineBuilding(left: 0.74, width: 0.1, height: 0.4, color: Color(0xFFF7C59F)),
    SkylineBuilding(left: 0.86, width: 0.11, height: 0.28, color: Color(0xFFF3D9A4)),
  ],
);

const _istanbul = SkylineScene(
  skyTop: Color(0xFFFFC9A8),
  skyBottom: Color(0xFFFFEBD6),
  base: SkylineBase.water,
  baseColor: Color(0xFF3F8FD8),
  buildings: [
    SkylineBuilding(left: 0.04, width: 0.12, height: 0.3, color: Color(0xFFF7C59F)),
    SkylineBuilding(
      left: 0.2,
      width: 0.035,
      height: 0.62,
      color: Color(0xFFF5E6C8),
      roof: RoofStyle.minaret,
    ),
    SkylineBuilding(
      left: 0.28,
      width: 0.24,
      height: 0.42,
      color: Color(0xFFF0DDB8),
      roof: RoofStyle.dome,
    ),
    SkylineBuilding(
      left: 0.56,
      width: 0.035,
      height: 0.62,
      color: Color(0xFFF5E6C8),
      roof: RoofStyle.minaret,
    ),
    SkylineBuilding(left: 0.64, width: 0.1, height: 0.3, color: Color(0xFFE8A87C)),
    SkylineBuilding(left: 0.76, width: 0.1, height: 0.38, color: Color(0xFFF7C59F)),
  ],
);

const _london = SkylineScene(
  skyTop: Color(0xFFCBDDEE),
  skyBottom: Color(0xFFEFF5FA),
  base: SkylineBase.ground,
  baseColor: Color(0xFF8FCB6E),
  buildings: [
    SkylineBuilding(
      left: 0.12,
      width: 0.1,
      height: 0.9,
      color: Color(0xFFE8C98F),
      roof: RoofStyle.clock,
    ),
    SkylineBuilding(left: 0.24, width: 0.18, height: 0.42, color: Color(0xFFD9826B)),
    SkylineBuilding(
      left: 0.45,
      width: 0.12,
      height: 0.55,
      color: Color(0xFFB8BFCB),
      roof: RoofStyle.spire,
    ),
    SkylineBuilding(left: 0.6, width: 0.16, height: 0.35, color: Color(0xFFD9826B)),
    SkylineBuilding(left: 0.79, width: 0.13, height: 0.48, color: Color(0xFFC9CED8)),
  ],
);

const _tokyo = SkylineScene(
  skyTop: Color(0xFFFFCFE0),
  skyBottom: Color(0xFFFFF0F5),
  base: SkylineBase.ground,
  baseColor: Color(0xFF8FCB6E),
  buildings: [
    SkylineBuilding(
      left: 0.12,
      width: 0.18,
      height: 0.98,
      color: Color(0xFFF05A4F),
      roof: RoofStyle.lattice,
    ),
    SkylineBuilding(left: 0.35, width: 0.12, height: 0.6, color: Color(0xFFDCE3F0)),
    SkylineBuilding(left: 0.49, width: 0.14, height: 0.75, color: Color(0xFFB9C6E0)),
    SkylineBuilding(left: 0.66, width: 0.1, height: 0.45, color: Color(0xFFE6E9F2)),
    SkylineBuilding(left: 0.79, width: 0.12, height: 0.55, color: Color(0xFFC9D2E6)),
  ],
);

const _newYork = SkylineScene(
  skyTop: Color(0xFFFFE3A0),
  skyBottom: Color(0xFFFFF5DA),
  base: SkylineBase.water,
  baseColor: Color(0xFF4BA3F5),
  buildings: [
    SkylineBuilding(left: 0.04, width: 0.12, height: 0.55, color: Color(0xFFC7CEE6)),
    SkylineBuilding(
      left: 0.18,
      width: 0.14,
      height: 0.72,
      color: Color(0xFF9FA9C9),
      roof: RoofStyle.stepped,
    ),
    SkylineBuilding(left: 0.34, width: 0.11, height: 0.62, color: Color(0xFFB4BDD8)),
    SkylineBuilding(
      left: 0.47,
      width: 0.12,
      height: 0.85,
      color: Color(0xFF8E99BD),
      roof: RoofStyle.spire,
    ),
    SkylineBuilding(left: 0.62, width: 0.13, height: 0.7, color: Color(0xFFC7CEE6)),
    SkylineBuilding(left: 0.78, width: 0.1, height: 0.42, color: Color(0xFFAAB4D2)),
  ],
);
