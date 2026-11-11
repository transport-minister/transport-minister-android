enum ProjectType {
  roadRepair,
  roadExpansion,
  bikeLanes,
  smartSignals,
  modernStops,
  chargingDepot,
  depotExpansion;

  bool get isCityWide => this == chargingDepot || this == depotExpansion;

  double get congestionWhileBuilding => switch (this) {
    ProjectType.roadRepair => 15,
    ProjectType.roadExpansion => 25,
    ProjectType.bikeLanes => 15,
    ProjectType.smartSignals => 8,
    ProjectType.modernStops => 5,
    ProjectType.chargingDepot => 0,
    ProjectType.depotExpansion => 0,
  };
}
