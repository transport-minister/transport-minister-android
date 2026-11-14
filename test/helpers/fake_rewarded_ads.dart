import 'dart:async';

import 'package:transport_minister/features/ads/domain/rewarded_ads.dart';

class FakeRewardedAds implements RewardedAds {
  FakeRewardedAds({this.available = true, this.result = AdResult.rewarded});

  bool available;
  AdResult result;
  var shows = 0;
  var prepared = 0;

  final _availability = StreamController<bool>.broadcast();

  @override
  Stream<bool> get availability => _availability.stream;

  @override
  bool get isAvailable => available;

  void setAvailable(bool value) {
    available = value;
    _availability.add(value);
  }

  @override
  Future<void> prepare() async => prepared++;

  @override
  Future<AdResult> show() async {
    shows++;
    return available ? result : AdResult.unavailable;
  }

  @override
  void dispose() {
    _availability.close();
  }
}
