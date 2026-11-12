import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/simulation/model/crisis_state.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension CrisisCauseTexts on CrisisCause {
  IconData get icon => switch (this) {
    CrisisCause.gridlock => Icons.traffic_rounded,
    CrisisCause.unhappy => Icons.sentiment_dissatisfied_rounded,
    CrisisCause.debt => Icons.money_off_rounded,
  };

  String alert(AppLocalizations l10n) => switch (this) {
    CrisisCause.gridlock => l10n.crisisGridlock,
    CrisisCause.unhappy => l10n.crisisAngry,
    CrisisCause.debt => l10n.crisisDebt,
  };

  String warning(AppLocalizations l10n, int level) => switch (this) {
    CrisisCause.gridlock => l10n.crisisWarningGridlock(level),
    CrisisCause.unhappy => l10n.crisisWarningUnhappy(level),
    CrisisCause.debt => l10n.crisisWarningDebt(level),
  };

  String dismissal(AppLocalizations l10n) => switch (this) {
    CrisisCause.gridlock => l10n.dismissedGridlock,
    CrisisCause.unhappy => l10n.dismissedUnhappy,
    CrisisCause.debt => l10n.dismissedDebt,
  };
}
