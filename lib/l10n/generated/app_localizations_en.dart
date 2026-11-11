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
  String get citySectionComingSoon => 'Coming soon';

  @override
  String get citySectionLocked => 'Locked cities';

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
  String cityLockedBody(String rank) {
    return 'Reach the rank of $rank to unlock this city.';
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
}
