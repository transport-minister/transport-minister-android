import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru'), Locale('tr')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Transport Minister'**
  String get appTitle;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Move the city. Win the people.'**
  String get appTagline;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonGotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get commonGotIt;

  /// No description provided for @splashTitleTop.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get splashTitleTop;

  /// No description provided for @splashTitleBottom.
  ///
  /// In en, this message translates to:
  /// **'Minister'**
  String get splashTitleBottom;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Preparing the city…'**
  String get splashLoading;

  /// No description provided for @citySelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your city'**
  String get citySelectionTitle;

  /// No description provided for @citySelectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Where will you serve as Transport Minister?'**
  String get citySelectionSubtitle;

  /// No description provided for @cityPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get cityPlay;

  /// No description provided for @cityStatusPlayable.
  ///
  /// In en, this message translates to:
  /// **'Playable'**
  String get cityStatusPlayable;

  /// No description provided for @cityStatusComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get cityStatusComingSoon;

  /// No description provided for @cityComingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'{city} is on its way!'**
  String cityComingSoonTitle(String city);

  /// No description provided for @cityComingSoonBody.
  ///
  /// In en, this message translates to:
  /// **'We are still drawing its streets and timetables. Grow your career in Baku meanwhile.'**
  String get cityComingSoonBody;

  /// No description provided for @cityLockedTitle.
  ///
  /// In en, this message translates to:
  /// **'{city} is locked'**
  String cityLockedTitle(String city);

  /// No description provided for @cityFeatureBuses.
  ///
  /// In en, this message translates to:
  /// **'Buses'**
  String get cityFeatureBuses;

  /// No description provided for @cityFeatureRoads.
  ///
  /// In en, this message translates to:
  /// **'Roads'**
  String get cityFeatureRoads;

  /// No description provided for @cityFeatureBikeLanes.
  ///
  /// In en, this message translates to:
  /// **'Bike lanes'**
  String get cityFeatureBikeLanes;

  /// No description provided for @cityBakuName.
  ///
  /// In en, this message translates to:
  /// **'Baku'**
  String get cityBakuName;

  /// No description provided for @cityBakuTagline.
  ///
  /// In en, this message translates to:
  /// **'Windy capital on the Caspian Sea'**
  String get cityBakuTagline;

  /// No description provided for @cityIstanbulName.
  ///
  /// In en, this message translates to:
  /// **'Istanbul'**
  String get cityIstanbulName;

  /// No description provided for @cityIstanbulTagline.
  ///
  /// In en, this message translates to:
  /// **'Two continents, one traffic jam'**
  String get cityIstanbulTagline;

  /// No description provided for @cityLondonName.
  ///
  /// In en, this message translates to:
  /// **'London'**
  String get cityLondonName;

  /// No description provided for @cityLondonTagline.
  ///
  /// In en, this message translates to:
  /// **'Double-deckers and rainy rush hours'**
  String get cityLondonTagline;

  /// No description provided for @cityTokyoName.
  ///
  /// In en, this message translates to:
  /// **'Tokyo'**
  String get cityTokyoName;

  /// No description provided for @cityTokyoTagline.
  ///
  /// In en, this message translates to:
  /// **'The busiest stations on Earth'**
  String get cityTokyoTagline;

  /// No description provided for @cityNewYorkName.
  ///
  /// In en, this message translates to:
  /// **'New York'**
  String get cityNewYorkName;

  /// No description provided for @cityNewYorkTagline.
  ///
  /// In en, this message translates to:
  /// **'The city that never parks'**
  String get cityNewYorkTagline;

  /// No description provided for @rankJuniorOfficial.
  ///
  /// In en, this message translates to:
  /// **'Junior Transport Official'**
  String get rankJuniorOfficial;

  /// No description provided for @rankInspector.
  ///
  /// In en, this message translates to:
  /// **'Transport Inspector'**
  String get rankInspector;

  /// No description provided for @rankDirector.
  ///
  /// In en, this message translates to:
  /// **'Transport Director'**
  String get rankDirector;

  /// No description provided for @rankDeputyMinister.
  ///
  /// In en, this message translates to:
  /// **'Deputy Transport Minister'**
  String get rankDeputyMinister;

  /// No description provided for @rankMinister.
  ///
  /// In en, this message translates to:
  /// **'Transport Minister'**
  String get rankMinister;

  /// No description provided for @rankSeniorMinister.
  ///
  /// In en, this message translates to:
  /// **'Senior Transport Minister'**
  String get rankSeniorMinister;

  /// No description provided for @rankRegionalGovernor.
  ///
  /// In en, this message translates to:
  /// **'Regional Transport Governor'**
  String get rankRegionalGovernor;

  /// No description provided for @rankNationalLeader.
  ///
  /// In en, this message translates to:
  /// **'National Infrastructure Leader'**
  String get rankNationalLeader;

  /// No description provided for @rankInternationalAuthority.
  ///
  /// In en, this message translates to:
  /// **'International Transport Authority'**
  String get rankInternationalAuthority;

  /// No description provided for @districtOldFortress.
  ///
  /// In en, this message translates to:
  /// **'Old Fortress'**
  String get districtOldFortress;

  /// No description provided for @districtSeasideBoulevard.
  ///
  /// In en, this message translates to:
  /// **'Seaside Boulevard'**
  String get districtSeasideBoulevard;

  /// No description provided for @districtFlameHills.
  ///
  /// In en, this message translates to:
  /// **'Flame Hills'**
  String get districtFlameHills;

  /// No description provided for @districtOilHarbor.
  ///
  /// In en, this message translates to:
  /// **'Oil Harbor'**
  String get districtOilHarbor;

  /// No description provided for @districtWindHeights.
  ///
  /// In en, this message translates to:
  /// **'Wind Heights'**
  String get districtWindHeights;

  /// No description provided for @districtCaspianGardens.
  ///
  /// In en, this message translates to:
  /// **'Caspian Gardens'**
  String get districtCaspianGardens;

  /// No description provided for @districtOldFortressTagline.
  ///
  /// In en, this message translates to:
  /// **'Narrow lanes, ancient walls, crowds of tourists'**
  String get districtOldFortressTagline;

  /// No description provided for @districtSeasideBoulevardTagline.
  ///
  /// In en, this message translates to:
  /// **'Promenade by the sea, loved by walkers'**
  String get districtSeasideBoulevardTagline;

  /// No description provided for @districtFlameHillsTagline.
  ///
  /// In en, this message translates to:
  /// **'Glass towers and busy offices'**
  String get districtFlameHillsTagline;

  /// No description provided for @districtOilHarborTagline.
  ///
  /// In en, this message translates to:
  /// **'Cranes, trucks and the city\'s cargo gate'**
  String get districtOilHarborTagline;

  /// No description provided for @districtWindHeightsTagline.
  ///
  /// In en, this message translates to:
  /// **'The biggest neighbourhood on the windy hills'**
  String get districtWindHeightsTagline;

  /// No description provided for @districtCaspianGardensTagline.
  ///
  /// In en, this message translates to:
  /// **'New homes growing fast by the shore'**
  String get districtCaspianGardensTagline;

  /// No description provided for @hudSatisfaction.
  ///
  /// In en, this message translates to:
  /// **'{value}%'**
  String hudSatisfaction(int value);

  /// No description provided for @hudBudgetLabel.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get hudBudgetLabel;

  /// No description provided for @hudDiplomacyLabel.
  ///
  /// In en, this message translates to:
  /// **'Diplomacy points'**
  String get hudDiplomacyLabel;

  /// No description provided for @diamondsLabel.
  ///
  /// In en, this message translates to:
  /// **'Diamonds'**
  String get diamondsLabel;

  /// No description provided for @diamondsPlus.
  ///
  /// In en, this message translates to:
  /// **'+{count}'**
  String diamondsPlus(int count);

  /// No description provided for @diamondsBody.
  ///
  /// In en, this message translates to:
  /// **'Rare gems for ministers in a hurry. Spend them to finish building instantly, skip waiting or survive a dismissal.'**
  String get diamondsBody;

  /// No description provided for @diamondsEarnTitle.
  ///
  /// In en, this message translates to:
  /// **'How to earn them'**
  String get diamondsEarnTitle;

  /// No description provided for @diamondsEarnLevel.
  ///
  /// In en, this message translates to:
  /// **'+{count} for every city level'**
  String diamondsEarnLevel(int count);

  /// No description provided for @diamondsEarnAchievement.
  ///
  /// In en, this message translates to:
  /// **'+{count} for every achievement'**
  String diamondsEarnAchievement(int count);

  /// No description provided for @diamondsEarnStreak.
  ///
  /// In en, this message translates to:
  /// **'+{count} on day 7 of the daily gift'**
  String diamondsEarnStreak(int count);

  /// No description provided for @diamondsEarnCity.
  ///
  /// In en, this message translates to:
  /// **'+{count} for completing a city'**
  String diamondsEarnCity(int count);

  /// No description provided for @diamondsSpendTitle.
  ///
  /// In en, this message translates to:
  /// **'Spend them'**
  String get diamondsSpendTitle;

  /// No description provided for @boostFinishNow.
  ///
  /// In en, this message translates to:
  /// **'Finish now'**
  String get boostFinishNow;

  /// No description provided for @boostDeliverNow.
  ///
  /// In en, this message translates to:
  /// **'Deliver now'**
  String get boostDeliverNow;

  /// No description provided for @boostReadyNow.
  ///
  /// In en, this message translates to:
  /// **'Ready now'**
  String get boostReadyNow;

  /// No description provided for @boostContinue.
  ///
  /// In en, this message translates to:
  /// **'Keep my seat'**
  String get boostContinue;

  /// No description provided for @boostDouble.
  ///
  /// In en, this message translates to:
  /// **'Double earnings for 10 min'**
  String get boostDouble;

  /// No description provided for @boostDoubleActive.
  ///
  /// In en, this message translates to:
  /// **'2x earnings · {time}'**
  String boostDoubleActive(String time);

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, Minister!'**
  String get welcomeTitle;

  /// No description provided for @welcomeBody.
  ///
  /// In en, this message translates to:
  /// **'While you were away for {time}, {city} kept earning.'**
  String welcomeBody(String time, String city);

  /// No description provided for @welcomeCollect.
  ///
  /// In en, this message translates to:
  /// **'Collect {amount}'**
  String welcomeCollect(String amount);

  /// No description provided for @welcomeCollectDouble.
  ///
  /// In en, this message translates to:
  /// **'Collect {amount} · watch a video'**
  String welcomeCollectDouble(String amount);

  /// No description provided for @hudSatisfactionLabel.
  ///
  /// In en, this message translates to:
  /// **'Satisfaction'**
  String get hudSatisfactionLabel;

  /// No description provided for @hudIncomeLabel.
  ///
  /// In en, this message translates to:
  /// **'Earnings per second'**
  String get hudIncomeLabel;

  /// No description provided for @hudPopulationLabel.
  ///
  /// In en, this message translates to:
  /// **'Residents'**
  String get hudPopulationLabel;

  /// No description provided for @statIncome.
  ///
  /// In en, this message translates to:
  /// **'{amount}/s'**
  String statIncome(String amount);

  /// No description provided for @hudBackToCities.
  ///
  /// In en, this message translates to:
  /// **'Cities'**
  String get hudBackToCities;

  /// No description provided for @crisisGridlock.
  ///
  /// In en, this message translates to:
  /// **'Gridlock! Traffic is jamming the city. Clear it before the President notices!'**
  String get crisisGridlock;

  /// No description provided for @crisisAngry.
  ///
  /// In en, this message translates to:
  /// **'Citizens are getting angry. Act before the President notices!'**
  String get crisisAngry;

  /// No description provided for @crisisDebt.
  ///
  /// In en, this message translates to:
  /// **'The budget is deep in the red. Fix it before the President notices!'**
  String get crisisDebt;

  /// No description provided for @crisisWarningGridlock.
  ///
  /// In en, this message translates to:
  /// **'President\'s warning {level}/3: clear the traffic!'**
  String crisisWarningGridlock(int level);

  /// No description provided for @crisisWarningUnhappy.
  ///
  /// In en, this message translates to:
  /// **'President\'s warning {level}/3: make citizens happier!'**
  String crisisWarningUnhappy(int level);

  /// No description provided for @crisisWarningDebt.
  ///
  /// In en, this message translates to:
  /// **'President\'s warning {level}/3: fix the budget!'**
  String crisisWarningDebt(int level);

  /// No description provided for @statWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting'**
  String get statWaiting;

  /// No description provided for @statCongestion.
  ///
  /// In en, this message translates to:
  /// **'Traffic'**
  String get statCongestion;

  /// No description provided for @statRoad.
  ///
  /// In en, this message translates to:
  /// **'Road'**
  String get statRoad;

  /// No description provided for @statBuses.
  ///
  /// In en, this message translates to:
  /// **'Buses'**
  String get statBuses;

  /// No description provided for @statMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String statMinutes(int minutes);

  /// No description provided for @statPercent.
  ///
  /// In en, this message translates to:
  /// **'{value}%'**
  String statPercent(int value);

  /// No description provided for @districtRidersServed.
  ///
  /// In en, this message translates to:
  /// **'Carries {capacity} of {demand} riders a second'**
  String districtRidersServed(String capacity, String demand);

  /// No description provided for @districtResidents.
  ///
  /// In en, this message translates to:
  /// **'{count} residents · +{growth}/s'**
  String districtResidents(String count, String growth);

  /// No description provided for @ledgerTickets.
  ///
  /// In en, this message translates to:
  /// **'Ticket sales'**
  String get ledgerTickets;

  /// No description provided for @ledgerSubsidy.
  ///
  /// In en, this message translates to:
  /// **'Subsidy'**
  String get ledgerSubsidy;

  /// No description provided for @ledgerGovernmentBudget.
  ///
  /// In en, this message translates to:
  /// **'Cabinet budget'**
  String get ledgerGovernmentBudget;

  /// No description provided for @ledgerVehicleSales.
  ///
  /// In en, this message translates to:
  /// **'Bus sales'**
  String get ledgerVehicleSales;

  /// No description provided for @ledgerLoanReceived.
  ///
  /// In en, this message translates to:
  /// **'Loan'**
  String get ledgerLoanReceived;

  /// No description provided for @ledgerEnergy.
  ///
  /// In en, this message translates to:
  /// **'Fuel & power'**
  String get ledgerEnergy;

  /// No description provided for @ledgerSalaries.
  ///
  /// In en, this message translates to:
  /// **'Driver wages'**
  String get ledgerSalaries;

  /// No description provided for @ledgerVehicleMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Bus repairs'**
  String get ledgerVehicleMaintenance;

  /// No description provided for @ledgerRoadMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Road upkeep'**
  String get ledgerRoadMaintenance;

  /// No description provided for @ledgerAdministration.
  ///
  /// In en, this message translates to:
  /// **'Ministry office'**
  String get ledgerAdministration;

  /// No description provided for @ledgerLoanRepayment.
  ///
  /// In en, this message translates to:
  /// **'Loan repayment'**
  String get ledgerLoanRepayment;

  /// No description provided for @ledgerVehiclePurchases.
  ///
  /// In en, this message translates to:
  /// **'New buses'**
  String get ledgerVehiclePurchases;

  /// No description provided for @ledgerVehicleUpgrades.
  ///
  /// In en, this message translates to:
  /// **'Bus upgrades'**
  String get ledgerVehicleUpgrades;

  /// No description provided for @ledgerConstruction.
  ///
  /// In en, this message translates to:
  /// **'Construction'**
  String get ledgerConstruction;

  /// No description provided for @projectRoadRepair.
  ///
  /// In en, this message translates to:
  /// **'Road repair'**
  String get projectRoadRepair;

  /// No description provided for @projectRoadExpansion.
  ///
  /// In en, this message translates to:
  /// **'Road widening'**
  String get projectRoadExpansion;

  /// No description provided for @projectBikeLanes.
  ///
  /// In en, this message translates to:
  /// **'Bike lanes'**
  String get projectBikeLanes;

  /// No description provided for @projectSmartSignals.
  ///
  /// In en, this message translates to:
  /// **'Smart traffic lights'**
  String get projectSmartSignals;

  /// No description provided for @projectModernStops.
  ///
  /// In en, this message translates to:
  /// **'Modern bus stops'**
  String get projectModernStops;

  /// No description provided for @projectCityPark.
  ///
  /// In en, this message translates to:
  /// **'City park'**
  String get projectCityPark;

  /// No description provided for @projectParkAndRide.
  ///
  /// In en, this message translates to:
  /// **'Park & Ride'**
  String get projectParkAndRide;

  /// No description provided for @projectChargingDepot.
  ///
  /// In en, this message translates to:
  /// **'Charging depot'**
  String get projectChargingDepot;

  /// No description provided for @projectDepotExpansion.
  ///
  /// In en, this message translates to:
  /// **'Depot expansion'**
  String get projectDepotExpansion;

  /// No description provided for @rejectInsufficientFunds.
  ///
  /// In en, this message translates to:
  /// **'Not enough budget for that'**
  String get rejectInsufficientFunds;

  /// No description provided for @rejectDepotFull.
  ///
  /// In en, this message translates to:
  /// **'The bus depot is full'**
  String get rejectDepotFull;

  /// No description provided for @rejectMaxLevel.
  ///
  /// In en, this message translates to:
  /// **'Already at the highest level'**
  String get rejectMaxLevel;

  /// No description provided for @rejectProjectLimit.
  ///
  /// In en, this message translates to:
  /// **'Too many construction sites at once'**
  String get rejectProjectLimit;

  /// No description provided for @rejectAlreadyInProgress.
  ///
  /// In en, this message translates to:
  /// **'Work is already underway here'**
  String get rejectAlreadyInProgress;

  /// No description provided for @rejectAlreadyBuilt.
  ///
  /// In en, this message translates to:
  /// **'That is already built'**
  String get rejectAlreadyBuilt;

  /// No description provided for @rejectRequiresChargingDepot.
  ///
  /// In en, this message translates to:
  /// **'Build a charging depot first'**
  String get rejectRequiresChargingDepot;

  /// No description provided for @rejectInvalidTarget.
  ///
  /// In en, this message translates to:
  /// **'That is not possible right now'**
  String get rejectInvalidTarget;

  /// No description provided for @rejectLoanActive.
  ///
  /// In en, this message translates to:
  /// **'Repay your current loan first'**
  String get rejectLoanActive;

  /// No description provided for @rejectFareOutOfRange.
  ///
  /// In en, this message translates to:
  /// **'That fare is not allowed'**
  String get rejectFareOutOfRange;

  /// No description provided for @eventBusesDelivered.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{A new bus joined the fleet} other{{count} new buses joined the fleet}}'**
  String eventBusesDelivered(int count);

  /// No description provided for @eventProjectCompleted.
  ///
  /// In en, this message translates to:
  /// **'{project} is ready!'**
  String eventProjectCompleted(String project);

  /// No description provided for @eventBudgetAllocated.
  ///
  /// In en, this message translates to:
  /// **'The Cabinet sent {amount}'**
  String eventBudgetAllocated(String amount);

  /// No description provided for @eventCrisisWarning.
  ///
  /// In en, this message translates to:
  /// **'President\'s warning {level}/3'**
  String eventCrisisWarning(int level);

  /// No description provided for @dismissedTitle.
  ///
  /// In en, this message translates to:
  /// **'You have been dismissed'**
  String get dismissedTitle;

  /// No description provided for @dismissedBody.
  ///
  /// In en, this message translates to:
  /// **'{reason} Your rank and achievements stay with you. Try again with a fresh start!'**
  String dismissedBody(String reason);

  /// No description provided for @dismissedGridlock.
  ///
  /// In en, this message translates to:
  /// **'Endless traffic jams paralysed Baku.'**
  String get dismissedGridlock;

  /// No description provided for @dismissedUnhappy.
  ///
  /// In en, this message translates to:
  /// **'Baku lost faith in your leadership.'**
  String get dismissedUnhappy;

  /// No description provided for @dismissedDebt.
  ///
  /// In en, this message translates to:
  /// **'Baku ran out of money.'**
  String get dismissedDebt;

  /// No description provided for @dismissedRestart.
  ///
  /// In en, this message translates to:
  /// **'Start over'**
  String get dismissedRestart;

  /// No description provided for @dismissedContinueHint.
  ///
  /// In en, this message translates to:
  /// **'Spend {count} diamonds and the President gives you one more chance.'**
  String dismissedContinueHint(int count);

  /// No description provided for @loadingCity.
  ///
  /// In en, this message translates to:
  /// **'Opening the city…'**
  String get loadingCity;

  /// No description provided for @loadingFailed.
  ///
  /// In en, this message translates to:
  /// **'The city could not be opened.'**
  String get loadingFailed;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// No description provided for @mapRecenter.
  ///
  /// In en, this message translates to:
  /// **'Recenter map'**
  String get mapRecenter;

  /// No description provided for @advisorTitle.
  ///
  /// In en, this message translates to:
  /// **'Mr. Bus says'**
  String get advisorTitle;

  /// No description provided for @advisorShowMe.
  ///
  /// In en, this message translates to:
  /// **'Show me'**
  String get advisorShowMe;

  /// No description provided for @tipNegativeBudget.
  ///
  /// In en, this message translates to:
  /// **'Our budget is below zero! Raise fares a little or sell old buses before the President notices.'**
  String get tipNegativeBudget;

  /// No description provided for @tipPresidentWatching.
  ///
  /// In en, this message translates to:
  /// **'The President is watching us. Lift satisfaction fast: more buses and better roads!'**
  String get tipPresidentWatching;

  /// No description provided for @tipLongWaits.
  ///
  /// In en, this message translates to:
  /// **'People in {district} wait {minutes} minutes for a bus. Let\'s add buses there!'**
  String tipLongWaits(String district, int minutes);

  /// No description provided for @tipBrokenRoads.
  ///
  /// In en, this message translates to:
  /// **'Roads in {district} are crumbling ({condition}%). A repair keeps drivers and trucks happy.'**
  String tipBrokenRoads(String district, int condition);

  /// No description provided for @tipTrafficJam.
  ///
  /// In en, this message translates to:
  /// **'{district} is jammed. Bike lanes slow traffic while they are built, but help a lot later.'**
  String tipTrafficJam(String district);

  /// No description provided for @tipOldFleet.
  ///
  /// In en, this message translates to:
  /// **'Our old buses keep breaking down. Upgrades or newer models will keep the city moving.'**
  String get tipOldFleet;

  /// No description provided for @tipAllGood.
  ///
  /// In en, this message translates to:
  /// **'Things look calm, Minister! Keep an eye on the busiest districts.'**
  String get tipAllGood;

  /// No description provided for @citySectionNext.
  ///
  /// In en, this message translates to:
  /// **'Next cities'**
  String get citySectionNext;

  /// No description provided for @cityLockedBody.
  ///
  /// In en, this message translates to:
  /// **'Complete {city} to unlock it.'**
  String cityLockedBody(String city);

  /// No description provided for @cityRequirement.
  ///
  /// In en, this message translates to:
  /// **'Complete {city}'**
  String cityRequirement(String city);

  /// No description provided for @cityLevelChip.
  ///
  /// In en, this message translates to:
  /// **'Level {level} · Target {target}'**
  String cityLevelChip(int level, int target);

  /// No description provided for @ledgerLevelRewards.
  ///
  /// In en, this message translates to:
  /// **'Level rewards'**
  String get ledgerLevelRewards;

  /// No description provided for @levelBarLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String levelBarLabel(int level);

  /// No description provided for @levelBarPoints.
  ///
  /// In en, this message translates to:
  /// **'{points} / {next} pts'**
  String levelBarPoints(int points, int next);

  /// No description provided for @levelBarMax.
  ///
  /// In en, this message translates to:
  /// **'Max level reached'**
  String get levelBarMax;

  /// No description provided for @levelSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'{city} development'**
  String levelSheetTitle(String city);

  /// No description provided for @levelSheetBody.
  ///
  /// In en, this message translates to:
  /// **'Earn city points all the time by keeping citizens happy and the budget growing. New buses, upgrades, finished projects and wise decisions give extra points. Every level pays a Cabinet bonus and diplomacy points.'**
  String get levelSheetBody;

  /// No description provided for @levelUpTitle.
  ///
  /// In en, this message translates to:
  /// **'{city} reached level {level}!'**
  String levelUpTitle(String city, int level);

  /// No description provided for @levelUpReward.
  ///
  /// In en, this message translates to:
  /// **'The Cabinet sends {amount} and {diplomacy} diplomacy points, and your budget grows by {percent}%!'**
  String levelUpReward(String amount, int diplomacy, int percent);

  /// No description provided for @levelUpContinue.
  ///
  /// In en, this message translates to:
  /// **'Hooray!'**
  String get levelUpContinue;

  /// No description provided for @eventCrisisAverted.
  ///
  /// In en, this message translates to:
  /// **'Crisis averted! The President is calm again.'**
  String get eventCrisisAverted;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Minister profile'**
  String get profileTitle;

  /// No description provided for @profileOpen.
  ///
  /// In en, this message translates to:
  /// **'Open profile'**
  String get profileOpen;

  /// No description provided for @profileReputation.
  ///
  /// In en, this message translates to:
  /// **'Reputation'**
  String get profileReputation;

  /// No description provided for @profileXp.
  ///
  /// In en, this message translates to:
  /// **'{xp} / {next} XP'**
  String profileXp(String xp, String next);

  /// No description provided for @profileXpMax.
  ///
  /// In en, this message translates to:
  /// **'{xp} XP · Highest rank'**
  String profileXpMax(String xp);

  /// No description provided for @profileRanks.
  ///
  /// In en, this message translates to:
  /// **'Ranks'**
  String get profileRanks;

  /// No description provided for @profileCityBadges.
  ///
  /// In en, this message translates to:
  /// **'City badges'**
  String get profileCityBadges;

  /// No description provided for @profileAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements {done}/{total}'**
  String profileAchievements(int done, int total);

  /// No description provided for @profileCareer.
  ///
  /// In en, this message translates to:
  /// **'Career'**
  String get profileCareer;

  /// No description provided for @careerTime.
  ///
  /// In en, this message translates to:
  /// **'Time in office'**
  String get careerTime;

  /// No description provided for @careerBuses.
  ///
  /// In en, this message translates to:
  /// **'Buses bought'**
  String get careerBuses;

  /// No description provided for @careerUpgrades.
  ///
  /// In en, this message translates to:
  /// **'Upgrades'**
  String get careerUpgrades;

  /// No description provided for @careerProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get careerProjects;

  /// No description provided for @careerCrises.
  ///
  /// In en, this message translates to:
  /// **'Crises averted'**
  String get careerCrises;

  /// No description provided for @careerDismissals.
  ///
  /// In en, this message translates to:
  /// **'Dismissals'**
  String get careerDismissals;

  /// No description provided for @badgeBronze.
  ///
  /// In en, this message translates to:
  /// **'Bronze'**
  String get badgeBronze;

  /// No description provided for @badgeSilver.
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get badgeSilver;

  /// No description provided for @badgeGold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get badgeGold;

  /// No description provided for @badgeLocked.
  ///
  /// In en, this message translates to:
  /// **'Not earned'**
  String get badgeLocked;

  /// No description provided for @badgeEarnedToast.
  ///
  /// In en, this message translates to:
  /// **'{tier} badge earned in {city}!'**
  String badgeEarnedToast(String tier, String city);

  /// No description provided for @achievementToast.
  ///
  /// In en, this message translates to:
  /// **'Achievement unlocked: {title} · +{xp} XP'**
  String achievementToast(String title, int xp);

  /// No description provided for @promotedTitle.
  ///
  /// In en, this message translates to:
  /// **'Promoted!'**
  String get promotedTitle;

  /// No description provided for @promotedBody.
  ///
  /// In en, this message translates to:
  /// **'You are now {rank}. The whole ministry salutes you!'**
  String promotedBody(String rank);

  /// No description provided for @promotedContinue.
  ///
  /// In en, this message translates to:
  /// **'Thank you!'**
  String get promotedContinue;

  /// No description provided for @achievementFirstBusTitle.
  ///
  /// In en, this message translates to:
  /// **'First Bus'**
  String get achievementFirstBusTitle;

  /// No description provided for @achievementFirstBusDescription.
  ///
  /// In en, this message translates to:
  /// **'Buy your first bus.'**
  String get achievementFirstBusDescription;

  /// No description provided for @achievementFleetBuilderTitle.
  ///
  /// In en, this message translates to:
  /// **'Fleet Builder'**
  String get achievementFleetBuilderTitle;

  /// No description provided for @achievementFleetBuilderDescription.
  ///
  /// In en, this message translates to:
  /// **'Run 40 buses in one city.'**
  String get achievementFleetBuilderDescription;

  /// No description provided for @achievementModernCityTitle.
  ///
  /// In en, this message translates to:
  /// **'Modern City'**
  String get achievementModernCityTitle;

  /// No description provided for @achievementModernCityDescription.
  ///
  /// In en, this message translates to:
  /// **'Retire every Veteran bus from a fleet of 20 or more.'**
  String get achievementModernCityDescription;

  /// No description provided for @achievementGreenRevolutionTitle.
  ///
  /// In en, this message translates to:
  /// **'Green Revolution'**
  String get achievementGreenRevolutionTitle;

  /// No description provided for @achievementGreenRevolutionDescription.
  ///
  /// In en, this message translates to:
  /// **'Buy your first electric bus.'**
  String get achievementGreenRevolutionDescription;

  /// No description provided for @achievementUpgradeEnthusiastTitle.
  ///
  /// In en, this message translates to:
  /// **'Upgrade Enthusiast'**
  String get achievementUpgradeEnthusiastTitle;

  /// No description provided for @achievementUpgradeEnthusiastDescription.
  ///
  /// In en, this message translates to:
  /// **'Upgrade buses 10 times.'**
  String get achievementUpgradeEnthusiastDescription;

  /// No description provided for @achievementRoadWarriorTitle.
  ///
  /// In en, this message translates to:
  /// **'Road Warrior'**
  String get achievementRoadWarriorTitle;

  /// No description provided for @achievementRoadWarriorDescription.
  ///
  /// In en, this message translates to:
  /// **'Finish 10 road repairs.'**
  String get achievementRoadWarriorDescription;

  /// No description provided for @achievementBikeFriendlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Bike Friendly'**
  String get achievementBikeFriendlyTitle;

  /// No description provided for @achievementBikeFriendlyDescription.
  ///
  /// In en, this message translates to:
  /// **'Build bike lanes in 3 districts.'**
  String get achievementBikeFriendlyDescription;

  /// No description provided for @achievementInfrastructureMasterTitle.
  ///
  /// In en, this message translates to:
  /// **'Infrastructure Master'**
  String get achievementInfrastructureMasterTitle;

  /// No description provided for @achievementInfrastructureMasterDescription.
  ///
  /// In en, this message translates to:
  /// **'Complete 50 construction projects.'**
  String get achievementInfrastructureMasterDescription;

  /// No description provided for @achievementEconomicStrategistTitle.
  ///
  /// In en, this message translates to:
  /// **'Economic Strategist'**
  String get achievementEconomicStrategistTitle;

  /// No description provided for @achievementEconomicStrategistDescription.
  ///
  /// In en, this message translates to:
  /// **'Keep the budget growing for 15 minutes in a row.'**
  String get achievementEconomicStrategistDescription;

  /// No description provided for @achievementSmilingCityTitle.
  ///
  /// In en, this message translates to:
  /// **'Smiling City'**
  String get achievementSmilingCityTitle;

  /// No description provided for @achievementSmilingCityDescription.
  ///
  /// In en, this message translates to:
  /// **'Reach 60% citizen satisfaction.'**
  String get achievementSmilingCityDescription;

  /// No description provided for @achievementHappyCitizensTitle.
  ///
  /// In en, this message translates to:
  /// **'Happy Citizens'**
  String get achievementHappyCitizensTitle;

  /// No description provided for @achievementHappyCitizensDescription.
  ///
  /// In en, this message translates to:
  /// **'Reach 90% citizen satisfaction.'**
  String get achievementHappyCitizensDescription;

  /// No description provided for @achievementRisingCityTitle.
  ///
  /// In en, this message translates to:
  /// **'Rising City'**
  String get achievementRisingCityTitle;

  /// No description provided for @achievementRisingCityDescription.
  ///
  /// In en, this message translates to:
  /// **'Reach city level 5.'**
  String get achievementRisingCityDescription;

  /// No description provided for @achievementCityChampionTitle.
  ///
  /// In en, this message translates to:
  /// **'City Champion'**
  String get achievementCityChampionTitle;

  /// No description provided for @achievementCityChampionDescription.
  ///
  /// In en, this message translates to:
  /// **'Complete a city.'**
  String get achievementCityChampionDescription;

  /// No description provided for @achievementSurvivorTitle.
  ///
  /// In en, this message translates to:
  /// **'Survivor'**
  String get achievementSurvivorTitle;

  /// No description provided for @achievementSurvivorDescription.
  ///
  /// In en, this message translates to:
  /// **'Recover after a President\'s warning.'**
  String get achievementSurvivorDescription;

  /// No description provided for @achievementVeteranMinisterTitle.
  ///
  /// In en, this message translates to:
  /// **'Veteran Minister'**
  String get achievementVeteranMinisterTitle;

  /// No description provided for @achievementVeteranMinisterDescription.
  ///
  /// In en, this message translates to:
  /// **'Serve 3 hours in office.'**
  String get achievementVeteranMinisterDescription;

  /// No description provided for @ledgerDecisions.
  ///
  /// In en, this message translates to:
  /// **'Decisions & events'**
  String get ledgerDecisions;

  /// No description provided for @eventDecisionArrived.
  ///
  /// In en, this message translates to:
  /// **'Mr. Bus has news: {title}'**
  String eventDecisionArrived(String title);

  /// No description provided for @eventDecisionAutomatic.
  ///
  /// In en, this message translates to:
  /// **'Time ran out: {title} was decided for you'**
  String eventDecisionAutomatic(String title);

  /// No description provided for @groupPassengers.
  ///
  /// In en, this message translates to:
  /// **'Passengers'**
  String get groupPassengers;

  /// No description provided for @groupDrivers.
  ///
  /// In en, this message translates to:
  /// **'Drivers'**
  String get groupDrivers;

  /// No description provided for @groupPedestrians.
  ///
  /// In en, this message translates to:
  /// **'Pedestrians'**
  String get groupPedestrians;

  /// No description provided for @groupCyclists.
  ///
  /// In en, this message translates to:
  /// **'Cyclists'**
  String get groupCyclists;

  /// No description provided for @groupBusinesses.
  ///
  /// In en, this message translates to:
  /// **'Businesses'**
  String get groupBusinesses;

  /// No description provided for @groupTransportWorkers.
  ///
  /// In en, this message translates to:
  /// **'Bus crews'**
  String get groupTransportWorkers;

  /// No description provided for @groupEnvironmentalists.
  ///
  /// In en, this message translates to:
  /// **'Eco groups'**
  String get groupEnvironmentalists;

  /// No description provided for @groupLogistics.
  ///
  /// In en, this message translates to:
  /// **'Logistics'**
  String get groupLogistics;

  /// No description provided for @busVeteran.
  ///
  /// In en, this message translates to:
  /// **'Veteran 80'**
  String get busVeteran;

  /// No description provided for @busHopMini.
  ///
  /// In en, this message translates to:
  /// **'Hop Mini'**
  String get busHopMini;

  /// No description provided for @busCityRunner.
  ///
  /// In en, this message translates to:
  /// **'CityRunner 12'**
  String get busCityRunner;

  /// No description provided for @busMegaLink.
  ///
  /// In en, this message translates to:
  /// **'MegaLink'**
  String get busMegaLink;

  /// No description provided for @busVoltaE.
  ///
  /// In en, this message translates to:
  /// **'Volta E-12'**
  String get busVoltaE;

  /// No description provided for @kindRequest.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get kindRequest;

  /// No description provided for @kindOpportunity.
  ///
  /// In en, this message translates to:
  /// **'Offer'**
  String get kindOpportunity;

  /// No description provided for @kindCrisis.
  ///
  /// In en, this message translates to:
  /// **'Crisis'**
  String get kindCrisis;

  /// No description provided for @kindDisaster.
  ///
  /// In en, this message translates to:
  /// **'Disaster'**
  String get kindDisaster;

  /// No description provided for @decisionTimeLeft.
  ///
  /// In en, this message translates to:
  /// **'{time} left'**
  String decisionTimeLeft(String time);

  /// No description provided for @decisionChoose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get decisionChoose;

  /// No description provided for @decisionCost.
  ///
  /// In en, this message translates to:
  /// **'Cost {amount}'**
  String decisionCost(String amount);

  /// No description provided for @decisionFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get decisionFree;

  /// No description provided for @decisionRisk.
  ///
  /// In en, this message translates to:
  /// **'{chance}% risk:'**
  String decisionRisk(int chance);

  /// No description provided for @decisionResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Decision made!'**
  String get decisionResultTitle;

  /// No description provided for @decisionResultCalm.
  ///
  /// In en, this message translates to:
  /// **'Everything went as planned, Minister.'**
  String get decisionResultCalm;

  /// No description provided for @decisionResultRisk.
  ///
  /// In en, this message translates to:
  /// **'Oh no! The risk came true. Here is what happened:'**
  String get decisionResultRisk;

  /// No description provided for @decisionResultOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get decisionResultOk;

  /// No description provided for @newsTitle.
  ///
  /// In en, this message translates to:
  /// **'Mr. Bus has news'**
  String get newsTitle;

  /// No description provided for @newsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 decision waiting} other{{count} decisions waiting}}'**
  String newsCount(int count);

  /// No description provided for @effectMood.
  ///
  /// In en, this message translates to:
  /// **'{group} {change}'**
  String effectMood(String group, String change);

  /// No description provided for @effectReputation.
  ///
  /// In en, this message translates to:
  /// **'Reputation {change}'**
  String effectReputation(String change);

  /// No description provided for @effectRoadDamage.
  ///
  /// In en, this message translates to:
  /// **'Road -{amount} · {district}'**
  String effectRoadDamage(int amount, String district);

  /// No description provided for @effectRoadRestore.
  ///
  /// In en, this message translates to:
  /// **'Road fixed · {district}'**
  String effectRoadRestore(String district);

  /// No description provided for @effectCapacity.
  ///
  /// In en, this message translates to:
  /// **'Bus capacity {change}'**
  String effectCapacity(String change);

  /// No description provided for @effectDemand.
  ///
  /// In en, this message translates to:
  /// **'Riders {change}'**
  String effectDemand(String change);

  /// No description provided for @effectCongestion.
  ///
  /// In en, this message translates to:
  /// **'Traffic {change}'**
  String effectCongestion(String change);

  /// No description provided for @effectSafety.
  ///
  /// In en, this message translates to:
  /// **'Safety {change}'**
  String effectSafety(String change);

  /// No description provided for @effectEnergyCost.
  ///
  /// In en, this message translates to:
  /// **'Fuel cost {change}'**
  String effectEnergyCost(String change);

  /// No description provided for @effectSalaryCost.
  ///
  /// In en, this message translates to:
  /// **'Wages {change}'**
  String effectSalaryCost(String change);

  /// No description provided for @effectTicketRevenue.
  ///
  /// In en, this message translates to:
  /// **'Ticket income {change}'**
  String effectTicketRevenue(String change);

  /// No description provided for @effectSubsidy.
  ///
  /// In en, this message translates to:
  /// **'Subsidy {change}'**
  String effectSubsidy(String change);

  /// No description provided for @effectExtraCost.
  ///
  /// In en, this message translates to:
  /// **'Costs {amount}/s'**
  String effectExtraCost(String amount);

  /// No description provided for @effectExtraIncome.
  ///
  /// In en, this message translates to:
  /// **'Income {amount}/s'**
  String effectExtraIncome(String amount);

  /// No description provided for @effectMoodTrend.
  ///
  /// In en, this message translates to:
  /// **'{group} mood {change}'**
  String effectMoodTrend(String group, String change);

  /// No description provided for @effectForever.
  ///
  /// In en, this message translates to:
  /// **'forever'**
  String get effectForever;

  /// No description provided for @effectBuses.
  ///
  /// In en, this message translates to:
  /// **'+{count} {model}'**
  String effectBuses(int count, String model);

  /// No description provided for @effectProject.
  ///
  /// In en, this message translates to:
  /// **'Starts {project}'**
  String effectProject(String project);

  /// No description provided for @effectDiscount.
  ///
  /// In en, this message translates to:
  /// **'{project} {percent}% off'**
  String effectDiscount(String project, int percent);

  /// No description provided for @effectLoseBuses.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Lose 1 bus} other{Lose {count} buses}}'**
  String effectLoseBuses(int count);

  /// No description provided for @effectFare.
  ///
  /// In en, this message translates to:
  /// **'Fare {change}'**
  String effectFare(String change);

  /// No description provided for @decisionOvercrowdedBusesTitle.
  ///
  /// In en, this message translates to:
  /// **'Packed buses in {district}!'**
  String decisionOvercrowdedBusesTitle(String district);

  /// No description provided for @decisionOvercrowdedBusesBody.
  ///
  /// In en, this message translates to:
  /// **'Minister, people in {district} squeeze into buses like pickles in a jar. What do we do?'**
  String decisionOvercrowdedBusesBody(String district);

  /// No description provided for @decisionOvercrowdedBusesOptionA.
  ///
  /// In en, this message translates to:
  /// **'Rush-order 3 CityRunners'**
  String get decisionOvercrowdedBusesOptionA;

  /// No description provided for @decisionOvercrowdedBusesOptionB.
  ///
  /// In en, this message translates to:
  /// **'Extra shifts for a while'**
  String get decisionOvercrowdedBusesOptionB;

  /// No description provided for @decisionOvercrowdedBusesOptionC.
  ///
  /// In en, this message translates to:
  /// **'Ask people to be patient'**
  String get decisionOvercrowdedBusesOptionC;

  /// No description provided for @decisionPotholesTitle.
  ///
  /// In en, this message translates to:
  /// **'Potholes in {district}!'**
  String decisionPotholesTitle(String district);

  /// No description provided for @decisionPotholesBody.
  ///
  /// In en, this message translates to:
  /// **'The roads in {district} have more holes than cheese. Drivers are furious!'**
  String decisionPotholesBody(String district);

  /// No description provided for @decisionPotholesOptionA.
  ///
  /// In en, this message translates to:
  /// **'Emergency repair now'**
  String get decisionPotholesOptionA;

  /// No description provided for @decisionPotholesOptionB.
  ///
  /// In en, this message translates to:
  /// **'Schedule a normal repair'**
  String get decisionPotholesOptionB;

  /// No description provided for @decisionPotholesOptionC.
  ///
  /// In en, this message translates to:
  /// **'Put up warning signs'**
  String get decisionPotholesOptionC;

  /// No description provided for @decisionBikePetitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Bike lane petition'**
  String get decisionBikePetitionTitle;

  /// No description provided for @decisionBikePetitionBody.
  ///
  /// In en, this message translates to:
  /// **'Eco activists in {district} collected 10,000 signatures for bike lanes. A green fund will pay 30%!'**
  String decisionBikePetitionBody(String district);

  /// No description provided for @decisionBikePetitionOptionA.
  ///
  /// In en, this message translates to:
  /// **'Build bike lanes'**
  String get decisionBikePetitionOptionA;

  /// No description provided for @decisionBikePetitionOptionB.
  ///
  /// In en, this message translates to:
  /// **'Fund a study first'**
  String get decisionBikePetitionOptionB;

  /// No description provided for @decisionBikePetitionOptionC.
  ///
  /// In en, this message translates to:
  /// **'Say no'**
  String get decisionBikePetitionOptionC;

  /// No description provided for @decisionParkingChaosTitle.
  ///
  /// In en, this message translates to:
  /// **'Parking chaos in {district}'**
  String decisionParkingChaosTitle(String district);

  /// No description provided for @decisionParkingChaosBody.
  ///
  /// In en, this message translates to:
  /// **'Cars are parked on sidewalks, in bus lanes, even on a fountain in {district}!'**
  String decisionParkingChaosBody(String district);

  /// No description provided for @decisionParkingChaosOptionA.
  ///
  /// In en, this message translates to:
  /// **'Introduce parking fees'**
  String get decisionParkingChaosOptionA;

  /// No description provided for @decisionParkingChaosOptionB.
  ///
  /// In en, this message translates to:
  /// **'Build a parking garage'**
  String get decisionParkingChaosOptionB;

  /// No description provided for @decisionParkingChaosOptionC.
  ///
  /// In en, this message translates to:
  /// **'Look the other way'**
  String get decisionParkingChaosOptionC;

  /// No description provided for @decisionDriverWagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Drivers want a raise'**
  String get decisionDriverWagesTitle;

  /// No description provided for @decisionDriverWagesBody.
  ///
  /// In en, this message translates to:
  /// **'Our bus drivers say their wages are too low. The union is whispering about a strike...'**
  String get decisionDriverWagesBody;

  /// No description provided for @decisionDriverWagesOptionA.
  ///
  /// In en, this message translates to:
  /// **'Raise wages by 15%'**
  String get decisionDriverWagesOptionA;

  /// No description provided for @decisionDriverWagesOptionB.
  ///
  /// In en, this message translates to:
  /// **'Pay a one-time bonus'**
  String get decisionDriverWagesOptionB;

  /// No description provided for @decisionDriverWagesOptionC.
  ///
  /// In en, this message translates to:
  /// **'Refuse'**
  String get decisionDriverWagesOptionC;

  /// No description provided for @decisionTrafficAccidentTitle.
  ///
  /// In en, this message translates to:
  /// **'Crash at a busy junction'**
  String get decisionTrafficAccidentTitle;

  /// No description provided for @decisionTrafficAccidentBody.
  ///
  /// In en, this message translates to:
  /// **'A nasty crash in {district} shows the junction is dangerous. People demand action!'**
  String decisionTrafficAccidentBody(String district);

  /// No description provided for @decisionTrafficAccidentOptionA.
  ///
  /// In en, this message translates to:
  /// **'Install smart traffic lights'**
  String get decisionTrafficAccidentOptionA;

  /// No description provided for @decisionTrafficAccidentOptionB.
  ///
  /// In en, this message translates to:
  /// **'Run a safety campaign'**
  String get decisionTrafficAccidentOptionB;

  /// No description provided for @decisionTrafficAccidentOptionC.
  ///
  /// In en, this message translates to:
  /// **'Do nothing'**
  String get decisionTrafficAccidentOptionC;

  /// No description provided for @decisionFuelSpikeTitle.
  ///
  /// In en, this message translates to:
  /// **'Fuel prices jumped 30%!'**
  String get decisionFuelSpikeTitle;

  /// No description provided for @decisionFuelSpikeBody.
  ///
  /// In en, this message translates to:
  /// **'Diesel suddenly got expensive, and our buses drink a lot of it...'**
  String get decisionFuelSpikeBody;

  /// No description provided for @decisionFuelSpikeOptionA.
  ///
  /// In en, this message translates to:
  /// **'Buy a price hedge'**
  String get decisionFuelSpikeOptionA;

  /// No description provided for @decisionFuelSpikeOptionB.
  ///
  /// In en, this message translates to:
  /// **'Add a fare surcharge'**
  String get decisionFuelSpikeOptionB;

  /// No description provided for @decisionFuelSpikeOptionC.
  ///
  /// In en, this message translates to:
  /// **'Absorb the cost'**
  String get decisionFuelSpikeOptionC;

  /// No description provided for @decisionBusDiscountTitle.
  ///
  /// In en, this message translates to:
  /// **'Bus sale!'**
  String get decisionBusDiscountTitle;

  /// No description provided for @decisionBusDiscountBody.
  ///
  /// In en, this message translates to:
  /// **'Silkway Motors offers CityRunner buses at 25% off right now. They would start in {district}.'**
  String decisionBusDiscountBody(String district);

  /// No description provided for @decisionBusDiscountOptionA.
  ///
  /// In en, this message translates to:
  /// **'Buy 2 buses'**
  String get decisionBusDiscountOptionA;

  /// No description provided for @decisionBusDiscountOptionB.
  ///
  /// In en, this message translates to:
  /// **'Buy 5 buses'**
  String get decisionBusDiscountOptionB;

  /// No description provided for @decisionBusDiscountOptionC.
  ///
  /// In en, this message translates to:
  /// **'No, thanks'**
  String get decisionBusDiscountOptionC;

  /// No description provided for @decisionPrivateOperatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Private bus company'**
  String get decisionPrivateOperatorTitle;

  /// No description provided for @decisionPrivateOperatorBody.
  ///
  /// In en, this message translates to:
  /// **'A private company wants to run extra buses in {district} for a share of the ticket money.'**
  String decisionPrivateOperatorBody(String district);

  /// No description provided for @decisionPrivateOperatorOptionA.
  ///
  /// In en, this message translates to:
  /// **'Accept the deal'**
  String get decisionPrivateOperatorOptionA;

  /// No description provided for @decisionPrivateOperatorOptionB.
  ///
  /// In en, this message translates to:
  /// **'Negotiate better terms'**
  String get decisionPrivateOperatorOptionB;

  /// No description provided for @decisionPrivateOperatorOptionC.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decisionPrivateOperatorOptionC;

  /// No description provided for @decisionBudgetHearingTitle.
  ///
  /// In en, this message translates to:
  /// **'Cabinet budget hearing'**
  String get decisionBudgetHearingTitle;

  /// No description provided for @decisionBudgetHearingBody.
  ///
  /// In en, this message translates to:
  /// **'The Cabinet wants to know how we spend their money. Our chance to ask for more!'**
  String get decisionBudgetHearingBody;

  /// No description provided for @decisionBudgetHearingOptionA.
  ///
  /// In en, this message translates to:
  /// **'Ask for a big grant'**
  String get decisionBudgetHearingOptionA;

  /// No description provided for @decisionBudgetHearingOptionB.
  ///
  /// In en, this message translates to:
  /// **'Ask for a bigger subsidy'**
  String get decisionBudgetHearingOptionB;

  /// No description provided for @decisionBudgetHearingOptionC.
  ///
  /// In en, this message translates to:
  /// **'Promise savings'**
  String get decisionBudgetHearingOptionC;

  /// No description provided for @decisionBudgetHearingOptionD.
  ///
  /// In en, this message translates to:
  /// **'Skip the hearing'**
  String get decisionBudgetHearingOptionD;

  /// No description provided for @decisionFestivalTitle.
  ///
  /// In en, this message translates to:
  /// **'Festival on the Boulevard!'**
  String get decisionFestivalTitle;

  /// No description provided for @decisionFestivalBody.
  ///
  /// In en, this message translates to:
  /// **'A huge music festival is coming to Seaside Boulevard. Thousands of fans will need a ride!'**
  String get decisionFestivalBody;

  /// No description provided for @decisionFestivalOptionA.
  ///
  /// In en, this message translates to:
  /// **'Run special buses'**
  String get decisionFestivalOptionA;

  /// No description provided for @decisionFestivalOptionB.
  ///
  /// In en, this message translates to:
  /// **'Close the Boulevard to cars'**
  String get decisionFestivalOptionB;

  /// No description provided for @decisionFestivalOptionC.
  ///
  /// In en, this message translates to:
  /// **'Business as usual'**
  String get decisionFestivalOptionC;

  /// No description provided for @decisionTouristSeasonTitle.
  ///
  /// In en, this message translates to:
  /// **'Tourist season!'**
  String get decisionTouristSeasonTitle;

  /// No description provided for @decisionTouristSeasonBody.
  ///
  /// In en, this message translates to:
  /// **'Tourists flood the Old Fortress with selfie sticks. Shops are happy, streets are crowded.'**
  String get decisionTouristSeasonBody;

  /// No description provided for @decisionTouristSeasonOptionA.
  ///
  /// In en, this message translates to:
  /// **'Launch a tourist shuttle'**
  String get decisionTouristSeasonOptionA;

  /// No description provided for @decisionTouristSeasonOptionB.
  ///
  /// In en, this message translates to:
  /// **'Add a tourist ticket surcharge'**
  String get decisionTouristSeasonOptionB;

  /// No description provided for @decisionTouristSeasonOptionC.
  ///
  /// In en, this message translates to:
  /// **'Do nothing'**
  String get decisionTouristSeasonOptionC;

  /// No description provided for @decisionGreenFundTitle.
  ///
  /// In en, this message translates to:
  /// **'Green fund offer'**
  String get decisionGreenFundTitle;

  /// No description provided for @decisionGreenFundBody.
  ///
  /// In en, this message translates to:
  /// **'A green fund will pay 40% of a charging depot so we can run electric buses!'**
  String get decisionGreenFundBody;

  /// No description provided for @decisionGreenFundOptionA.
  ///
  /// In en, this message translates to:
  /// **'Build the depot'**
  String get decisionGreenFundOptionA;

  /// No description provided for @decisionGreenFundOptionB.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get decisionGreenFundOptionB;

  /// No description provided for @decisionFloodTitle.
  ///
  /// In en, this message translates to:
  /// **'Flash flood in {district}!'**
  String decisionFloodTitle(String district);

  /// No description provided for @decisionFloodBody.
  ///
  /// In en, this message translates to:
  /// **'Heavy rain turned the streets of {district} into rivers. Buses are stuck!'**
  String decisionFloodBody(String district);

  /// No description provided for @decisionFloodOptionA.
  ///
  /// In en, this message translates to:
  /// **'Send pumps and detours'**
  String get decisionFloodOptionA;

  /// No description provided for @decisionFloodOptionB.
  ///
  /// In en, this message translates to:
  /// **'Free rescue shuttles'**
  String get decisionFloodOptionB;

  /// No description provided for @decisionFloodOptionC.
  ///
  /// In en, this message translates to:
  /// **'Wait for the water to drain'**
  String get decisionFloodOptionC;

  /// No description provided for @decisionWindStormTitle.
  ///
  /// In en, this message translates to:
  /// **'Mighty wind storm!'**
  String get decisionWindStormTitle;

  /// No description provided for @decisionWindStormBody.
  ///
  /// In en, this message translates to:
  /// **'A legendary Baku wind is blowing away hats, signs and almost our buses!'**
  String get decisionWindStormBody;

  /// No description provided for @decisionWindStormOptionA.
  ///
  /// In en, this message translates to:
  /// **'Stop service for safety'**
  String get decisionWindStormOptionA;

  /// No description provided for @decisionWindStormOptionB.
  ///
  /// In en, this message translates to:
  /// **'Send repair crews'**
  String get decisionWindStormOptionB;

  /// No description provided for @decisionWindStormOptionC.
  ///
  /// In en, this message translates to:
  /// **'Keep driving'**
  String get decisionWindStormOptionC;

  /// No description provided for @decisionHeatwaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Heatwave: 42°C!'**
  String get decisionHeatwaveTitle;

  /// No description provided for @decisionHeatwaveBody.
  ///
  /// In en, this message translates to:
  /// **'It is so hot the asphalt is melting. Passengers are melting too!'**
  String get decisionHeatwaveBody;

  /// No description provided for @decisionHeatwaveOptionA.
  ///
  /// In en, this message translates to:
  /// **'Free water at bus stops'**
  String get decisionHeatwaveOptionA;

  /// No description provided for @decisionHeatwaveOptionB.
  ///
  /// In en, this message translates to:
  /// **'Run only air-conditioned buses'**
  String get decisionHeatwaveOptionB;

  /// No description provided for @decisionHeatwaveOptionC.
  ///
  /// In en, this message translates to:
  /// **'Hope it ends soon'**
  String get decisionHeatwaveOptionC;

  /// No description provided for @decisionEarthquakeTitle.
  ///
  /// In en, this message translates to:
  /// **'Earthquake!'**
  String get decisionEarthquakeTitle;

  /// No description provided for @decisionEarthquakeBody.
  ///
  /// In en, this message translates to:
  /// **'The ground shook and roads in {district} cracked open. Everyone is scared.'**
  String decisionEarthquakeBody(String district);

  /// No description provided for @decisionEarthquakeOptionA.
  ///
  /// In en, this message translates to:
  /// **'Rebuild roads right away'**
  String get decisionEarthquakeOptionA;

  /// No description provided for @decisionEarthquakeOptionB.
  ///
  /// In en, this message translates to:
  /// **'Schedule a repair'**
  String get decisionEarthquakeOptionB;

  /// No description provided for @decisionEarthquakeOptionC.
  ///
  /// In en, this message translates to:
  /// **'Let them wait'**
  String get decisionEarthquakeOptionC;

  /// No description provided for @decisionSnowstormTitle.
  ///
  /// In en, this message translates to:
  /// **'Rare snowstorm!'**
  String get decisionSnowstormTitle;

  /// No description provided for @decisionSnowstormBody.
  ///
  /// In en, this message translates to:
  /// **'Snow in Baku! Kids are happy, drivers are not. Roads are slippery everywhere.'**
  String get decisionSnowstormBody;

  /// No description provided for @decisionSnowstormOptionA.
  ///
  /// In en, this message translates to:
  /// **'Rent snowplows'**
  String get decisionSnowstormOptionA;

  /// No description provided for @decisionSnowstormOptionB.
  ///
  /// In en, this message translates to:
  /// **'Clear bus routes only'**
  String get decisionSnowstormOptionB;

  /// No description provided for @decisionSnowstormOptionC.
  ///
  /// In en, this message translates to:
  /// **'Do nothing'**
  String get decisionSnowstormOptionC;

  /// No description provided for @decisionHarborFireTitle.
  ///
  /// In en, this message translates to:
  /// **'Fire at the harbor!'**
  String get decisionHarborFireTitle;

  /// No description provided for @decisionHarborFireBody.
  ///
  /// In en, this message translates to:
  /// **'A warehouse is burning at Oil Harbor. Smoke is drifting over the roads.'**
  String get decisionHarborFireBody;

  /// No description provided for @decisionHarborFireOptionA.
  ///
  /// In en, this message translates to:
  /// **'Close the harbor roads'**
  String get decisionHarborFireOptionA;

  /// No description provided for @decisionHarborFireOptionB.
  ///
  /// In en, this message translates to:
  /// **'Evacuate workers by bus'**
  String get decisionHarborFireOptionB;

  /// No description provided for @decisionHarborFireOptionC.
  ///
  /// In en, this message translates to:
  /// **'Keep traffic moving'**
  String get decisionHarborFireOptionC;

  /// No description provided for @decisionLandslideTitle.
  ///
  /// In en, this message translates to:
  /// **'Landslide in Wind Heights!'**
  String get decisionLandslideTitle;

  /// No description provided for @decisionLandslideBody.
  ///
  /// In en, this message translates to:
  /// **'Rocks slid onto the main road of Wind Heights. Traffic is crawling.'**
  String get decisionLandslideBody;

  /// No description provided for @decisionLandslideOptionA.
  ///
  /// In en, this message translates to:
  /// **'Clear it with heavy machines'**
  String get decisionLandslideOptionA;

  /// No description provided for @decisionLandslideOptionB.
  ///
  /// In en, this message translates to:
  /// **'Reroute the buses'**
  String get decisionLandslideOptionB;

  /// No description provided for @decisionLandslideOptionC.
  ///
  /// In en, this message translates to:
  /// **'Wait for crews'**
  String get decisionLandslideOptionC;

  /// No description provided for @achievementDecisiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Decisive'**
  String get achievementDecisiveTitle;

  /// No description provided for @achievementDecisiveDescription.
  ///
  /// In en, this message translates to:
  /// **'Make 25 decisions yourself.'**
  String get achievementDecisiveDescription;

  /// No description provided for @achievementStormChaserTitle.
  ///
  /// In en, this message translates to:
  /// **'Storm Chaser'**
  String get achievementStormChaserTitle;

  /// No description provided for @achievementStormChaserDescription.
  ///
  /// In en, this message translates to:
  /// **'Handle 5 disasters.'**
  String get achievementStormChaserDescription;

  /// No description provided for @careerDecisions.
  ///
  /// In en, this message translates to:
  /// **'Decisions'**
  String get careerDecisions;

  /// No description provided for @careerDisasters.
  ///
  /// In en, this message translates to:
  /// **'Disasters handled'**
  String get careerDisasters;

  /// No description provided for @inboxTitle.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inboxTitle;

  /// No description provided for @inboxOpen.
  ///
  /// In en, this message translates to:
  /// **'Open inbox'**
  String get inboxOpen;

  /// No description provided for @inboxEmpty.
  ///
  /// In en, this message translates to:
  /// **'No news yet. Mr. Bus will keep you posted!'**
  String get inboxEmpty;

  /// No description provided for @timeJustNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get timeJustNow;

  /// No description provided for @timeMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min ago'**
  String timeMinutesAgo(int minutes);

  /// No description provided for @timeHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours} h ago'**
  String timeHoursAgo(int hours);

  /// No description provided for @timeDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} d ago'**
  String timeDaysAgo(int days);

  /// No description provided for @notificationPromotion.
  ///
  /// In en, this message translates to:
  /// **'Promoted to {rank}!'**
  String notificationPromotion(String rank);

  /// No description provided for @notificationLevelUp.
  ///
  /// In en, this message translates to:
  /// **'{city} reached level {level} · +{amount}'**
  String notificationLevelUp(String city, int level, String amount);

  /// No description provided for @notificationProjectIn.
  ///
  /// In en, this message translates to:
  /// **'{project} is ready in {district}!'**
  String notificationProjectIn(String project, String district);

  /// No description provided for @ledgerRewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get ledgerRewards;

  /// No description provided for @dailyOpen.
  ///
  /// In en, this message translates to:
  /// **'Daily tasks'**
  String get dailyOpen;

  /// No description provided for @dailyTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily tasks'**
  String get dailyTitle;

  /// No description provided for @dailyStreakTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily gift'**
  String get dailyStreakTitle;

  /// No description provided for @dailyStreakDay.
  ///
  /// In en, this message translates to:
  /// **'Day {day} of 7'**
  String dailyStreakDay(int day);

  /// No description provided for @dailyStreakDone.
  ///
  /// In en, this message translates to:
  /// **'Come back tomorrow for the next gift!'**
  String get dailyStreakDone;

  /// No description provided for @dailyClaim.
  ///
  /// In en, this message translates to:
  /// **'Claim'**
  String get dailyClaim;

  /// No description provided for @dailyClaimed.
  ///
  /// In en, this message translates to:
  /// **'Claimed'**
  String get dailyClaimed;

  /// No description provided for @dailyComeBack.
  ///
  /// In en, this message translates to:
  /// **'New tasks every day at midnight'**
  String get dailyComeBack;

  /// No description provided for @dailyReward.
  ///
  /// In en, this message translates to:
  /// **'+{money} · +{xp} XP'**
  String dailyReward(String money, int xp);

  /// No description provided for @dailyProgress.
  ///
  /// In en, this message translates to:
  /// **'{progress} / {target}'**
  String dailyProgress(String progress, String target);

  /// No description provided for @taskBuyBuses.
  ///
  /// In en, this message translates to:
  /// **'Buy {count} buses'**
  String taskBuyBuses(int count);

  /// No description provided for @taskMakeDecisions.
  ///
  /// In en, this message translates to:
  /// **'Make {count} decisions'**
  String taskMakeDecisions(int count);

  /// No description provided for @taskRunMinutes.
  ///
  /// In en, this message translates to:
  /// **'Run the city for {count} minutes'**
  String taskRunMinutes(int count);

  /// No description provided for @taskEarnTickets.
  ///
  /// In en, this message translates to:
  /// **'Earn {amount} from tickets'**
  String taskEarnTickets(String amount);

  /// No description provided for @taskFinishProject.
  ///
  /// In en, this message translates to:
  /// **'Finish a construction project'**
  String get taskFinishProject;

  /// No description provided for @taskRepairRoad.
  ///
  /// In en, this message translates to:
  /// **'Repair a road'**
  String get taskRepairRoad;

  /// No description provided for @taskReachSatisfaction.
  ///
  /// In en, this message translates to:
  /// **'Reach {percent}% satisfaction'**
  String taskReachSatisfaction(int percent);

  /// No description provided for @tutorialNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get tutorialNext;

  /// No description provided for @tutorialSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get tutorialSkip;

  /// No description provided for @tutorialFinish.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go!'**
  String get tutorialFinish;

  /// No description provided for @tutorialWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Hi Minister!'**
  String get tutorialWelcomeTitle;

  /// No description provided for @tutorialWelcome.
  ///
  /// In en, this message translates to:
  /// **'I\'m Mr. Bus, your transport advisor. Let me show you Baku in 30 seconds!'**
  String get tutorialWelcome;

  /// No description provided for @tutorialBudget.
  ///
  /// In en, this message translates to:
  /// **'This is your budget. It starts empty: the Cabinet pays you every second while you are on this map, more when people are happy. Fuel, wages and repairs drain it.'**
  String get tutorialBudget;

  /// No description provided for @tutorialMood.
  ///
  /// In en, this message translates to:
  /// **'This face shows how happy citizens are. If it stays under 30%, or traffic jams the city, the President fires you!'**
  String get tutorialMood;

  /// No description provided for @tutorialDistrict.
  ///
  /// In en, this message translates to:
  /// **'People in {district} wait the longest. Find it on the map and tap it!'**
  String tutorialDistrict(String district);

  /// No description provided for @tutorialBuyBus.
  ///
  /// In en, this message translates to:
  /// **'The Cabinet sent {amount} to get you started. Pick a bus and tap Sign!'**
  String tutorialBuyBus(String amount);

  /// No description provided for @tutorialBusBought.
  ///
  /// In en, this message translates to:
  /// **'Your bus arrives in a few seconds. Faster service means happier citizens and more money!'**
  String get tutorialBusBought;

  /// No description provided for @tutorialLevel.
  ///
  /// In en, this message translates to:
  /// **'Reach level 10, unlock every technology and make people {percent}% happy to complete Baku!'**
  String tutorialLevel(int percent);

  /// No description provided for @tutorialNews.
  ///
  /// In en, this message translates to:
  /// **'When I wave here, I have news: requests, offers and disasters. You decide!'**
  String get tutorialNews;

  /// No description provided for @tutorialTasks.
  ///
  /// In en, this message translates to:
  /// **'Daily tasks and a daily gift bring extra money every day.'**
  String get tutorialTasks;

  /// No description provided for @tutorialDiplomacy.
  ///
  /// In en, this message translates to:
  /// **'This is diplomacy. Spend money on gestures people love and they pay you back in points for new technology.'**
  String get tutorialDiplomacy;

  /// No description provided for @tutorialProfile.
  ///
  /// In en, this message translates to:
  /// **'Climb nine ranks and collect achievements and city badges. Good luck, Minister!'**
  String get tutorialProfile;

  /// No description provided for @ledgerTechnology.
  ///
  /// In en, this message translates to:
  /// **'Technology contracts'**
  String get ledgerTechnology;

  /// No description provided for @rejectLocked.
  ///
  /// In en, this message translates to:
  /// **'Unlock it in Technology first'**
  String get rejectLocked;

  /// No description provided for @rejectInsufficientDiplomacy.
  ///
  /// In en, this message translates to:
  /// **'Not enough diplomacy points'**
  String get rejectInsufficientDiplomacy;

  /// No description provided for @rejectAlreadyUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Already unlocked'**
  String get rejectAlreadyUnlocked;

  /// No description provided for @eventTechnologyUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Contract signed: {technology}!'**
  String eventTechnologyUnlocked(String technology);

  /// No description provided for @effectMaintenanceCost.
  ///
  /// In en, this message translates to:
  /// **'Bus repairs {change}'**
  String effectMaintenanceCost(String change);

  /// No description provided for @diplomacyAmount.
  ///
  /// In en, this message translates to:
  /// **'+{amount}'**
  String diplomacyAmount(int amount);

  /// No description provided for @diplomacyOpen.
  ///
  /// In en, this message translates to:
  /// **'Open diplomacy'**
  String get diplomacyOpen;

  /// No description provided for @settingsOpen.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get settingsOpen;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsSound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get settingsSound;

  /// No description provided for @soundMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get soundMusic;

  /// No description provided for @soundEffects.
  ///
  /// In en, this message translates to:
  /// **'Sound effects'**
  String get soundEffects;

  /// No description provided for @soundCity.
  ///
  /// In en, this message translates to:
  /// **'City sounds'**
  String get soundCity;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String settingsVersion(String version);

  /// No description provided for @diplomacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Diplomacy'**
  String get diplomacyTitle;

  /// No description provided for @diplomacyIntro.
  ///
  /// In en, this message translates to:
  /// **'Gestures people love cost money, but citizens pay you back in diplomacy points. Spend the points on new technology.'**
  String get diplomacyIntro;

  /// No description provided for @diplomacyTechnologyBody.
  ///
  /// In en, this message translates to:
  /// **'Spend diplomacy points on new buses, upgrades and the metro.'**
  String get diplomacyTechnologyBody;

  /// No description provided for @diplomacyOpenTechnology.
  ///
  /// In en, this message translates to:
  /// **'Open technology'**
  String get diplomacyOpenTechnology;

  /// No description provided for @diplomacyTechnologyReady.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 technology ready} other{{count} technologies ready}}'**
  String diplomacyTechnologyReady(int count);

  /// No description provided for @diplomacyActionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Win people over'**
  String get diplomacyActionsTitle;

  /// No description provided for @diplomacyGain.
  ///
  /// In en, this message translates to:
  /// **'+{points} diplomacy'**
  String diplomacyGain(int points);

  /// No description provided for @diplomacyXp.
  ///
  /// In en, this message translates to:
  /// **'+{xp} XP'**
  String diplomacyXp(int xp);

  /// No description provided for @diplomacyAct.
  ///
  /// In en, this message translates to:
  /// **'Do it · {cost}'**
  String diplomacyAct(String cost);

  /// No description provided for @diplomacyReadyIn.
  ///
  /// In en, this message translates to:
  /// **'Ready in {time}'**
  String diplomacyReadyIn(String time);

  /// No description provided for @actionCheaperTickets.
  ///
  /// In en, this message translates to:
  /// **'Cheaper tickets'**
  String get actionCheaperTickets;

  /// No description provided for @actionCheaperTicketsBody.
  ///
  /// In en, this message translates to:
  /// **'Pay part of every fare for a while. Passengers love it and more people ride.'**
  String get actionCheaperTicketsBody;

  /// No description provided for @actionHackathon.
  ///
  /// In en, this message translates to:
  /// **'Transport hackathon'**
  String get actionHackathon;

  /// No description provided for @actionHackathonBody.
  ///
  /// In en, this message translates to:
  /// **'Invite young coders to fix city transport. Smart ideas bring in more ticket money.'**
  String get actionHackathonBody;

  /// No description provided for @actionDriverRaise.
  ///
  /// In en, this message translates to:
  /// **'Raise bus driver pay'**
  String get actionDriverRaise;

  /// No description provided for @actionDriverRaiseBody.
  ///
  /// In en, this message translates to:
  /// **'Drivers work happier, but wages cost more for a while.'**
  String get actionDriverRaiseBody;

  /// No description provided for @actionShopTaxBreak.
  ///
  /// In en, this message translates to:
  /// **'Tax break for shops'**
  String get actionShopTaxBreak;

  /// No description provided for @actionShopTaxBreakBody.
  ///
  /// In en, this message translates to:
  /// **'Lower taxes for shops along the bus routes. Businesses and deliveries cheer.'**
  String get actionShopTaxBreakBody;

  /// No description provided for @actionCleanAir.
  ///
  /// In en, this message translates to:
  /// **'Clean air campaign'**
  String get actionCleanAir;

  /// No description provided for @actionCleanAirBody.
  ///
  /// In en, this message translates to:
  /// **'Plant trees and wash the buses. Greener streets make many people smile.'**
  String get actionCleanAirBody;

  /// No description provided for @actionCityFestival.
  ///
  /// In en, this message translates to:
  /// **'City festival'**
  String get actionCityFestival;

  /// No description provided for @actionCityFestivalBody.
  ///
  /// In en, this message translates to:
  /// **'A huge party for the whole city. Everyone smiles, but the streets get crowded for a while.'**
  String get actionCityFestivalBody;

  /// No description provided for @decisionDiplomacyEarned.
  ///
  /// In en, this message translates to:
  /// **'Citizens appreciate it: +{amount} diplomacy points!'**
  String decisionDiplomacyEarned(int amount);

  /// No description provided for @technologyTitle.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technologyTitle;

  /// No description provided for @technologyIntro.
  ///
  /// In en, this message translates to:
  /// **'Happy citizens and wise decisions earn diplomacy points. Spend them with money to sign contracts and unlock new technology!'**
  String get technologyIntro;

  /// No description provided for @technologyUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get technologyUnlock;

  /// No description provided for @technologyUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get technologyUnlocked;

  /// No description provided for @technologyRequires.
  ///
  /// In en, this message translates to:
  /// **'Needs {technology}'**
  String technologyRequires(String technology);

  /// No description provided for @branchBuses.
  ///
  /// In en, this message translates to:
  /// **'Bus contracts'**
  String get branchBuses;

  /// No description provided for @branchUpgrades.
  ///
  /// In en, this message translates to:
  /// **'Bus upgrades'**
  String get branchUpgrades;

  /// No description provided for @branchMetro.
  ///
  /// In en, this message translates to:
  /// **'Metro'**
  String get branchMetro;

  /// No description provided for @branchOperations.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get branchOperations;

  /// No description provided for @techMinibusContractName.
  ///
  /// In en, this message translates to:
  /// **'Hop Mini contract'**
  String get techMinibusContractName;

  /// No description provided for @techMinibusContractDescription.
  ///
  /// In en, this message translates to:
  /// **'Nimble 28-seat minibuses from Silkway Motors. Cheap and great for narrow streets.'**
  String get techMinibusContractDescription;

  /// No description provided for @techArticulatedContractName.
  ///
  /// In en, this message translates to:
  /// **'MegaLink contract'**
  String get techArticulatedContractName;

  /// No description provided for @techArticulatedContractDescription.
  ///
  /// In en, this message translates to:
  /// **'Bendy 150-seat buses for the busiest districts.'**
  String get techArticulatedContractDescription;

  /// No description provided for @techElectricContractName.
  ///
  /// In en, this message translates to:
  /// **'Volta E-12 contract'**
  String get techElectricContractName;

  /// No description provided for @techElectricContractDescription.
  ///
  /// In en, this message translates to:
  /// **'Silent electric buses with zero emissions. Needs a charging depot.'**
  String get techElectricContractDescription;

  /// No description provided for @techEngineTuningName.
  ///
  /// In en, this message translates to:
  /// **'Engine tuning'**
  String get techEngineTuningName;

  /// No description provided for @techEngineTuningDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlocks bus level 2: more reliable buses and cheaper repairs.'**
  String get techEngineTuningDescription;

  /// No description provided for @techBiggerCabinsName.
  ///
  /// In en, this message translates to:
  /// **'Bigger cabins'**
  String get techBiggerCabinsName;

  /// No description provided for @techBiggerCabinsDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlocks bus level 3: 15% more seats.'**
  String get techBiggerCabinsDescription;

  /// No description provided for @techComfortKitName.
  ///
  /// In en, this message translates to:
  /// **'Comfort kit'**
  String get techComfortKitName;

  /// No description provided for @techComfortKitDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlocks bus level 4: air-con and soft seats passengers love.'**
  String get techComfortKitDescription;

  /// No description provided for @techSmartBusesName.
  ///
  /// In en, this message translates to:
  /// **'Smart buses'**
  String get techSmartBusesName;

  /// No description provided for @techSmartBusesDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlocks bus level 5: efficient engines and cleaner exhaust.'**
  String get techSmartBusesDescription;

  /// No description provided for @techMetroStudyName.
  ///
  /// In en, this message translates to:
  /// **'Metro study'**
  String get techMetroStudyName;

  /// No description provided for @techMetroStudyDescription.
  ///
  /// In en, this message translates to:
  /// **'Engineers survey the ground for an underground railway.'**
  String get techMetroStudyDescription;

  /// No description provided for @techMetroContractName.
  ///
  /// In en, this message translates to:
  /// **'Metro contract'**
  String get techMetroContractName;

  /// No description provided for @techMetroContractDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlocks metro lines between neighbouring districts.'**
  String get techMetroContractDescription;

  /// No description provided for @techMetroAutomationName.
  ///
  /// In en, this message translates to:
  /// **'Driverless metro'**
  String get techMetroAutomationName;

  /// No description provided for @techMetroAutomationDescription.
  ///
  /// In en, this message translates to:
  /// **'Driverless trains run more often and cost less to run.'**
  String get techMetroAutomationDescription;

  /// No description provided for @techSmartTicketingName.
  ///
  /// In en, this message translates to:
  /// **'Smart ticketing'**
  String get techSmartTicketingName;

  /// No description provided for @techSmartTicketingDescription.
  ///
  /// In en, this message translates to:
  /// **'Contactless cards stop fare dodging. Ticket income +8% forever.'**
  String get techSmartTicketingDescription;

  /// No description provided for @techEcoDrivingName.
  ///
  /// In en, this message translates to:
  /// **'Eco-driving academy'**
  String get techEcoDrivingName;

  /// No description provided for @techEcoDrivingDescription.
  ///
  /// In en, this message translates to:
  /// **'Trained drivers use 10% less fuel and power.'**
  String get techEcoDrivingDescription;

  /// No description provided for @techDepotRoboticsName.
  ///
  /// In en, this message translates to:
  /// **'Depot robotics'**
  String get techDepotRoboticsName;

  /// No description provided for @techDepotRoboticsDescription.
  ///
  /// In en, this message translates to:
  /// **'Robots help the mechanics. Bus repairs cost 15% less.'**
  String get techDepotRoboticsDescription;

  /// No description provided for @achievementInnovatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Innovator'**
  String get achievementInnovatorTitle;

  /// No description provided for @achievementInnovatorDescription.
  ///
  /// In en, this message translates to:
  /// **'Unlock 5 technologies.'**
  String get achievementInnovatorDescription;

  /// No description provided for @tabBuses.
  ///
  /// In en, this message translates to:
  /// **'Buses'**
  String get tabBuses;

  /// No description provided for @tabBuild.
  ///
  /// In en, this message translates to:
  /// **'Build'**
  String get tabBuild;

  /// No description provided for @tabMetro.
  ///
  /// In en, this message translates to:
  /// **'Metro'**
  String get tabMetro;

  /// No description provided for @contractsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign a contract'**
  String get contractsTitle;

  /// No description provided for @contractSign.
  ///
  /// In en, this message translates to:
  /// **'Sign · {price}'**
  String contractSign(String price);

  /// No description provided for @contractOpenTechnology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get contractOpenTechnology;

  /// No description provided for @contractFewer.
  ///
  /// In en, this message translates to:
  /// **'Fewer buses'**
  String get contractFewer;

  /// No description provided for @contractMore.
  ///
  /// In en, this message translates to:
  /// **'More buses'**
  String get contractMore;

  /// No description provided for @busSeats.
  ///
  /// In en, this message translates to:
  /// **'{count} seats'**
  String busSeats(int count);

  /// No description provided for @busRunningCost.
  ///
  /// In en, this message translates to:
  /// **'{amount}/s'**
  String busRunningCost(String amount);

  /// No description provided for @busComfort.
  ///
  /// In en, this message translates to:
  /// **'Comfort {value}'**
  String busComfort(int value);

  /// No description provided for @ecoZero.
  ///
  /// In en, this message translates to:
  /// **'Zero emissions'**
  String get ecoZero;

  /// No description provided for @ecoLow.
  ///
  /// In en, this message translates to:
  /// **'Low emissions'**
  String get ecoLow;

  /// No description provided for @ecoMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium emissions'**
  String get ecoMedium;

  /// No description provided for @ecoHigh.
  ///
  /// In en, this message translates to:
  /// **'High emissions'**
  String get ecoHigh;

  /// No description provided for @fleetHereTitle.
  ///
  /// In en, this message translates to:
  /// **'Buses here'**
  String get fleetHereTitle;

  /// No description provided for @fleetEmpty.
  ///
  /// In en, this message translates to:
  /// **'No buses here yet. Sign a contract above!'**
  String get fleetEmpty;

  /// No description provided for @fleetGroup.
  ///
  /// In en, this message translates to:
  /// **'{count} × {model}'**
  String fleetGroup(int count, String model);

  /// No description provided for @fleetLevel.
  ///
  /// In en, this message translates to:
  /// **'Level {level} · Reliability {percent}%'**
  String fleetLevel(int level, int percent);

  /// No description provided for @fleetUpgrade.
  ///
  /// In en, this message translates to:
  /// **'Upgrade · {price}'**
  String fleetUpgrade(String price);

  /// No description provided for @fleetSell.
  ///
  /// In en, this message translates to:
  /// **'Sell · +{price}'**
  String fleetSell(String price);

  /// No description provided for @fleetMaxLevel.
  ///
  /// In en, this message translates to:
  /// **'Max level'**
  String get fleetMaxLevel;

  /// No description provided for @fleetMoveHere.
  ///
  /// In en, this message translates to:
  /// **'Bring a bus from {district}'**
  String fleetMoveHere(String district);

  /// No description provided for @depotSpace.
  ///
  /// In en, this message translates to:
  /// **'Depot {used}/{capacity}'**
  String depotSpace(int used, int capacity);

  /// No description provided for @fleetOnOrder.
  ///
  /// In en, this message translates to:
  /// **'+{count} coming'**
  String fleetOnOrder(int count);

  /// No description provided for @buildDistrictTitle.
  ///
  /// In en, this message translates to:
  /// **'Build in {district}'**
  String buildDistrictTitle(String district);

  /// No description provided for @buildCityTitle.
  ///
  /// In en, this message translates to:
  /// **'City-wide'**
  String get buildCityTitle;

  /// No description provided for @buildAction.
  ///
  /// In en, this message translates to:
  /// **'Build · {price}'**
  String buildAction(String price);

  /// No description provided for @timeSeconds.
  ///
  /// In en, this message translates to:
  /// **'{seconds}s'**
  String timeSeconds(int seconds);

  /// No description provided for @timeMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String timeMinutes(int minutes);

  /// No description provided for @timeMinutesSeconds.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m {seconds}s'**
  String timeMinutesSeconds(int minutes, int seconds);

  /// No description provided for @timeHoursMinutes.
  ///
  /// In en, this message translates to:
  /// **'{hours}h {minutes}m'**
  String timeHoursMinutes(int hours, int minutes);

  /// No description provided for @buildDone.
  ///
  /// In en, this message translates to:
  /// **'Built'**
  String get buildDone;

  /// No description provided for @buildRoadFine.
  ///
  /// In en, this message translates to:
  /// **'Road is in great shape'**
  String get buildRoadFine;

  /// No description provided for @buildTimeLeft.
  ///
  /// In en, this message translates to:
  /// **'{time} left'**
  String buildTimeLeft(String time);

  /// No description provided for @projectRoadRepairInfo.
  ///
  /// In en, this message translates to:
  /// **'Patch every pothole and bring the road back to 100%.'**
  String get projectRoadRepairInfo;

  /// No description provided for @projectRoadExpansionInfo.
  ///
  /// In en, this message translates to:
  /// **'Add lanes so traffic flows better for good.'**
  String get projectRoadExpansionInfo;

  /// No description provided for @projectBikeLanesInfo.
  ///
  /// In en, this message translates to:
  /// **'A short jam while building, then fewer cars and cleaner air.'**
  String get projectBikeLanesInfo;

  /// No description provided for @projectSmartSignalsInfo.
  ///
  /// In en, this message translates to:
  /// **'Traffic lights that adapt to the traffic.'**
  String get projectSmartSignalsInfo;

  /// No description provided for @projectModernStopsInfo.
  ///
  /// In en, this message translates to:
  /// **'Shelters, screens and benches at every stop.'**
  String get projectModernStopsInfo;

  /// No description provided for @projectCityParkInfo.
  ///
  /// In en, this message translates to:
  /// **'Trees, paths and playgrounds. People walk and cycle more for short trips.'**
  String get projectCityParkInfo;

  /// No description provided for @projectParkAndRideInfo.
  ///
  /// In en, this message translates to:
  /// **'A big car park by the bus stops. Drivers leave the car and hop on a bus.'**
  String get projectParkAndRideInfo;

  /// No description provided for @projectChargingDepotInfo.
  ///
  /// In en, this message translates to:
  /// **'Power for electric buses.'**
  String get projectChargingDepotInfo;

  /// No description provided for @projectDepotExpansionInfo.
  ///
  /// In en, this message translates to:
  /// **'Room for 20 more buses.'**
  String get projectDepotExpansionInfo;

  /// No description provided for @chipRoadFull.
  ///
  /// In en, this message translates to:
  /// **'Road 100%'**
  String get chipRoadFull;

  /// No description provided for @chipDriversHappier.
  ///
  /// In en, this message translates to:
  /// **'Drivers happier'**
  String get chipDriversHappier;

  /// No description provided for @chipSafer.
  ///
  /// In en, this message translates to:
  /// **'Safer streets'**
  String get chipSafer;

  /// No description provided for @chipTrafficDown.
  ///
  /// In en, this message translates to:
  /// **'Less traffic'**
  String get chipTrafficDown;

  /// No description provided for @chipJams.
  ///
  /// In en, this message translates to:
  /// **'Jams while building'**
  String get chipJams;

  /// No description provided for @chipCyclists.
  ///
  /// In en, this message translates to:
  /// **'Cyclists love it'**
  String get chipCyclists;

  /// No description provided for @chipCleanAir.
  ///
  /// In en, this message translates to:
  /// **'Cleaner air'**
  String get chipCleanAir;

  /// No description provided for @chipCoverage.
  ///
  /// In en, this message translates to:
  /// **'Coverage +10%'**
  String get chipCoverage;

  /// No description provided for @chipPassengersHappier.
  ///
  /// In en, this message translates to:
  /// **'Passengers happier'**
  String get chipPassengersHappier;

  /// No description provided for @chipWalkersHappier.
  ///
  /// In en, this message translates to:
  /// **'Walkers happier'**
  String get chipWalkersHappier;

  /// No description provided for @chipMoreRiders.
  ///
  /// In en, this message translates to:
  /// **'More bus riders'**
  String get chipMoreRiders;

  /// No description provided for @chipElectric.
  ///
  /// In en, this message translates to:
  /// **'Needed for Volta E-12'**
  String get chipElectric;

  /// No description provided for @chipDepot.
  ///
  /// In en, this message translates to:
  /// **'Depot +20 buses'**
  String get chipDepot;

  /// No description provided for @ledgerMetro.
  ///
  /// In en, this message translates to:
  /// **'Metro'**
  String get ledgerMetro;

  /// No description provided for @rejectTunnelBusy.
  ///
  /// In en, this message translates to:
  /// **'The tunnel crew is busy digging another line'**
  String get rejectTunnelBusy;

  /// No description provided for @rejectCoolingDown.
  ///
  /// In en, this message translates to:
  /// **'Not ready yet'**
  String get rejectCoolingDown;

  /// No description provided for @eventMetroOpened.
  ///
  /// In en, this message translates to:
  /// **'Metro {from} ⇄ {to} is open!'**
  String eventMetroOpened(String from, String to);

  /// No description provided for @achievementMetroPioneerTitle.
  ///
  /// In en, this message translates to:
  /// **'Metro Pioneer'**
  String get achievementMetroPioneerTitle;

  /// No description provided for @achievementMetroPioneerDescription.
  ///
  /// In en, this message translates to:
  /// **'Open your first metro line.'**
  String get achievementMetroPioneerDescription;

  /// No description provided for @metroIntro.
  ///
  /// In en, this message translates to:
  /// **'Each station carries {riders} riders a second with no traffic jams. A line costs {cost}/s to run.'**
  String metroIntro(String riders, String cost);

  /// No description provided for @metroTeaser.
  ///
  /// In en, this message translates to:
  /// **'Dig tunnels to the neighbours: lots of riders and no traffic jams.'**
  String get metroTeaser;

  /// No description provided for @metroLinesTitle.
  ///
  /// In en, this message translates to:
  /// **'Lines from {district}'**
  String metroLinesTitle(String district);

  /// No description provided for @metroLineTo.
  ///
  /// In en, this message translates to:
  /// **'To {district}'**
  String metroLineTo(String district);

  /// No description provided for @metroOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get metroOpen;

  /// No description provided for @metroDig.
  ///
  /// In en, this message translates to:
  /// **'Dig · {price}'**
  String metroDig(String price);

  /// No description provided for @metroWaitingThere.
  ///
  /// In en, this message translates to:
  /// **'Waiting there: {minutes} min'**
  String metroWaitingThere(int minutes);

  /// No description provided for @levelBarGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal {done}/{total}'**
  String levelBarGoal(int done, int total);

  /// No description provided for @levelBarComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get levelBarComplete;

  /// No description provided for @goalTitle.
  ///
  /// In en, this message translates to:
  /// **'City goal'**
  String get goalTitle;

  /// No description provided for @goalLevel.
  ///
  /// In en, this message translates to:
  /// **'Reach level {level}'**
  String goalLevel(int level);

  /// No description provided for @goalLevelProgress.
  ///
  /// In en, this message translates to:
  /// **'Level {level}/{target}'**
  String goalLevelProgress(int level, int target);

  /// No description provided for @goalTechnologies.
  ///
  /// In en, this message translates to:
  /// **'Unlock every technology'**
  String get goalTechnologies;

  /// No description provided for @goalTechnologyProgress.
  ///
  /// In en, this message translates to:
  /// **'{count}/{total}'**
  String goalTechnologyProgress(int count, int total);

  /// No description provided for @goalHappiness.
  ///
  /// In en, this message translates to:
  /// **'Make citizens {percent}% happy'**
  String goalHappiness(int percent);

  /// No description provided for @goalHappinessProgress.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String goalHappinessProgress(int percent);

  /// No description provided for @goalUnlocks.
  ///
  /// In en, this message translates to:
  /// **'Complete {city} to unlock {next}.'**
  String goalUnlocks(String city, String next);

  /// No description provided for @cityCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'{city} is complete!'**
  String cityCompleteTitle(String city);

  /// No description provided for @cityCompleteBody.
  ///
  /// In en, this message translates to:
  /// **'Every technology is yours and citizens love their city. New cities are coming soon!'**
  String get cityCompleteBody;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
