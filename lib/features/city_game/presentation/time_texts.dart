import 'package:transport_minister/l10n/generated/app_localizations.dart';

abstract final class TimeTexts {
  static String duration(AppLocalizations l10n, int seconds) {
    if (seconds < 60) {
      return l10n.timeSeconds(seconds < 0 ? 0 : seconds);
    }
    final minutes = seconds ~/ 60;
    final rest = seconds % 60;
    if (minutes >= 60) {
      return l10n.timeHoursMinutes(minutes ~/ 60, minutes % 60);
    }
    return rest == 0 ? l10n.timeMinutes(minutes) : l10n.timeMinutesSeconds(minutes, rest);
  }
}
