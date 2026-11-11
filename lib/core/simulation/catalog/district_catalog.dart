enum DistrictId {
  oldFortress,
  seasideBoulevard,
  flameHills,
  oilHarbor,
  windHeights,
  caspianGardens,
}

class DistrictBlueprint {
  const DistrictBlueprint({
    required this.population,
    required this.baseCongestion,
    required this.roadCondition,
    required this.roadLevel,
  });

  final int population;
  final double baseCongestion;
  final double roadCondition;
  final int roadLevel;
}

extension DistrictBlueprints on DistrictId {
  DistrictBlueprint get blueprint => switch (this) {
    DistrictId.oldFortress => const DistrictBlueprint(
      population: 95000,
      baseCongestion: 62,
      roadCondition: 58,
      roadLevel: 1,
    ),
    DistrictId.seasideBoulevard => const DistrictBlueprint(
      population: 140000,
      baseCongestion: 48,
      roadCondition: 72,
      roadLevel: 2,
    ),
    DistrictId.flameHills => const DistrictBlueprint(
      population: 185000,
      baseCongestion: 70,
      roadCondition: 66,
      roadLevel: 2,
    ),
    DistrictId.oilHarbor => const DistrictBlueprint(
      population: 120000,
      baseCongestion: 58,
      roadCondition: 41,
      roadLevel: 1,
    ),
    DistrictId.windHeights => const DistrictBlueprint(
      population: 360000,
      baseCongestion: 55,
      roadCondition: 50,
      roadLevel: 1,
    ),
    DistrictId.caspianGardens => const DistrictBlueprint(
      population: 230000,
      baseCongestion: 44,
      roadCondition: 63,
      roadLevel: 1,
    ),
  };
}
