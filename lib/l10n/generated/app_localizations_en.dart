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
  String get cityStatusLocked => 'Locked';

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
  String hudDay(int day) {
    return 'Day $day';
  }

  @override
  String hudSatisfaction(int value) {
    return '$value%';
  }

  @override
  String get hudBudgetLabel => 'Budget';

  @override
  String get hudSatisfactionLabel => 'Satisfaction';

  @override
  String get hudBackToCities => 'Cities';

  @override
  String get crisisAngry => 'Citizens are getting angry. Act before the President notices!';

  @override
  String crisisWarning(int level) {
    return 'President\'s warning $level/3: raise satisfaction or fix the budget!';
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
    return 'Buses can carry $capacity of $demand riders a day';
  }

  @override
  String get districtFeatureBikeLanes => 'Bike lanes';

  @override
  String get districtFeatureSignals => 'Smart lights';

  @override
  String get districtFeatureStops => 'Modern stops';

  @override
  String districtDaysLeft(String project, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days left',
      one: '1 day left',
    );
    return '$project: $_temp0';
  }

  @override
  String actionAddBus(String price) {
    return 'Add bus · $price';
  }

  @override
  String actionRepairRoad(String price) {
    return 'Repair road · $price';
  }

  @override
  String get reportTitle => 'Yesterday\'s money';

  @override
  String get reportEmpty => 'Your first day is underway. Reports arrive every minute.';

  @override
  String reportNet(String amount) {
    return 'Net $amount';
  }

  @override
  String get reportSeeAll => 'See all';

  @override
  String reportSheetTitle(int day) {
    return 'Day $day budget';
  }

  @override
  String reportBudgetAfter(String amount) {
    return 'Budget after the day: $amount';
  }

  @override
  String get ledgerTickets => 'Ticket sales';

  @override
  String get ledgerSubsidy => 'Daily subsidy';

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
  String get eventBusPurchased => 'Bus ordered! It joins the fleet tomorrow.';

  @override
  String eventBusUpgraded(int level) {
    return 'Bus upgraded to level $level';
  }

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
  String eventProjectStarted(String project) {
    return '$project: construction started';
  }

  @override
  String eventProjectCompleted(String project) {
    return '$project is ready!';
  }

  @override
  String eventBudgetAllocated(String amount) {
    return 'The Cabinet sent $amount for this month';
  }

  @override
  String get eventLoanRepaid => 'Loan fully repaid';

  @override
  String eventCrisisWarning(int level) {
    return 'President\'s warning $level/3';
  }

  @override
  String get awayTitle => 'While you were away';

  @override
  String awayDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days passed in Baku',
      one: '1 day passed in Baku',
    );
    return '$_temp0';
  }

  @override
  String get awayCapped => 'The city paused after a week to wait for you.';

  @override
  String get awayBudget => 'Budget';

  @override
  String get awaySatisfaction => 'Satisfaction';

  @override
  String get awayBusesDelivered => 'Buses delivered';

  @override
  String get awayProjectsCompleted => 'Projects finished';

  @override
  String get awayContinue => 'Let\'s go!';

  @override
  String get dismissedTitle => 'You have been dismissed';

  @override
  String get dismissedBody =>
      'Baku lost faith in your leadership. Your rank and achievements stay with you. Try again with a fresh start!';

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
  String get trafficSmooth => 'Smooth';

  @override
  String get trafficBusy => 'Busy';

  @override
  String get trafficJammed => 'Jam';

  @override
  String get mrBusName => 'Mr. Bus';

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
  String cityLockedBody(int level, String city) {
    return 'Reach level $level in $city to unlock it.';
  }

  @override
  String cityRequirement(int level, String city) {
    return 'Lv $level in $city';
  }

  @override
  String get cityStatusUnlocked => 'Unlocked';

  @override
  String cityLevelChip(int level, int target) {
    return 'Level $level · Target $target';
  }

  @override
  String get ledgerLevelRewards => 'Level rewards';

  @override
  String eventCityLeveledUp(int level, String amount) {
    return 'City level $level! Reward $amount';
  }

  @override
  String levelBarLabel(int level) {
    return 'Level $level';
  }

  @override
  String levelBarPoints(int points, int next) {
    return '$points / $next DP';
  }

  @override
  String get levelBarMax => 'Max level reached';

  @override
  String levelBarTarget(int target) {
    return 'Target $target';
  }

  @override
  String levelSheetTitle(String city) {
    return '$city development';
  }

  @override
  String get levelSheetBody =>
      'Earn development points (DP) every day by keeping citizens happy and the budget positive. New buses, upgrades and finished projects give extra DP. Each level pays a reward from the Cabinet.';

  @override
  String levelSheetTarget(int target, String city) {
    return 'Reach level $target to unlock $city!';
  }

  @override
  String get levelSheetTargetDone => 'Target reached! Your next city is unlocked.';

  @override
  String levelUpTitle(String city, int level) {
    return '$city reached level $level!';
  }

  @override
  String levelUpReward(String amount) {
    return 'The Cabinet sends a bonus of $amount.';
  }

  @override
  String levelUpUnlocked(String city) {
    return '$city is unlocked! It opens soon.';
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
  String profileNextRank(String rank, int reputation) {
    return 'Next: $rank · needs $reputation% reputation';
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
  String get careerDays => 'Days served';

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
      'Keep a positive daily budget for 30 days in a row.';

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
  String get achievementCityChampionDescription => 'Reach a city\'s target level.';

  @override
  String get achievementSurvivorTitle => 'Survivor';

  @override
  String get achievementSurvivorDescription => 'Recover after a President\'s warning.';

  @override
  String get achievementVeteranMinisterTitle => 'Veteran Minister';

  @override
  String get achievementVeteranMinisterDescription => 'Serve 365 days.';

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
  String decisionDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days left',
      one: '1 day left',
      zero: 'Decide today',
    );
    return '$_temp0';
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
  String effectDailyCost(String amount) {
    return 'Costs $amount/day';
  }

  @override
  String effectDailyIncome(String amount) {
    return 'Income $amount/day';
  }

  @override
  String effectMoodTrend(String group, String change) {
    return '$group mood $change';
  }

  @override
  String effectDays(int days) {
    return '${days}d';
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
  String effectMoney(String amount) {
    return '$amount';
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
  String get decisionOvercrowdedBusesOptionB => 'Extra shifts for 5 days';

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
  String get decisionPotholesOptionA => 'Emergency repair today';

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
  String get decisionDriverWagesOptionA => 'Raise wages 15% forever';

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
      'Diesel got expensive overnight, and our buses drink a lot of it...';

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
    return 'Silkway Motors offers CityRunner buses at 25% off this week. They would start in $district.';
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
}
