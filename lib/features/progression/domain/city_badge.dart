enum BadgeTier {
  bronze(level: 3),
  silver(level: 6),
  gold(level: 10);

  const BadgeTier({required this.level});

  final int level;

  static BadgeTier? forLevel(int level) {
    BadgeTier? earned;
    for (final tier in values) {
      if (level >= tier.level) {
        earned = tier;
      }
    }
    return earned;
  }
}
