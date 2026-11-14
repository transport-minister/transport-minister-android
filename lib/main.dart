import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/app/transport_minister_app.dart';
import 'package:transport_minister/core/design/font_licenses.dart';
import 'package:transport_minister/features/ads/application/ads_providers.dart';
import 'package:transport_minister/features/ads/data/admob_rewarded_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FontLicenses.register();
  await SystemChrome.setPreferredOrientations(const [DeviceOrientation.portraitUp]);
  runApp(
    ProviderScope(
      overrides: [
        rewardedAdsProvider.overrideWith((ref) {
          final ads = AdmobRewardedAds();
          ref.onDispose(ads.dispose);
          return ads;
        }),
      ],
      child: const TransportMinisterApp(),
    ),
  );
}
