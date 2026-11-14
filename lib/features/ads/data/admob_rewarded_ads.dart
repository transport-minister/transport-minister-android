import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:transport_minister/features/ads/data/ad_units.dart';
import 'package:transport_minister/features/ads/domain/rewarded_ads.dart';

class AdmobRewardedAds implements RewardedAds {
  AdmobRewardedAds({this.adUnitId = AdUnits.rewarded});

  final String adUnitId;

  static const _retryAfter = Duration(seconds: 30);

  final _availability = StreamController<bool>.broadcast();
  Future<bool>? _allowed;
  RewardedAd? _ad;
  Timer? _retry;
  var _loading = false;

  @override
  Stream<bool> get availability => _availability.stream;

  @override
  bool get isAvailable => _ad != null;

  @override
  Future<void> prepare() async {
    if (await (_allowed ??= _askConsent())) {
      await _load();
    }
  }

  @override
  Future<AdResult> show() async {
    final ad = _ad;
    if (ad == null) {
      unawaited(prepare());
      return AdResult.unavailable;
    }
    _ad = null;
    _availability.add(false);
    final finished = Completer<AdResult>();
    var rewarded = false;
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        finished.complete(rewarded ? AdResult.rewarded : AdResult.dismissed);
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        finished.complete(AdResult.unavailable);
      },
    );
    try {
      await ad.show(onUserEarnedReward: (ad, reward) => rewarded = true);
    } on Exception catch (error) {
      debugPrint('Rewarded ad could not show: $error');
      if (!finished.isCompleted) {
        finished.complete(AdResult.unavailable);
      }
    }
    final result = await finished.future;
    unawaited(_load());
    return result;
  }

  @override
  void dispose() {
    _retry?.cancel();
    _ad?.dispose();
    _availability.close();
  }

  Future<bool> _askConsent() async {
    final consent = Completer<bool>();
    Future<void> settle() async {
      if (!consent.isCompleted) {
        consent.complete(await ConsentInformation.instance.canRequestAds());
      }
    }

    try {
      ConsentInformation.instance.requestConsentInfoUpdate(
        ConsentRequestParameters(),
        () => ConsentForm.loadAndShowConsentFormIfRequired((error) => settle()),
        (error) => settle(),
      );
      if (!await consent.future) {
        return false;
      }
      await MobileAds.instance.initialize();
      return true;
    } on Exception catch (error) {
      debugPrint('Ads unavailable: $error');
      return false;
    }
  }

  Future<void> _load() async {
    if (_loading || _ad != null) {
      return;
    }
    _loading = true;
    _retry?.cancel();
    try {
      await RewardedAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            _loading = false;
            _ad = ad;
            _availability.add(true);
          },
          onAdFailedToLoad: (error) {
            _loading = false;
            _availability.add(false);
            _retry = Timer(_retryAfter, _load);
          },
        ),
      );
    } on Exception catch (error) {
      _loading = false;
      debugPrint('Rewarded ad could not load: $error');
    }
  }
}
