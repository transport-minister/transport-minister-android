abstract final class GameBalance {
  static const tickLength = Duration(seconds: 1);
  static const maxCatchUpTicks = 60;
  static const ticksPerMinute = 60;

  static const startingBudget = 0;
  static const startingFare = 60;
  static const minFare = 20;
  static const maxFare = 150;
  static const fareStep = 10;
  static const startingDepotCapacity = 40;
  static const startingFleetSize = 24;
  static const maxActiveProjects = 2;
  static const busDeliverySeconds = 15;

  static const ridersPerThousandResidents = 0.53;
  static const referenceFare = 60;
  static const fareElasticity = 0.6;
  static const minFareDemandFactor = 0.5;
  static const maxFareDemandFactor = 1.25;
  static const baseTripsPerBusSecond = 0.4;
  static const congestionTripPenalty = 0.4;
  static const waitingMinutesAtFullService = 8.0;
  static const minWaitingMinutes = 3.0;
  static const maxWaitingMinutes = 45.0;
  static const reliabilityLossPerSecond = 6.7e-6;
  static const minReliability = 0.4;
  static const maxReliability = 0.98;
  static const maintenanceAgeFactorSeconds = 60000;
  static const resaleAgeFactorSeconds = 45000;

  static const ticketsPerRider = 2.5;
  static const budgetPerSecond = 2600;
  static const minBudgetFactor = 0.5;
  static const maxBudgetFactor = 1.5;
  static const administrationPerSecond = 50;
  static const driverWagePerBusSecond = 3.7;

  static const satisfactionSmoothing = 0.0075;
  static const neutralSatisfaction = 50.0;
  static const satisfactionSpread = 1.3;
  static const crisisSatisfactionThreshold = 30.0;
  static const crisisBudgetThreshold = -250000;
  static const gridlockCongestion = 62.0;
  static const crisisWarningSeconds = [90, 180, 270];
  static const dismissalCrisisSeconds = 300;

  static const loanInterest = 0.08;
  static const loanTermSeconds = 900;
  static const loanOptions = [500000, 1000000, 2000000];

  static const bikeLaneRoadSpaceCongestion = 6.0;
  static const bikeLaneMaxCongestionRelief = 14.0;
  static const bikeAdoptionPerSecond = 0.001;
  static const smartSignalsCongestionFactor = 0.9;
  static const modernStopsCoverageBonus = 0.1;
  static const congestionRoadWear = 3.3e-5;
}
