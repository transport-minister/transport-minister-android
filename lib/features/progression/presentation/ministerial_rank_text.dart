import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

extension MinisterialRankText on MinisterialRank {
  String title(AppLocalizations l10n) => switch (this) {
    MinisterialRank.juniorOfficial => l10n.rankJuniorOfficial,
    MinisterialRank.inspector => l10n.rankInspector,
    MinisterialRank.director => l10n.rankDirector,
    MinisterialRank.deputyMinister => l10n.rankDeputyMinister,
    MinisterialRank.minister => l10n.rankMinister,
    MinisterialRank.seniorMinister => l10n.rankSeniorMinister,
    MinisterialRank.regionalGovernor => l10n.rankRegionalGovernor,
    MinisterialRank.nationalLeader => l10n.rankNationalLeader,
    MinisterialRank.internationalAuthority => l10n.rankInternationalAuthority,
  };
}
