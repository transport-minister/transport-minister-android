abstract final class GameBalance {
  static const dayLength = Duration(minutes: 1);
  static const maxCatchUpDays = 7;

  static const startingBudget = 2500000;
  static const startingFare = 60;
  static const minFare = 20;
  static const maxFare = 150;
  static const fareStep = 10;
  static const startingDepotCapacity = 40;
  static const startingFleetSize = 24;
  static const maxActiveProjects = 2;
  static const busDeliveryDays = 1;
  static const reportHistoryDays = 30;

  static const ridersPerThousandResidents = 16;
  static const referenceFare = 60;
  static const fareElasticity = 0.6;
  static const minFareDemandFactor = 0.5;
  static const maxFareDemandFactor = 1.25;
  static const baseTripsPerBusDay = 12;
  static const congestionTripPenalty = 0.4;
  static const waitingMinutesAtFullService = 8.0;
  static const minWaitingMinutes = 3.0;
  static const maxWaitingMinutes = 45.0;
  static const reliabilityLossPerDay = 0.0002;
  static const minReliability = 0.4;
  static const maxReliability = 0.98;
  static const maintenanceAgeFactorDays = 2000;

  static const dailySubsidy = 6000;
  static const administrationPerDay = 1500;
  static const driverWagePerBusDay = 110;
  static const monthLengthDays = 30;
  static const monthlyAllocationBase = 500000;
  static const minAllocationFactor = 0.5;
  static const maxAllocationFactor = 1.5;

  static const satisfactionSmoothing = 0.15;
  static const crisisSatisfactionThreshold = 30.0;
  static const crisisBudgetThreshold = -250000;
  static const crisisWarningDays = [3, 6, 9];
  static const dismissalCrisisDays = 10;

  static const loanInterest = 0.08;
  static const loanTermDays = 30;
  static const loanOptions = [500000, 1000000, 2000000];

  static const constructionCongestion = 15.0;
  static const expansionCongestion = 25.0;
  static const bikeLaneRoadSpaceCongestion = 6.0;
  static const bikeLaneMaxCongestionRelief = 14.0;
  static const bikeAdoptionPerDay = 0.03;
  static const smartSignalsCongestionFactor = 0.9;
  static const modernStopsCoverageBonus = 0.1;
  static const caspianGardensGrowthPerDay = 0.0005;
  static const congestionRoadWear = 0.001;
}
