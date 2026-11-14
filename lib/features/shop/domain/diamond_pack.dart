enum DiamondPack {
  starter('starter_pack', diamonds: 200, boostMinutes: 30, once: true),
  handful('diamonds_60', diamonds: 60),
  bag('diamonds_350', diamonds: 350),
  chest('diamonds_900', diamonds: 900);

  const DiamondPack(
    this.productId, {
    required this.diamonds,
    this.boostMinutes = 0,
    this.once = false,
  });

  final String productId;
  final int diamonds;
  final int boostMinutes;
  final bool once;
}
