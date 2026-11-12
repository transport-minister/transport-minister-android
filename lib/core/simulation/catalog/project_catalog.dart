enum ProjectType {
  roadRepair,
  roadExpansion,
  bikeLanes,
  smartSignals,
  modernStops,
  cityPark,
  parkAndRide,
  chargingDepot,
  depotExpansion;

  bool get isCityWide => this == chargingDepot || this == depotExpansion;

  double get congestionWhileBuilding => switch (this) {
    ProjectType.roadRepair => 15,
    ProjectType.roadExpansion => 25,
    ProjectType.bikeLanes => 15,
    ProjectType.smartSignals => 8,
    ProjectType.modernStops => 5,
    ProjectType.cityPark => 5,
    ProjectType.parkAndRide => 10,
    ProjectType.chargingDepot => 0,
    ProjectType.depotExpansion => 0,
  };
}
