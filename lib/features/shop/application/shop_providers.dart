import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_minister/core/simulation/engine/city_commands.dart';
import 'package:transport_minister/features/city_game/application/city_game_providers.dart';
import 'package:transport_minister/features/city_selection/domain/city.dart';
import 'package:transport_minister/features/progression/application/profile_controller.dart';
import 'package:transport_minister/features/shop/domain/diamond_pack.dart';
import 'package:transport_minister/features/shop/domain/diamond_store.dart';

final diamondStoreProvider = Provider<DiamondStore>((ref) => const NoDiamondStore());

final storeOffersProvider = FutureProvider<List<StoreOffer>>(
  (ref) => ref.watch(diamondStoreProvider).offers(),
);

final shopProvider = Provider<Shop>((ref) {
  final shop = Shop(ref);
  ref.onDispose(shop.dispose);
  return shop;
});

class Shop {
  Shop(this._ref) {
    _subscription = _ref.read(diamondStoreProvider).deliveries.listen(_deliver);
  }

  final Ref _ref;
  late final StreamSubscription<DiamondPack> _subscription;
  CityId? _city;

  Future<PurchaseOutcome> buy(DiamondPack pack, {CityId? city}) {
    _city = city ?? _city;
    return _ref.read(diamondStoreProvider).buy(pack);
  }

  void dispose() {
    _subscription.cancel();
  }

  Future<void> _deliver(DiamondPack pack) async {
    final profile = _ref.read(profileProvider.notifier);
    await profile.addDiamonds(pack.diamonds);
    if (pack.once) {
      await profile.markPackBought(pack);
    }
    final city = _city;
    if (pack.boostMinutes > 0 && city != null) {
      await _ref
          .read(cityGameProvider(city).notifier)
          .perform(
            (state) => const CityCommands().boostEarnings(state, seconds: pack.boostMinutes * 60),
          );
    }
  }
}
