import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:transport_minister/core/design/game_theme.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/core/time/clock_providers.dart';
import 'package:transport_minister/features/ads/application/ads_providers.dart';
import 'package:transport_minister/features/ads/domain/rewarded_ads.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/shop/application/shop_providers.dart';
import 'package:transport_minister/features/shop/domain/diamond_store.dart';
import 'package:transport_minister/features/sound/application/sound_providers.dart';
import 'package:transport_minister/features/sound/domain/sound_output.dart';
import 'package:transport_minister/l10n/generated/app_localizations.dart';

import 'fake_diamond_store.dart';
import 'fake_now.dart';
import 'fake_rewarded_ads.dart';
import 'fake_sound_output.dart';
import 'phone_viewport.dart';

Future<void> pumpGameScreen(
  WidgetTester tester,
  Widget screen, {
  required InMemoryDocumentStore store,
  required FakeNow now,
  List<Override> overrides = const [],
  bool tutorialDone = true,
  Locale? locale,
  SoundOutput? sound,
  RewardedAds? ads,
  DiamondStore? store_,
}) async {
  final profiles = LocalProfileRepository(store);
  if (tutorialDone && await profiles.load() == null) {
    await profiles.save(const MinisterProfile(tutorialDone: true));
  }
  usePhoneViewport(tester);
  tester.platformDispatcher.accessibilityFeaturesTestValue = const FakeAccessibilityFeatures(
    disableAnimations: true,
  );
  addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        documentStoreProvider.overrideWithValue(store),
        nowProvider.overrideWithValue(now.call),
        tickIntervalProvider.overrideWithValue(const Duration(hours: 1)),
        soundOutputProvider.overrideWithValue(sound ?? FakeSoundOutput()),
        rewardedAdsProvider.overrideWithValue(ads ?? FakeRewardedAds(available: false)),
        diamondStoreProvider.overrideWithValue(store_ ?? FakeDiamondStore(available: false)),
        ...overrides,
      ],
      child: MaterialApp(
        locale: locale,
        theme: GameTheme.light(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: screen,
      ),
    ),
  );
  await tester.pumpAndSettle();
}
