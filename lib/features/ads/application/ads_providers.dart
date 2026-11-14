import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/features/ads/domain/rewarded_ads.dart';

final rewardedAdsProvider = Provider<RewardedAds>((ref) => const NoRewardedAds());

final rewardedAdAvailabilityProvider = StreamProvider<bool>(
  (ref) => ref.watch(rewardedAdsProvider).availability,
);

final adReadyProvider = Provider<bool>(
  (ref) =>
      ref.watch(rewardedAdAvailabilityProvider).value ?? ref.watch(rewardedAdsProvider).isAvailable,
);
