import 'package:flutter/foundation.dart';

abstract final class AdUnits {
  static const _releaseRewarded = 'ca-app-pub-7531106875262722/6116285857';

  // Google's sample unit: debug builds never request real ads.
  static const _testRewarded = 'ca-app-pub-3940256099942544/5224354917';

  static const rewarded = kReleaseMode ? _releaseRewarded : _testRewarded;
}
