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

  /// No description provided for @dashboardWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {city}, Minister!'**
  String dashboardWelcome(String city);
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
