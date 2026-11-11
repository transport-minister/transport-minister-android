enum DecisionKind { request, opportunity, crisis, disaster }

enum DecisionId {
  overcrowdedBuses(DecisionKind.request),
  potholes(DecisionKind.request),
  bikePetition(DecisionKind.request),
  parkingChaos(DecisionKind.request),
  driverWages(DecisionKind.crisis),
  trafficAccident(DecisionKind.crisis),
  fuelSpike(DecisionKind.crisis),
  busDiscount(DecisionKind.opportunity),
  privateOperator(DecisionKind.opportunity),
  budgetHearing(DecisionKind.opportunity),
  festival(DecisionKind.opportunity),
  touristSeason(DecisionKind.opportunity),
  greenFund(DecisionKind.opportunity),
  flood(DecisionKind.disaster),
  windStorm(DecisionKind.disaster),
  heatwave(DecisionKind.disaster),
  earthquake(DecisionKind.disaster),
  snowstorm(DecisionKind.disaster),
  harborFire(DecisionKind.disaster),
  landslide(DecisionKind.disaster);

  const DecisionId(this.kind);

  final DecisionKind kind;
}
