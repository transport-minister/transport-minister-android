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

  /// No description provided for @citySectionComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get citySectionComingSoon;

  /// No description provided for @citySectionLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked cities'**
  String get citySectionLocked;

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

  /// No description provided for @cityLockedBody.
  ///
  /// In en, this message translates to:
  /// **'Reach the rank of {rank} to unlock this city.'**
  String cityLockedBody(String rank);

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
