import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

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
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

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

  /// No description provided for @cityStatusLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get cityStatusLocked;

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

  /// No description provided for @hudDay.
  ///
  /// In en, this message translates to:
  /// **'Day {day}'**
  String hudDay(int day);

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

  /// No description provided for @hudSatisfactionLabel.
  ///
  /// In en, this message translates to:
  /// **'Satisfaction'**
  String get hudSatisfactionLabel;

  /// No description provided for @hudBackToCities.
  ///
  /// In en, this message translates to:
  /// **'Cities'**
  String get hudBackToCities;

  /// No description provided for @crisisAngry.
  ///
  /// In en, this message translates to:
  /// **'Citizens are getting angry. Act before the President notices!'**
  String get crisisAngry;

  /// No description provided for @crisisWarning.
  ///
  /// In en, this message translates to:
  /// **'President\'s warning {level}/3: raise satisfaction or fix the budget!'**
  String crisisWarning(int level);

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
  /// **'Buses can carry {capacity} of {demand} riders a day'**
  String districtRidersServed(String capacity, String demand);

  /// No description provided for @districtFeatureBikeLanes.
  ///
  /// In en, this message translates to:
  /// **'Bike lanes'**
  String get districtFeatureBikeLanes;

  /// No description provided for @districtFeatureSignals.
  ///
  /// In en, this message translates to:
  /// **'Smart lights'**
  String get districtFeatureSignals;

  /// No description provided for @districtFeatureStops.
  ///
  /// In en, this message translates to:
  /// **'Modern stops'**
  String get districtFeatureStops;

  /// No description provided for @districtDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{project}: {days, plural, =1{1 day left} other{{days} days left}}'**
  String districtDaysLeft(String project, int days);

  /// No description provided for @actionAddBus.
  ///
  /// In en, this message translates to:
  /// **'Add bus · {price}'**
  String actionAddBus(String price);

  /// No description provided for @actionRepairRoad.
  ///
  /// In en, this message translates to:
  /// **'Repair road · {price}'**
  String actionRepairRoad(String price);

  /// No description provided for @reportTitle.
  ///
  /// In en, this message translates to:
  /// **'Yesterday\'s money'**
  String get reportTitle;

  /// No description provided for @reportEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your first day is underway. Reports arrive every minute.'**
  String get reportEmpty;

  /// No description provided for @reportNet.
  ///
  /// In en, this message translates to:
  /// **'Net {amount}'**
  String reportNet(String amount);

  /// No description provided for @reportSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get reportSeeAll;

  /// No description provided for @reportSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Day {day} budget'**
  String reportSheetTitle(int day);

  /// No description provided for @reportBudgetAfter.
  ///
  /// In en, this message translates to:
  /// **'Budget after the day: {amount}'**
  String reportBudgetAfter(String amount);

  /// No description provided for @ledgerTickets.
  ///
  /// In en, this message translates to:
  /// **'Ticket sales'**
  String get ledgerTickets;

  /// No description provided for @ledgerSubsidy.
  ///
  /// In en, this message translates to:
  /// **'Daily subsidy'**
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

  /// No description provided for @eventBusPurchased.
  ///
  /// In en, this message translates to:
  /// **'Bus ordered! It joins the fleet tomorrow.'**
  String get eventBusPurchased;

  /// No description provided for @eventBusUpgraded.
  ///
  /// In en, this message translates to:
  /// **'Bus upgraded to level {level}'**
  String eventBusUpgraded(int level);

  /// No description provided for @eventBusesDelivered.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{A new bus joined the fleet} other{{count} new buses joined the fleet}}'**
  String eventBusesDelivered(int count);

  /// No description provided for @eventProjectStarted.
  ///
  /// In en, this message translates to:
  /// **'{project}: construction started'**
  String eventProjectStarted(String project);

  /// No description provided for @eventProjectCompleted.
  ///
  /// In en, this message translates to:
  /// **'{project} is ready!'**
  String eventProjectCompleted(String project);

  /// No description provided for @eventBudgetAllocated.
  ///
  /// In en, this message translates to:
  /// **'The Cabinet sent {amount} for this month'**
  String eventBudgetAllocated(String amount);

  /// No description provided for @eventLoanRepaid.
  ///
  /// In en, this message translates to:
  /// **'Loan fully repaid'**
  String get eventLoanRepaid;

  /// No description provided for @eventCrisisWarning.
  ///
  /// In en, this message translates to:
  /// **'President\'s warning {level}/3'**
  String eventCrisisWarning(int level);

  /// No description provided for @awayTitle.
  ///
  /// In en, this message translates to:
  /// **'While you were away'**
  String get awayTitle;

  /// No description provided for @awayDays.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 day passed in Baku} other{{days} days passed in Baku}}'**
  String awayDays(int days);

  /// No description provided for @awayCapped.
  ///
  /// In en, this message translates to:
  /// **'The city paused after a week to wait for you.'**
  String get awayCapped;

  /// No description provided for @awayBudget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get awayBudget;

  /// No description provided for @awaySatisfaction.
  ///
  /// In en, this message translates to:
  /// **'Satisfaction'**
  String get awaySatisfaction;

  /// No description provided for @awayBusesDelivered.
  ///
  /// In en, this message translates to:
  /// **'Buses delivered'**
  String get awayBusesDelivered;

  /// No description provided for @awayProjectsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Projects finished'**
  String get awayProjectsCompleted;

  /// No description provided for @awayContinue.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go!'**
  String get awayContinue;

  /// No description provided for @dismissedTitle.
  ///
  /// In en, this message translates to:
  /// **'You have been dismissed'**
  String get dismissedTitle;

  /// No description provided for @dismissedBody.
  ///
  /// In en, this message translates to:
  /// **'Baku lost faith in your leadership. Your rank and achievements stay with you. Try again with a fresh start!'**
  String get dismissedBody;

  /// No description provided for @dismissedRestart.
  ///
  /// In en, this message translates to:
  /// **'Start over'**
  String get dismissedRestart;

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

  /// No description provided for @trafficSmooth.
  ///
  /// In en, this message translates to:
  /// **'Smooth'**
  String get trafficSmooth;

  /// No description provided for @trafficBusy.
  ///
  /// In en, this message translates to:
  /// **'Busy'**
  String get trafficBusy;

  /// No description provided for @trafficJammed.
  ///
  /// In en, this message translates to:
  /// **'Jam'**
  String get trafficJammed;

  /// No description provided for @mrBusName.
  ///
  /// In en, this message translates to:
  /// **'Mr. Bus'**
  String get mrBusName;

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
  /// **'Reach level {level} in {city} to unlock it.'**
  String cityLockedBody(int level, String city);

  /// No description provided for @cityRequirement.
  ///
  /// In en, this message translates to:
  /// **'Lv {level} in {city}'**
  String cityRequirement(int level, String city);

  /// No description provided for @cityStatusUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Unlocked'**
  String get cityStatusUnlocked;

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

  /// No description provided for @eventCityLeveledUp.
  ///
  /// In en, this message translates to:
  /// **'City level {level}! Reward {amount}'**
  String eventCityLeveledUp(int level, String amount);

  /// No description provided for @levelBarLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String levelBarLabel(int level);

  /// No description provided for @levelBarPoints.
  ///
  /// In en, this message translates to:
  /// **'{points} / {next} DP'**
  String levelBarPoints(int points, int next);

  /// No description provided for @levelBarMax.
  ///
  /// In en, this message translates to:
  /// **'Max level reached'**
  String get levelBarMax;

  /// No description provided for @levelBarTarget.
  ///
  /// In en, this message translates to:
  /// **'Target {target}'**
  String levelBarTarget(int target);

  /// No description provided for @levelSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'{city} development'**
  String levelSheetTitle(String city);

  /// No description provided for @levelSheetBody.
  ///
  /// In en, this message translates to:
  /// **'Earn development points (DP) every day by keeping citizens happy and the budget positive. New buses, upgrades and finished projects give extra DP. Each level pays a reward from the Cabinet.'**
  String get levelSheetBody;

  /// No description provided for @levelSheetTarget.
  ///
  /// In en, this message translates to:
  /// **'Reach level {target} to unlock {city}!'**
  String levelSheetTarget(int target, String city);

  /// No description provided for @levelSheetTargetDone.
  ///
  /// In en, this message translates to:
  /// **'Target reached! Your next city is unlocked.'**
  String get levelSheetTargetDone;

  /// No description provided for @levelUpTitle.
  ///
  /// In en, this message translates to:
  /// **'{city} reached level {level}!'**
  String levelUpTitle(String city, int level);

  /// No description provided for @levelUpReward.
  ///
  /// In en, this message translates to:
  /// **'The Cabinet sends a bonus of {amount}.'**
  String levelUpReward(String amount);

  /// No description provided for @levelUpUnlocked.
  ///
  /// In en, this message translates to:
  /// **'{city} is unlocked! It opens soon.'**
  String levelUpUnlocked(String city);

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

  /// No description provided for @profileNextRank.
  ///
  /// In en, this message translates to:
  /// **'Next: {rank} · needs {reputation}% reputation'**
  String profileNextRank(String rank, int reputation);

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

  /// No description provided for @careerDays.
  ///
  /// In en, this message translates to:
  /// **'Days served'**
  String get careerDays;

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
  /// **'Keep a positive daily budget for 30 days in a row.'**
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
  /// **'Reach a city\'s target level.'**
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
  /// **'Serve 365 days.'**
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

  /// No description provided for @decisionDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =0{Decide today} =1{1 day left} other{{days} days left}}'**
  String decisionDaysLeft(int days);

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

  /// No description provided for @effectDailyCost.
  ///
  /// In en, this message translates to:
  /// **'Costs {amount}/day'**
  String effectDailyCost(String amount);

  /// No description provided for @effectDailyIncome.
  ///
  /// In en, this message translates to:
  /// **'Income {amount}/day'**
  String effectDailyIncome(String amount);

  /// No description provided for @effectMoodTrend.
  ///
  /// In en, this message translates to:
  /// **'{group} mood {change}'**
  String effectMoodTrend(String group, String change);

  /// No description provided for @effectDays.
  ///
  /// In en, this message translates to:
  /// **'{days}d'**
  String effectDays(int days);

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

  /// No description provided for @effectMoney.
  ///
  /// In en, this message translates to:
  /// **'{amount}'**
  String effectMoney(String amount);

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
  /// **'Extra shifts for 5 days'**
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
  /// **'Emergency repair today'**
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
  /// **'Raise wages 15% forever'**
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
  /// **'Diesel got expensive overnight, and our buses drink a lot of it...'**
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
  /// **'Silkway Motors offers CityRunner buses at 25% off this week. They would start in {district}.'**
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

  /// No description provided for @taskRunDays.
  ///
  /// In en, this message translates to:
  /// **'Run the city for {count} days'**
  String taskRunDays(int count);

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
  /// **'This is your budget. Tickets and the Cabinet fill it. Fuel, wages and repairs drain it.'**
  String get tutorialBudget;

  /// No description provided for @tutorialMood.
  ///
  /// In en, this message translates to:
  /// **'This heart shows how happy citizens are. Below 30% for too long and the President fires you!'**
  String get tutorialMood;

  /// No description provided for @tutorialClock.
  ///
  /// In en, this message translates to:
  /// **'A day passes every minute, even while you are away, for up to a week.'**
  String get tutorialClock;

  /// No description provided for @tutorialDistrict.
  ///
  /// In en, this message translates to:
  /// **'People in {district} wait the longest. Tap it!'**
  String tutorialDistrict(String district);

  /// No description provided for @tutorialBuyBus.
  ///
  /// In en, this message translates to:
  /// **'Tap Add bus. New buses cut waiting times!'**
  String get tutorialBuyBus;

  /// No description provided for @tutorialBusBought.
  ///
  /// In en, this message translates to:
  /// **'Your bus arrives tomorrow. Faster service means happier citizens and more money!'**
  String get tutorialBusBought;

  /// No description provided for @tutorialLevel.
  ///
  /// In en, this message translates to:
  /// **'Baku grows as you play. Reach level 10 to unlock Istanbul!'**
  String get tutorialLevel;

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

  /// No description provided for @tutorialProfile.
  ///
  /// In en, this message translates to:
  /// **'Climb nine ranks and collect achievements and city badges. Good luck, Minister!'**
  String get tutorialProfile;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
