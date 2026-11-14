import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transport_minister/core/storage/in_memory_document_store.dart';
import 'package:transport_minister/core/storage/storage_providers.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/progression/data/local_profile_repository.dart';
import 'package:transport_minister/features/progression/domain/minister_profile.dart';
import 'package:transport_minister/features/shop/application/shop_providers.dart';
import 'package:transport_minister/features/shop/domain/diamond_pack.dart';
import 'package:transport_minister/features/shop/domain/diamond_store.dart';
import 'package:transport_minister/features/shop/presentation/shop_screen.dart';

import '../../helpers/fake_diamond_store.dart';
import '../../helpers/fake_now.dart';
import '../../helpers/fake_rewarded_ads.dart';
import '../../helpers/game_screen_harness.dart';

void main() {
  late InMemoryDocumentStore store;
  late FakeDiamondStore billing;
  final now = FakeNow(DateTime(2026, 11, 14, 9));

  setUp(() async {
    store = InMemoryDocumentStore();
    billing = FakeDiamondStore();
    await LocalProfileRepository(store)
        .save(const MinisterProfile(tutorialDone: true, diamonds: 5));
  });

  test('a delivered pack is credited, remembered and starts the starter boost', () async {
    final container = ProviderContainer(
      overrides: [
        documentStoreProvider.overrideWithValue(store),
        diamondStoreProvider.overrideWithValue(billing),
      ],
    );
    addTearDown(container.dispose);
    await container.read(profileProvider.future);
    await container.read(cityGameProvider(CityId.baku).future);

    final outcome = await container.read(shopProvider).buy(DiamondPack.starter, city: CityId.baku);
    await Future<void>.delayed(Duration.zero);
    final profile = container.read(profileProvider).requireValue;

    expect(outcome, PurchaseOutcome.delivered);
    expect(profile.diamonds, 5 + DiamondPack.starter.diamonds);
    expect(profile.packsBought, {DiamondPack.starter});
    expect(
      container.read(cityGameProvider(CityId.baku)).requireValue.city.boostSecondsLeft,
      DiamondPack.starter.boostMinutes * 60,
    );
  });

  testWidgets('the shop sells packs with Play prices and thanks the buyer', (tester) async {
    await pumpGameScreen(
      tester,
      const ShopScreen(cityId: CityId.baku),
      store: store,
      now: now,
      store_: billing,
    );

    expect(find.text('Starter pack'), findsOneWidget);
    expect(find.text(r'$4.99'), findsOneWidget);
    expect(find.text('Diamond mine'), findsOneWidget);

    await tester.tap(find.text(r'$4.99'));
    await tester.pumpAndSettle();

    expect(billing.bought, [DiamondPack.bag]);
    expect(find.text('Thank you, Minister!'), findsOneWidget);
    expect((await LocalProfileRepository(store).load())?.diamonds, 5 + DiamondPack.bag.diamonds);
  });

  testWidgets('without Google Play the shop still offers free diamonds', (tester) async {
    await pumpGameScreen(
      tester,
      const ShopScreen(cityId: CityId.baku),
      store: store,
      now: now,
      store_: FakeDiamondStore(available: false),
    );

    expect(find.textContaining('Google Play is not available'), findsOneWidget);
    expect(find.text('Soon'), findsNWidgets(4));

    await tester.scrollUntilVisible(find.text('Diamond mine'), 200);

    expect(find.text('Diamond mine'), findsOneWidget);
  });

  testWidgets('the diamond mine pays two diamonds per video', (tester) async {
    await pumpGameScreen(
      tester,
      const ShopScreen(cityId: CityId.baku),
      store: store,
      now: now,
      ads: FakeRewardedAds(),
      store_: billing,
    );

    await tester.scrollUntilVisible(find.text('Watch'), 200);
    await tester.tap(find.text('Watch'));
    await tester.pumpAndSettle();

    expect(find.text('+2 for a short video · 2 left today'), findsOneWidget);
    expect((await LocalProfileRepository(store).load())?.diamonds, 7);
  });
}
