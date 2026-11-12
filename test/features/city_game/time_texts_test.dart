import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/features/city_game/presentation/time_texts.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

void main() {
  final l10n = lookupAppLocalizations(const Locale('en'));

  test('durations read in seconds, minutes and hours', () {
    expect(TimeTexts.duration(l10n, 45), '45s');
    expect(TimeTexts.duration(l10n, 60), '1m');
    expect(TimeTexts.duration(l10n, 90), '1m 30s');
    expect(TimeTexts.duration(l10n, 3720), '1h 2m');
    expect(TimeTexts.duration(l10n, -5), '0s');
  });
}
