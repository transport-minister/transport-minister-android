// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Transport Minister';

  @override
  String get appTagline => 'Move the city. Win the people.';

  @override
  String get commonBack => 'Back';

  @override
  String get commonGotIt => 'Got it';

  @override
  String get splashTitleTop => 'Transport';

  @override
  String get splashTitleBottom => 'Minister';

  @override
  String get splashLoading => 'Preparing the city…';

  @override
  String get citySelectionTitle => 'Choose your city';

  @override
  String get citySelectionSubtitle => 'Where will you serve as Transport Minister?';

  @override
  String get cityPlay => 'Play';

  @override
  String get cityStatusPlayable => 'Playable';

  @override
  String get cityStatusComingSoon => 'Coming soon';

  @override
  String cityComingSoonTitle(String city) {
    return '$city is on its way!';
  }

  @override
  String get cityComingSoonBody =>
      'We are still drawing its streets and timetables. Grow your career in Baku meanwhile.';

  @override
  String cityLockedTitle(String city) {
    return '$city is locked';
  }

  @override
  String get cityFeatureBuses => 'Buses';

  @override
  String get cityFeatureRoads => 'Roads';

  @override
  String get cityFeatureBikeLanes => 'Bike lanes';

  @override
  String get cityBakuName => 'Baku';

  @override
  String get cityBakuTagline => 'Windy capital on the Caspian Sea';

  @override
  String get cityIstanbulName => 'Istanbul';

  @override
  String get cityIstanbulTagline => 'Two continents, one traffic jam';

  @override
  String get cityLondonName => 'London';

  @override
  String get cityLondonTagline => 'Double-deckers and rainy rush hours';

  @override
  String get cityTokyoName => 'Tokyo';

  @override
  String get cityTokyoTagline => 'The busiest stations on Earth';

  @override
  String get cityNewYorkName => 'New York';

  @override
  String get cityNewYorkTagline => 'The city that never parks';

  @override
  String get rankJuniorOfficial => 'Junior Transport Official';

  @override
  String get rankInspector => 'Transport Inspector';

  @override
  String get rankDirector => 'Transport Director';

  @override
  String get rankDeputyMinister => 'Deputy Transport Minister';

  @override
  String get rankMinister => 'Transport Minister';

  @override
  String get rankSeniorMinister => 'Senior Transport Minister';

  @override
  String get rankRegionalGovernor => 'Regional Transport Governor';

  @override
  String get rankNationalLeader => 'National Infrastructure Leader';

  @override
  String get rankInternationalAuthority => 'International Transport Authority';

  @override
  String get districtOldFortress => 'Old Fortress';

  @override
  String get districtSeasideBoulevard => 'Seaside Boulevard';

  @override
  String get districtFlameHills => 'Flame Hills';

  @override
  String get districtOilHarbor => 'Oil Harbor';

  @override
  String get districtWindHeights => 'Wind Heights';

  @override
  String get districtCaspianGardens => 'Caspian Gardens';

  @override
  String get districtOldFortressTagline => 'Narrow lanes, ancient walls, crowds of tourists';

  @override
  String get districtSeasideBoulevardTagline => 'Promenade by the sea, loved by walkers';

  @override
  String get districtFlameHillsTagline => 'Glass towers and busy offices';

  @override
  String get districtOilHarborTagline => 'Cranes, trucks and the city\'s cargo gate';

  @override
  String get districtWindHeightsTagline => 'The biggest neighbourhood on the windy hills';

  @override
  String get districtCaspianGardensTagline => 'New homes growing fast by the shore';

  @override
  String hudSatisfaction(int value) {
    return '$value%';
  }

  @override
  String get hudBudgetLabel => 'Budget';

  @override
  String get hudDiplomacyLabel => 'Diplomacy points';

  @override
  String get hudSatisfactionLabel => 'Satisfaction';

  @override
  String get hudIncomeLabel => 'Earnings per second';

  @override
  String get hudPopulationLabel => 'Residents';

  @override
  String statIncome(String amount) {
    return '$amount/s';
  }

  @override
  String get hudBackToCities => 'Cities';

  @override
  String get crisisGridlock =>
      'Gridlock! Traffic is jamming the city. Clear it before the President notices!';

  @override
  String get crisisAngry => 'Citizens are getting angry. Act before the President notices!';

  @override
  String get crisisDebt => 'The budget is deep in the red. Fix it before the President notices!';

  @override
  String crisisWarningGridlock(int level) {
    return 'President\'s warning $level/3: clear the traffic!';
  }

  @override
  String crisisWarningUnhappy(int level) {
    return 'President\'s warning $level/3: make citizens happier!';
  }

  @override
  String crisisWarningDebt(int level) {
    return 'President\'s warning $level/3: fix the budget!';
  }

  @override
  String get statWaiting => 'Waiting';

  @override
  String get statCongestion => 'Traffic';

  @override
  String get statRoad => 'Road';

  @override
  String get statBuses => 'Buses';

  @override
  String statMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String statPercent(int value) {
    return '$value%';
  }

  @override
  String districtRidersServed(String capacity, String demand) {
    return 'Carries $capacity of $demand riders a second';
  }

  @override
  String districtResidents(String count, String growth) {
    return '$count residents · +$growth/s';
  }

  @override
  String get ledgerTickets => 'Ticket sales';

  @override
  String get ledgerSubsidy => 'Subsidy';

  @override
  String get ledgerGovernmentBudget => 'Cabinet budget';

  @override
  String get ledgerVehicleSales => 'Bus sales';

  @override
  String get ledgerLoanReceived => 'Loan';

  @override
  String get ledgerEnergy => 'Fuel & power';

  @override
  String get ledgerSalaries => 'Driver wages';

  @override
  String get ledgerVehicleMaintenance => 'Bus repairs';

  @override
  String get ledgerRoadMaintenance => 'Road upkeep';

  @override
  String get ledgerAdministration => 'Ministry office';

  @override
  String get ledgerLoanRepayment => 'Loan repayment';

  @override
  String get ledgerVehiclePurchases => 'New buses';

  @override
  String get ledgerVehicleUpgrades => 'Bus upgrades';

  @override
  String get ledgerConstruction => 'Construction';

  @override
  String get projectRoadRepair => 'Road repair';

  @override
  String get projectRoadExpansion => 'Road widening';

  @override
  String get projectBikeLanes => 'Bike lanes';

  @override
  String get projectSmartSignals => 'Smart traffic lights';

  @override
  String get projectModernStops => 'Modern bus stops';

  @override
  String get projectCityPark => 'City park';

  @override
  String get projectParkAndRide => 'Park & Ride';

  @override
  String get projectChargingDepot => 'Charging depot';

  @override
  String get projectDepotExpansion => 'Depot expansion';

  @override
  String get rejectInsufficientFunds => 'Not enough budget for that';

  @override
  String get rejectDepotFull => 'The bus depot is full';

  @override
  String get rejectMaxLevel => 'Already at the highest level';

  @override
  String get rejectProjectLimit => 'Too many construction sites at once';

  @override
  String get rejectAlreadyInProgress => 'Work is already underway here';

  @override
  String get rejectAlreadyBuilt => 'That is already built';

  @override
  String get rejectRequiresChargingDepot => 'Build a charging depot first';

  @override
  String get rejectInvalidTarget => 'That is not possible right now';

  @override
  String get rejectLoanActive => 'Repay your current loan first';

  @override
  String get rejectFareOutOfRange => 'That fare is not allowed';

  @override
  String eventBusesDelivered(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new buses joined the fleet',
      one: 'A new bus joined the fleet',
    );
    return '$_temp0';
  }

  @override
  String eventProjectCompleted(String project) {
    return '$project is ready!';
  }

  @override
  String eventBudgetAllocated(String amount) {
    return 'The Cabinet sent $amount';
  }

  @override
  String eventCrisisWarning(int level) {
    return 'President\'s warning $level/3';
  }

  @override
  String get dismissedTitle => 'You have been dismissed';

  @override
  String dismissedBody(String reason) {
    return '$reason Your rank and achievements stay with you. Try again with a fresh start!';
  }

  @override
  String get dismissedGridlock => 'Endless traffic jams paralysed Baku.';

  @override
  String get dismissedUnhappy => 'Baku lost faith in your leadership.';

  @override
  String get dismissedDebt => 'Baku ran out of money.';

  @override
  String get dismissedRestart => 'Start over';

  @override
  String get loadingCity => 'Opening the city…';

  @override
  String get loadingFailed => 'The city could not be opened.';

  @override
  String get commonRetry => 'Try again';

  @override
  String get mapRecenter => 'Recenter map';

  @override
  String get advisorTitle => 'Mr. Bus says';

  @override
  String get advisorShowMe => 'Show me';

  @override
  String get tipNegativeBudget =>
      'Our budget is below zero! Raise fares a little or sell old buses before the President notices.';

  @override
  String get tipPresidentWatching =>
      'The President is watching us. Lift satisfaction fast: more buses and better roads!';

  @override
  String tipLongWaits(String district, int minutes) {
    return 'People in $district wait $minutes minutes for a bus. Let\'s add buses there!';
  }

  @override
  String tipBrokenRoads(String district, int condition) {
    return 'Roads in $district are crumbling ($condition%). A repair keeps drivers and trucks happy.';
  }

  @override
  String tipTrafficJam(String district) {
    return '$district is jammed. Bike lanes slow traffic while they are built, but help a lot later.';
  }

  @override
  String get tipOldFleet =>
      'Our old buses keep breaking down. Upgrades or newer models will keep the city moving.';

  @override
  String get tipAllGood => 'Things look calm, Minister! Keep an eye on the busiest districts.';

  @override
  String get citySectionNext => 'Next cities';

  @override
  String cityLockedBody(String city) {
    return 'Complete $city to unlock it.';
  }

  @override
  String cityRequirement(String city) {
    return 'Complete $city';
  }

  @override
  String cityLevelChip(int level, int target) {
    return 'Level $level · Target $target';
  }

  @override
  String get ledgerLevelRewards => 'Level rewards';

  @override
  String levelBarLabel(int level) {
    return 'Level $level';
  }

  @override
  String levelBarPoints(int points, int next) {
    return '$points / $next pts';
  }

  @override
  String get levelBarMax => 'Max level reached';

  @override
  String levelSheetTitle(String city) {
    return '$city development';
  }

  @override
  String get levelSheetBody =>
      'Earn city points all the time by keeping citizens happy and the budget growing. New buses, upgrades, finished projects and wise decisions give extra points. Every level pays a Cabinet bonus and diplomacy points.';

  @override
  String levelUpTitle(String city, int level) {
    return '$city reached level $level!';
  }

  @override
  String levelUpReward(String amount, int diplomacy, int percent) {
    return 'The Cabinet sends $amount and $diplomacy diplomacy points, and your budget grows by $percent%!';
  }

  @override
  String get levelUpContinue => 'Hooray!';

  @override
  String get eventCrisisAverted => 'Crisis averted! The President is calm again.';

  @override
  String get profileTitle => 'Minister profile';

  @override
  String get profileOpen => 'Open profile';

  @override
  String get profileReputation => 'Reputation';

  @override
  String profileXp(String xp, String next) {
    return '$xp / $next XP';
  }

  @override
  String profileXpMax(String xp) {
    return '$xp XP · Highest rank';
  }

  @override
  String get profileRanks => 'Ranks';

  @override
  String get profileCityBadges => 'City badges';

  @override
  String profileAchievements(int done, int total) {
    return 'Achievements $done/$total';
  }

  @override
  String get profileCareer => 'Career';

  @override
  String get careerTime => 'Time in office';

  @override
  String get careerBuses => 'Buses bought';

  @override
  String get careerUpgrades => 'Upgrades';

  @override
  String get careerProjects => 'Projects';

  @override
  String get careerCrises => 'Crises averted';

  @override
  String get careerDismissals => 'Dismissals';

  @override
  String get badgeBronze => 'Bronze';

  @override
  String get badgeSilver => 'Silver';

  @override
  String get badgeGold => 'Gold';

  @override
  String get badgeLocked => 'Not earned';

  @override
  String badgeEarnedToast(String tier, String city) {
    return '$tier badge earned in $city!';
  }

  @override
  String achievementToast(String title, int xp) {
    return 'Achievement unlocked: $title · +$xp XP';
  }

  @override
  String get promotedTitle => 'Promoted!';

  @override
  String promotedBody(String rank) {
    return 'You are now $rank. The whole ministry salutes you!';
  }

  @override
  String get promotedContinue => 'Thank you!';

  @override
  String get achievementFirstBusTitle => 'First Bus';

  @override
  String get achievementFirstBusDescription => 'Buy your first bus.';

  @override
  String get achievementFleetBuilderTitle => 'Fleet Builder';

  @override
  String get achievementFleetBuilderDescription => 'Run 40 buses in one city.';

  @override
  String get achievementModernCityTitle => 'Modern City';

  @override
  String get achievementModernCityDescription =>
      'Retire every Veteran bus from a fleet of 20 or more.';

  @override
  String get achievementGreenRevolutionTitle => 'Green Revolution';

  @override
  String get achievementGreenRevolutionDescription => 'Buy your first electric bus.';

  @override
  String get achievementUpgradeEnthusiastTitle => 'Upgrade Enthusiast';

  @override
  String get achievementUpgradeEnthusiastDescription => 'Upgrade buses 10 times.';

  @override
  String get achievementRoadWarriorTitle => 'Road Warrior';

  @override
  String get achievementRoadWarriorDescription => 'Finish 10 road repairs.';

  @override
  String get achievementBikeFriendlyTitle => 'Bike Friendly';

  @override
  String get achievementBikeFriendlyDescription => 'Build bike lanes in 3 districts.';

  @override
  String get achievementInfrastructureMasterTitle => 'Infrastructure Master';

  @override
  String get achievementInfrastructureMasterDescription => 'Complete 50 construction projects.';

  @override
  String get achievementEconomicStrategistTitle => 'Economic Strategist';

  @override
  String get achievementEconomicStrategistDescription =>
      'Keep the budget growing for 15 minutes in a row.';

  @override
  String get achievementSmilingCityTitle => 'Smiling City';

  @override
  String get achievementSmilingCityDescription => 'Reach 60% citizen satisfaction.';

  @override
  String get achievementHappyCitizensTitle => 'Happy Citizens';

  @override
  String get achievementHappyCitizensDescription => 'Reach 90% citizen satisfaction.';

  @override
  String get achievementRisingCityTitle => 'Rising City';

  @override
  String get achievementRisingCityDescription => 'Reach city level 5.';

  @override
  String get achievementCityChampionTitle => 'City Champion';

  @override
  String get achievementCityChampionDescription => 'Complete a city.';

  @override
  String get achievementSurvivorTitle => 'Survivor';

  @override
  String get achievementSurvivorDescription => 'Recover after a President\'s warning.';

  @override
  String get achievementVeteranMinisterTitle => 'Veteran Minister';

  @override
  String get achievementVeteranMinisterDescription => 'Serve 3 hours in office.';

  @override
  String get ledgerDecisions => 'Decisions & events';

  @override
  String eventDecisionArrived(String title) {
    return 'Mr. Bus has news: $title';
  }

  @override
  String eventDecisionAutomatic(String title) {
    return 'Time ran out: $title was decided for you';
  }

  @override
  String get groupPassengers => 'Passengers';

  @override
  String get groupDrivers => 'Drivers';

  @override
  String get groupPedestrians => 'Pedestrians';

  @override
  String get groupCyclists => 'Cyclists';

  @override
  String get groupBusinesses => 'Businesses';

  @override
  String get groupTransportWorkers => 'Bus crews';

  @override
  String get groupEnvironmentalists => 'Eco groups';

  @override
  String get groupLogistics => 'Logistics';

  @override
  String get busVeteran => 'Veteran 80';

  @override
  String get busHopMini => 'Hop Mini';

  @override
  String get busCityRunner => 'CityRunner 12';

  @override
  String get busMegaLink => 'MegaLink';

  @override
  String get busVoltaE => 'Volta E-12';

  @override
  String get kindRequest => 'Request';

  @override
  String get kindOpportunity => 'Offer';

  @override
  String get kindCrisis => 'Crisis';

  @override
  String get kindDisaster => 'Disaster';

  @override
  String decisionTimeLeft(String time) {
    return '$time left';
  }

  @override
  String get decisionChoose => 'Choose';

  @override
  String decisionCost(String amount) {
    return 'Cost $amount';
  }

  @override
  String get decisionFree => 'Free';

  @override
  String decisionRisk(int chance) {
    return '$chance% risk:';
  }

  @override
  String get decisionResultTitle => 'Decision made!';

  @override
  String get decisionResultCalm => 'Everything went as planned, Minister.';

  @override
  String get decisionResultRisk => 'Oh no! The risk came true. Here is what happened:';

  @override
  String get decisionResultOk => 'OK';

  @override
  String get newsTitle => 'Mr. Bus has news';

  @override
  String newsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count decisions waiting',
      one: '1 decision waiting',
    );
    return '$_temp0';
  }

  @override
  String effectMood(String group, String change) {
    return '$group $change';
  }

  @override
  String effectReputation(String change) {
    return 'Reputation $change';
  }

  @override
  String effectRoadDamage(int amount, String district) {
    return 'Road -$amount · $district';
  }

  @override
  String effectRoadRestore(String district) {
    return 'Road fixed · $district';
  }

  @override
  String effectCapacity(String change) {
    return 'Bus capacity $change';
  }

  @override
  String effectDemand(String change) {
    return 'Riders $change';
  }

  @override
  String effectCongestion(String change) {
    return 'Traffic $change';
  }

  @override
  String effectSafety(String change) {
    return 'Safety $change';
  }

  @override
  String effectEnergyCost(String change) {
    return 'Fuel cost $change';
  }

  @override
  String effectSalaryCost(String change) {
    return 'Wages $change';
  }

  @override
  String effectTicketRevenue(String change) {
    return 'Ticket income $change';
  }

  @override
  String effectSubsidy(String change) {
    return 'Subsidy $change';
  }

  @override
  String effectExtraCost(String amount) {
    return 'Costs $amount/s';
  }

  @override
  String effectExtraIncome(String amount) {
    return 'Income $amount/s';
  }

  @override
  String effectMoodTrend(String group, String change) {
    return '$group mood $change';
  }

  @override
  String get effectForever => 'forever';

  @override
  String effectBuses(int count, String model) {
    return '+$count $model';
  }

  @override
  String effectProject(String project) {
    return 'Starts $project';
  }

  @override
  String effectDiscount(String project, int percent) {
    return '$project $percent% off';
  }

  @override
  String effectLoseBuses(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Lose $count buses',
      one: 'Lose 1 bus',
    );
    return '$_temp0';
  }

  @override
  String effectFare(String change) {
    return 'Fare $change';
  }

  @override
  String decisionOvercrowdedBusesTitle(String district) {
    return 'Packed buses in $district!';
  }

  @override
  String decisionOvercrowdedBusesBody(String district) {
    return 'Minister, people in $district squeeze into buses like pickles in a jar. What do we do?';
  }

  @override
  String get decisionOvercrowdedBusesOptionA => 'Rush-order 3 CityRunners';

  @override
  String get decisionOvercrowdedBusesOptionB => 'Extra shifts for a while';

  @override
  String get decisionOvercrowdedBusesOptionC => 'Ask people to be patient';

  @override
  String decisionPotholesTitle(String district) {
    return 'Potholes in $district!';
  }

  @override
  String decisionPotholesBody(String district) {
    return 'The roads in $district have more holes than cheese. Drivers are furious!';
  }

  @override
  String get decisionPotholesOptionA => 'Emergency repair now';

  @override
  String get decisionPotholesOptionB => 'Schedule a normal repair';

  @override
  String get decisionPotholesOptionC => 'Put up warning signs';

  @override
  String get decisionBikePetitionTitle => 'Bike lane petition';

  @override
  String decisionBikePetitionBody(String district) {
    return 'Eco activists in $district collected 10,000 signatures for bike lanes. A green fund will pay 30%!';
  }

  @override
  String get decisionBikePetitionOptionA => 'Build bike lanes';

  @override
  String get decisionBikePetitionOptionB => 'Fund a study first';

  @override
  String get decisionBikePetitionOptionC => 'Say no';

  @override
  String decisionParkingChaosTitle(String district) {
    return 'Parking chaos in $district';
  }

  @override
  String decisionParkingChaosBody(String district) {
    return 'Cars are parked on sidewalks, in bus lanes, even on a fountain in $district!';
  }

  @override
  String get decisionParkingChaosOptionA => 'Introduce parking fees';

  @override
  String get decisionParkingChaosOptionB => 'Build a parking garage';

  @override
  String get decisionParkingChaosOptionC => 'Look the other way';

  @override
  String get decisionDriverWagesTitle => 'Drivers want a raise';

  @override
  String get decisionDriverWagesBody =>
      'Our bus drivers say their wages are too low. The union is whispering about a strike...';

  @override
  String get decisionDriverWagesOptionA => 'Raise wages by 15%';

  @override
  String get decisionDriverWagesOptionB => 'Pay a one-time bonus';

  @override
  String get decisionDriverWagesOptionC => 'Refuse';

  @override
  String get decisionTrafficAccidentTitle => 'Crash at a busy junction';

  @override
  String decisionTrafficAccidentBody(String district) {
    return 'A nasty crash in $district shows the junction is dangerous. People demand action!';
  }

  @override
  String get decisionTrafficAccidentOptionA => 'Install smart traffic lights';

  @override
  String get decisionTrafficAccidentOptionB => 'Run a safety campaign';

  @override
  String get decisionTrafficAccidentOptionC => 'Do nothing';

  @override
  String get decisionFuelSpikeTitle => 'Fuel prices jumped 30%!';

  @override
  String get decisionFuelSpikeBody =>
      'Diesel suddenly got expensive, and our buses drink a lot of it...';

  @override
  String get decisionFuelSpikeOptionA => 'Buy a price hedge';

  @override
  String get decisionFuelSpikeOptionB => 'Add a fare surcharge';

  @override
  String get decisionFuelSpikeOptionC => 'Absorb the cost';

  @override
  String get decisionBusDiscountTitle => 'Bus sale!';

  @override
  String decisionBusDiscountBody(String district) {
    return 'Silkway Motors offers CityRunner buses at 25% off right now. They would start in $district.';
  }

  @override
  String get decisionBusDiscountOptionA => 'Buy 2 buses';

  @override
  String get decisionBusDiscountOptionB => 'Buy 5 buses';

  @override
  String get decisionBusDiscountOptionC => 'No, thanks';

  @override
  String get decisionPrivateOperatorTitle => 'Private bus company';

  @override
  String decisionPrivateOperatorBody(String district) {
    return 'A private company wants to run extra buses in $district for a share of the ticket money.';
  }

  @override
  String get decisionPrivateOperatorOptionA => 'Accept the deal';

  @override
  String get decisionPrivateOperatorOptionB => 'Negotiate better terms';

  @override
  String get decisionPrivateOperatorOptionC => 'Decline';

  @override
  String get decisionBudgetHearingTitle => 'Cabinet budget hearing';

  @override
  String get decisionBudgetHearingBody =>
      'The Cabinet wants to know how we spend their money. Our chance to ask for more!';

  @override
  String get decisionBudgetHearingOptionA => 'Ask for a big grant';

  @override
  String get decisionBudgetHearingOptionB => 'Ask for a bigger subsidy';

  @override
  String get decisionBudgetHearingOptionC => 'Promise savings';

  @override
  String get decisionBudgetHearingOptionD => 'Skip the hearing';

  @override
  String get decisionFestivalTitle => 'Festival on the Boulevard!';

  @override
  String get decisionFestivalBody =>
      'A huge music festival is coming to Seaside Boulevard. Thousands of fans will need a ride!';

  @override
  String get decisionFestivalOptionA => 'Run special buses';

  @override
  String get decisionFestivalOptionB => 'Close the Boulevard to cars';

  @override
  String get decisionFestivalOptionC => 'Business as usual';

  @override
  String get decisionTouristSeasonTitle => 'Tourist season!';

  @override
  String get decisionTouristSeasonBody =>
      'Tourists flood the Old Fortress with selfie sticks. Shops are happy, streets are crowded.';

  @override
  String get decisionTouristSeasonOptionA => 'Launch a tourist shuttle';

  @override
  String get decisionTouristSeasonOptionB => 'Add a tourist ticket surcharge';

  @override
  String get decisionTouristSeasonOptionC => 'Do nothing';

  @override
  String get decisionGreenFundTitle => 'Green fund offer';

  @override
  String get decisionGreenFundBody =>
      'A green fund will pay 40% of a charging depot so we can run electric buses!';

  @override
  String get decisionGreenFundOptionA => 'Build the depot';

  @override
  String get decisionGreenFundOptionB => 'Not now';

  @override
  String decisionFloodTitle(String district) {
    return 'Flash flood in $district!';
  }

  @override
  String decisionFloodBody(String district) {
    return 'Heavy rain turned the streets of $district into rivers. Buses are stuck!';
  }

  @override
  String get decisionFloodOptionA => 'Send pumps and detours';

  @override
  String get decisionFloodOptionB => 'Free rescue shuttles';

  @override
  String get decisionFloodOptionC => 'Wait for the water to drain';

  @override
  String get decisionWindStormTitle => 'Mighty wind storm!';

  @override
  String get decisionWindStormBody =>
      'A legendary Baku wind is blowing away hats, signs and almost our buses!';

  @override
  String get decisionWindStormOptionA => 'Stop service for safety';

  @override
  String get decisionWindStormOptionB => 'Send repair crews';

  @override
  String get decisionWindStormOptionC => 'Keep driving';

  @override
  String get decisionHeatwaveTitle => 'Heatwave: 42°C!';

  @override
  String get decisionHeatwaveBody =>
      'It is so hot the asphalt is melting. Passengers are melting too!';

  @override
  String get decisionHeatwaveOptionA => 'Free water at bus stops';

  @override
  String get decisionHeatwaveOptionB => 'Run only air-conditioned buses';

  @override
  String get decisionHeatwaveOptionC => 'Hope it ends soon';

  @override
  String get decisionEarthquakeTitle => 'Earthquake!';

  @override
  String decisionEarthquakeBody(String district) {
    return 'The ground shook and roads in $district cracked open. Everyone is scared.';
  }

  @override
  String get decisionEarthquakeOptionA => 'Rebuild roads right away';

  @override
  String get decisionEarthquakeOptionB => 'Schedule a repair';

  @override
  String get decisionEarthquakeOptionC => 'Let them wait';

  @override
  String get decisionSnowstormTitle => 'Rare snowstorm!';

  @override
  String get decisionSnowstormBody =>
      'Snow in Baku! Kids are happy, drivers are not. Roads are slippery everywhere.';

  @override
  String get decisionSnowstormOptionA => 'Rent snowplows';

  @override
  String get decisionSnowstormOptionB => 'Clear bus routes only';

  @override
  String get decisionSnowstormOptionC => 'Do nothing';

  @override
  String get decisionHarborFireTitle => 'Fire at the harbor!';

  @override
  String get decisionHarborFireBody =>
      'A warehouse is burning at Oil Harbor. Smoke is drifting over the roads.';

  @override
  String get decisionHarborFireOptionA => 'Close the harbor roads';

  @override
  String get decisionHarborFireOptionB => 'Evacuate workers by bus';

  @override
  String get decisionHarborFireOptionC => 'Keep traffic moving';

  @override
  String get decisionLandslideTitle => 'Landslide in Wind Heights!';

  @override
  String get decisionLandslideBody =>
      'Rocks slid onto the main road of Wind Heights. Traffic is crawling.';

  @override
  String get decisionLandslideOptionA => 'Clear it with heavy machines';

  @override
  String get decisionLandslideOptionB => 'Reroute the buses';

  @override
  String get decisionLandslideOptionC => 'Wait for crews';

  @override
  String get achievementDecisiveTitle => 'Decisive';

  @override
  String get achievementDecisiveDescription => 'Make 25 decisions yourself.';

  @override
  String get achievementStormChaserTitle => 'Storm Chaser';

  @override
  String get achievementStormChaserDescription => 'Handle 5 disasters.';

  @override
  String get careerDecisions => 'Decisions';

  @override
  String get careerDisasters => 'Disasters handled';

  @override
  String get inboxTitle => 'Inbox';

  @override
  String get inboxOpen => 'Open inbox';

  @override
  String get inboxEmpty => 'No news yet. Mr. Bus will keep you posted!';

  @override
  String get timeJustNow => 'just now';

  @override
  String timeMinutesAgo(int minutes) {
    return '$minutes min ago';
  }

  @override
  String timeHoursAgo(int hours) {
    return '$hours h ago';
  }

  @override
  String timeDaysAgo(int days) {
    return '$days d ago';
  }

  @override
  String notificationPromotion(String rank) {
    return 'Promoted to $rank!';
  }

  @override
  String notificationLevelUp(String city, int level, String amount) {
    return '$city reached level $level · +$amount';
  }

  @override
  String notificationProjectIn(String project, String district) {
    return '$project is ready in $district!';
  }

  @override
  String get ledgerRewards => 'Rewards';

  @override
  String get dailyOpen => 'Daily tasks';

  @override
  String get dailyTitle => 'Daily tasks';

  @override
  String get dailyStreakTitle => 'Daily gift';

  @override
  String dailyStreakDay(int day) {
    return 'Day $day of 7';
  }

  @override
  String get dailyStreakDone => 'Come back tomorrow for the next gift!';

  @override
  String get dailyClaim => 'Claim';

  @override
  String get dailyClaimed => 'Claimed';

  @override
  String get dailyComeBack => 'New tasks every day at midnight';

  @override
  String dailyReward(String money, int xp) {
    return '+$money · +$xp XP';
  }

  @override
  String dailyProgress(String progress, String target) {
    return '$progress / $target';
  }

  @override
  String taskBuyBuses(int count) {
    return 'Buy $count buses';
  }

  @override
  String taskMakeDecisions(int count) {
    return 'Make $count decisions';
  }

  @override
  String taskRunMinutes(int count) {
    return 'Run the city for $count minutes';
  }

  @override
  String taskEarnTickets(String amount) {
    return 'Earn $amount from tickets';
  }

  @override
  String get taskFinishProject => 'Finish a construction project';

  @override
  String get taskRepairRoad => 'Repair a road';

  @override
  String taskReachSatisfaction(int percent) {
    return 'Reach $percent% satisfaction';
  }

  @override
  String get tutorialNext => 'Next';

  @override
  String get tutorialSkip => 'Skip';

  @override
  String get tutorialFinish => 'Let\'s go!';

  @override
  String get tutorialWelcomeTitle => 'Hi Minister!';

  @override
  String get tutorialWelcome =>
      'I\'m Mr. Bus, your transport advisor. Let me show you Baku in 30 seconds!';

  @override
  String get tutorialBudget =>
      'This is your budget. It starts empty: the Cabinet pays you every second while you are on this map, more when people are happy. Fuel, wages and repairs drain it.';

  @override
  String get tutorialMood =>
      'This face shows how happy citizens are. If it stays under 30%, or traffic jams the city, the President fires you!';

  @override
  String tutorialDistrict(String district) {
    return 'People in $district wait the longest. Find it on the map and tap it!';
  }

  @override
  String tutorialBuyBus(String amount) {
    return 'The Cabinet sent $amount to get you started. Pick a bus and tap Sign!';
  }

  @override
  String get tutorialBusBought =>
      'Your bus arrives in a few seconds. Faster service means happier citizens and more money!';

  @override
  String tutorialLevel(int percent) {
    return 'Reach level 10, unlock every technology and make people $percent% happy to complete Baku!';
  }

  @override
  String get tutorialNews =>
      'When I wave here, I have news: requests, offers and disasters. You decide!';

  @override
  String get tutorialTasks => 'Daily tasks and a daily gift bring extra money every day.';

  @override
  String get tutorialDiplomacy =>
      'This is diplomacy. Spend money on gestures people love and they pay you back in points for new technology.';

  @override
  String get tutorialProfile =>
      'Climb nine ranks and collect achievements and city badges. Good luck, Minister!';

  @override
  String get ledgerTechnology => 'Technology contracts';

  @override
  String get rejectLocked => 'Unlock it in Technology first';

  @override
  String get rejectInsufficientDiplomacy => 'Not enough diplomacy points';

  @override
  String get rejectAlreadyUnlocked => 'Already unlocked';

  @override
  String eventTechnologyUnlocked(String technology) {
    return 'Contract signed: $technology!';
  }

  @override
  String effectMaintenanceCost(String change) {
    return 'Bus repairs $change';
  }

  @override
  String diplomacyAmount(int amount) {
    return '+$amount';
  }

  @override
  String get diplomacyOpen => 'Open diplomacy';

  @override
  String get settingsOpen => 'Open settings';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsAbout => 'About';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get diplomacyTitle => 'Diplomacy';

  @override
  String get diplomacyIntro =>
      'Gestures people love cost money, but citizens pay you back in diplomacy points. Spend the points on new technology.';

  @override
  String get diplomacyTechnologyBody =>
      'Spend diplomacy points on new buses, upgrades and the metro.';

  @override
  String get diplomacyOpenTechnology => 'Open technology';

  @override
  String diplomacyTechnologyReady(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count technologies ready',
      one: '1 technology ready',
    );
    return '$_temp0';
  }

  @override
  String get diplomacyActionsTitle => 'Win people over';

  @override
  String diplomacyGain(int points) {
    return '+$points diplomacy';
  }

  @override
  String diplomacyXp(int xp) {
    return '+$xp XP';
  }

  @override
  String diplomacyAct(String cost) {
    return 'Do it · $cost';
  }

  @override
  String diplomacyReadyIn(String time) {
    return 'Ready in $time';
  }

  @override
  String get actionCheaperTickets => 'Cheaper tickets';

  @override
  String get actionCheaperTicketsBody =>
      'Pay part of every fare for a while. Passengers love it and more people ride.';

  @override
  String get actionHackathon => 'Transport hackathon';

  @override
  String get actionHackathonBody =>
      'Invite young coders to fix city transport. Smart ideas bring in more ticket money.';

  @override
  String get actionDriverRaise => 'Raise bus driver pay';

  @override
  String get actionDriverRaiseBody => 'Drivers work happier, but wages cost more for a while.';

  @override
  String get actionShopTaxBreak => 'Tax break for shops';

  @override
  String get actionShopTaxBreakBody =>
      'Lower taxes for shops along the bus routes. Businesses and deliveries cheer.';

  @override
  String get actionCleanAir => 'Clean air campaign';

  @override
  String get actionCleanAirBody =>
      'Plant trees and wash the buses. Greener streets make many people smile.';

  @override
  String get actionCityFestival => 'City festival';

  @override
  String get actionCityFestivalBody =>
      'A huge party for the whole city. Everyone smiles, but the streets get crowded for a while.';

  @override
  String decisionDiplomacyEarned(int amount) {
    return 'Citizens appreciate it: +$amount diplomacy points!';
  }

  @override
  String get technologyTitle => 'Technology';

  @override
  String get technologyIntro =>
      'Happy citizens and wise decisions earn diplomacy points. Spend them with money to sign contracts and unlock new technology!';

  @override
  String get technologyUnlock => 'Unlock';

  @override
  String get technologyUnlocked => 'Unlocked';

  @override
  String technologyRequires(String technology) {
    return 'Needs $technology';
  }

  @override
  String get branchBuses => 'Bus contracts';

  @override
  String get branchUpgrades => 'Bus upgrades';

  @override
  String get branchMetro => 'Metro';

  @override
  String get branchOperations => 'Operations';

  @override
  String get techMinibusContractName => 'Hop Mini contract';

  @override
  String get techMinibusContractDescription =>
      'Nimble 28-seat minibuses from Silkway Motors. Cheap and great for narrow streets.';

  @override
  String get techArticulatedContractName => 'MegaLink contract';

  @override
  String get techArticulatedContractDescription =>
      'Bendy 150-seat buses for the busiest districts.';

  @override
  String get techElectricContractName => 'Volta E-12 contract';

  @override
  String get techElectricContractDescription =>
      'Silent electric buses with zero emissions. Needs a charging depot.';

  @override
  String get techEngineTuningName => 'Engine tuning';

  @override
  String get techEngineTuningDescription =>
      'Unlocks bus level 2: more reliable buses and cheaper repairs.';

  @override
  String get techBiggerCabinsName => 'Bigger cabins';

  @override
  String get techBiggerCabinsDescription => 'Unlocks bus level 3: 15% more seats.';

  @override
  String get techComfortKitName => 'Comfort kit';

  @override
  String get techComfortKitDescription =>
      'Unlocks bus level 4: air-con and soft seats passengers love.';

  @override
  String get techSmartBusesName => 'Smart buses';

  @override
  String get techSmartBusesDescription =>
      'Unlocks bus level 5: efficient engines and cleaner exhaust.';

  @override
  String get techMetroStudyName => 'Metro study';

  @override
  String get techMetroStudyDescription => 'Engineers survey the ground for an underground railway.';

  @override
  String get techMetroContractName => 'Metro contract';

  @override
  String get techMetroContractDescription => 'Unlocks metro lines between neighbouring districts.';

  @override
  String get techMetroAutomationName => 'Driverless metro';

  @override
  String get techMetroAutomationDescription =>
      'Driverless trains run more often and cost less to run.';

  @override
  String get techSmartTicketingName => 'Smart ticketing';

  @override
  String get techSmartTicketingDescription =>
      'Contactless cards stop fare dodging. Ticket income +8% forever.';

  @override
  String get techEcoDrivingName => 'Eco-driving academy';

  @override
  String get techEcoDrivingDescription => 'Trained drivers use 10% less fuel and power.';

  @override
  String get techDepotRoboticsName => 'Depot robotics';

  @override
  String get techDepotRoboticsDescription =>
      'Robots help the mechanics. Bus repairs cost 15% less.';

  @override
  String get achievementInnovatorTitle => 'Innovator';

  @override
  String get achievementInnovatorDescription => 'Unlock 5 technologies.';

  @override
  String get tabBuses => 'Buses';

  @override
  String get tabBuild => 'Build';

  @override
  String get tabMetro => 'Metro';

  @override
  String get contractsTitle => 'Sign a contract';

  @override
  String contractSign(String price) {
    return 'Sign · $price';
  }

  @override
  String get contractOpenTechnology => 'Technology';

  @override
  String get contractFewer => 'Fewer buses';

  @override
  String get contractMore => 'More buses';

  @override
  String busSeats(int count) {
    return '$count seats';
  }

  @override
  String busRunningCost(String amount) {
    return '$amount/s';
  }

  @override
  String busComfort(int value) {
    return 'Comfort $value';
  }

  @override
  String get ecoZero => 'Zero emissions';

  @override
  String get ecoLow => 'Low emissions';

  @override
  String get ecoMedium => 'Medium emissions';

  @override
  String get ecoHigh => 'High emissions';

  @override
  String get fleetHereTitle => 'Buses here';

  @override
  String get fleetEmpty => 'No buses here yet. Sign a contract above!';

  @override
  String fleetGroup(int count, String model) {
    return '$count × $model';
  }

  @override
  String fleetLevel(int level, int percent) {
    return 'Level $level · Reliability $percent%';
  }

  @override
  String fleetUpgrade(String price) {
    return 'Upgrade · $price';
  }

  @override
  String fleetSell(String price) {
    return 'Sell · +$price';
  }

  @override
  String get fleetMaxLevel => 'Max level';

  @override
  String fleetMoveHere(String district) {
    return 'Bring a bus from $district';
  }

  @override
  String depotSpace(int used, int capacity) {
    return 'Depot $used/$capacity';
  }

  @override
  String fleetOnOrder(int count) {
    return '+$count coming';
  }

  @override
  String buildDistrictTitle(String district) {
    return 'Build in $district';
  }

  @override
  String get buildCityTitle => 'City-wide';

  @override
  String buildAction(String price) {
    return 'Build · $price';
  }

  @override
  String timeSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String timeMinutes(int minutes) {
    return '${minutes}m';
  }

  @override
  String timeMinutesSeconds(int minutes, int seconds) {
    return '${minutes}m ${seconds}s';
  }

  @override
  String timeHoursMinutes(int hours, int minutes) {
    return '${hours}h ${minutes}m';
  }

  @override
  String get buildDone => 'Built';

  @override
  String get buildRoadFine => 'Road is in great shape';

  @override
  String buildTimeLeft(String time) {
    return '$time left';
  }

  @override
  String get projectRoadRepairInfo => 'Patch every pothole and bring the road back to 100%.';

  @override
  String get projectRoadExpansionInfo => 'Add lanes so traffic flows better for good.';

  @override
  String get projectBikeLanesInfo => 'A short jam while building, then fewer cars and cleaner air.';

  @override
  String get projectSmartSignalsInfo => 'Traffic lights that adapt to the traffic.';

  @override
  String get projectModernStopsInfo => 'Shelters, screens and benches at every stop.';

  @override
  String get projectCityParkInfo =>
      'Trees, paths and playgrounds. People walk and cycle more for short trips.';

  @override
  String get projectParkAndRideInfo =>
      'A big car park by the bus stops. Drivers leave the car and hop on a bus.';

  @override
  String get projectChargingDepotInfo => 'Power for electric buses.';

  @override
  String get projectDepotExpansionInfo => 'Room for 20 more buses.';

  @override
  String get chipRoadFull => 'Road 100%';

  @override
  String get chipDriversHappier => 'Drivers happier';

  @override
  String get chipSafer => 'Safer streets';

  @override
  String get chipTrafficDown => 'Less traffic';

  @override
  String get chipJams => 'Jams while building';

  @override
  String get chipCyclists => 'Cyclists love it';

  @override
  String get chipCleanAir => 'Cleaner air';

  @override
  String get chipCoverage => 'Coverage +10%';

  @override
  String get chipPassengersHappier => 'Passengers happier';

  @override
  String get chipWalkersHappier => 'Walkers happier';

  @override
  String get chipMoreRiders => 'More bus riders';

  @override
  String get chipElectric => 'Needed for Volta E-12';

  @override
  String get chipDepot => 'Depot +20 buses';

  @override
  String get ledgerMetro => 'Metro';

  @override
  String get rejectTunnelBusy => 'The tunnel crew is busy digging another line';

  @override
  String get rejectCoolingDown => 'Not ready yet';

  @override
  String eventMetroOpened(String from, String to) {
    return 'Metro $from ⇄ $to is open!';
  }

  @override
  String get achievementMetroPioneerTitle => 'Metro Pioneer';

  @override
  String get achievementMetroPioneerDescription => 'Open your first metro line.';

  @override
  String metroIntro(String riders, String cost) {
    return 'Each station carries $riders riders a second with no traffic jams. A line costs $cost/s to run.';
  }

  @override
  String get metroTeaser => 'Dig tunnels to the neighbours: lots of riders and no traffic jams.';

  @override
  String metroLinesTitle(String district) {
    return 'Lines from $district';
  }

  @override
  String metroLineTo(String district) {
    return 'To $district';
  }

  @override
  String get metroOpen => 'Open';

  @override
  String metroDig(String price) {
    return 'Dig · $price';
  }

  @override
  String metroWaitingThere(int minutes) {
    return 'Waiting there: $minutes min';
  }

  @override
  String levelBarGoal(int done, int total) {
    return 'Goal $done/$total';
  }

  @override
  String get levelBarComplete => 'Complete';

  @override
  String get goalTitle => 'City goal';

  @override
  String goalLevel(int level) {
    return 'Reach level $level';
  }

  @override
  String goalLevelProgress(int level, int target) {
    return 'Level $level/$target';
  }

  @override
  String get goalTechnologies => 'Unlock every technology';

  @override
  String goalTechnologyProgress(int count, int total) {
    return '$count/$total';
  }

  @override
  String goalHappiness(int percent) {
    return 'Make citizens $percent% happy';
  }

  @override
  String goalHappinessProgress(int percent) {
    return '$percent%';
  }

  @override
  String goalUnlocks(String city, String next) {
    return 'Complete $city to unlock $next.';
  }

  @override
  String cityCompleteTitle(String city) {
    return '$city is complete!';
  }

  @override
  String get cityCompleteBody =>
      'Every technology is yours and citizens love their city. New cities are coming soon!';
}
