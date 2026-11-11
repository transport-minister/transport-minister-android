enum MinisterialRank {
  juniorOfficial,
  inspector,
  director,
  deputyMinister,
  minister,
  seniorMinister,
  regionalGovernor,
  nationalLeader,
  internationalAuthority;

  int get level => index + 1;

  bool isAtLeast(MinisterialRank other) => index >= other.index;
}
