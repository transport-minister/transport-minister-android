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
  String dashboardWelcome(String city) {
    return 'Welcome to $city, Minister!';
  }
}
