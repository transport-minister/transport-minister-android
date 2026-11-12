import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

void main() {
  test('the game keeps its name in every language', () {
    for (final locale in AppLocalizations.supportedLocales) {
      final l10n = lookupAppLocalizations(locale);

      expect(l10n.appTitle, 'Transport Minister', reason: locale.languageCode);
      expect(l10n.splashTitleTop, 'Transport', reason: locale.languageCode);
      expect(l10n.splashTitleBottom, 'Minister', reason: locale.languageCode);
    }
  });

  test('every supported language is offered', () {
    expect(
      AppLocalizations.supportedLocales.map((locale) => locale.languageCode),
      containsAll(const ['en', 'tr', 'ru']),
    );
    expect(lookupAppLocalizations(const Locale('tr')).settingsTitle, 'Ayarlar');
    expect(lookupAppLocalizations(const Locale('ru')).settingsTitle, 'Настройки');
  });
}
