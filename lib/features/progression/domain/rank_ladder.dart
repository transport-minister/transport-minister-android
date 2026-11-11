import 'package:transport_minister/features/progression/domain/ministerial_rank.dart';

class RankRequirement {
  const RankRequirement({required this.xp, required this.reputation});

  final int xp;
  final double reputation;
}

abstract final class RankLadder {
  static RankRequirement requirementFor(MinisterialRank rank) => switch (rank) {
    MinisterialRank.juniorOfficial => const RankRequirement(xp: 0, reputation: 0),
    MinisterialRank.inspector => const RankRequirement(xp: 300, reputation: 40),
    MinisterialRank.director => const RankRequirement(xp: 900, reputation: 45),
    MinisterialRank.deputyMinister => const RankRequirement(xp: 2000, reputation: 50),
    MinisterialRank.minister => const RankRequirement(xp: 4000, reputation: 55),
    MinisterialRank.seniorMinister => const RankRequirement(xp: 7000, reputation: 60),
    MinisterialRank.regionalGovernor => const RankRequirement(xp: 11000, reputation: 65),
    MinisterialRank.nationalLeader => const RankRequirement(xp: 16000, reputation: 70),
    MinisterialRank.internationalAuthority => const RankRequirement(xp: 23000, reputation: 75),
  };

  static MinisterialRank? next(MinisterialRank rank) {
    final index = rank.index + 1;
    return index < MinisterialRank.values.length ? MinisterialRank.values[index] : null;
  }

  static MinisterialRank earned({
    required MinisterialRank current,
    required int xp,
    required double reputation,
  }) {
    var rank = current;
    for (final candidate in MinisterialRank.values.skip(current.index + 1)) {
      final requirement = requirementFor(candidate);
      if (xp < requirement.xp || reputation < requirement.reputation) {
        break;
      }
      rank = candidate;
    }
    return rank;
  }
}
