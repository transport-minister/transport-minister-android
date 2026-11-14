enum AdResult { rewarded, dismissed, unavailable }

abstract interface class RewardedAds {
  Stream<bool> get availability;

  bool get isAvailable;

  Future<void> prepare();

  Future<AdResult> show();

  void dispose();
}

class NoRewardedAds implements RewardedAds {
  const NoRewardedAds();

  @override
  Stream<bool> get availability => const Stream.empty();

  @override
  bool get isAvailable => false;

  @override
  Future<void> prepare() async {}

  @override
  Future<AdResult> show() async => AdResult.unavailable;

  @override
  void dispose() {}
}
