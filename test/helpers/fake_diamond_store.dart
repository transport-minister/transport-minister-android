import 'dart:async';

import 'package:transport_minister/features/shop/domain/diamond_pack.dart';
import 'package:transport_minister/features/shop/domain/diamond_store.dart';

class FakeDiamondStore implements DiamondStore {
  FakeDiamondStore({this.available = true, this.outcome = PurchaseOutcome.delivered});

  bool available;
  PurchaseOutcome outcome;
  final bought = <DiamondPack>[];

  final _deliveries = StreamController<DiamondPack>.broadcast();

  static const prices = {
    DiamondPack.starter: r'$1.99',
    DiamondPack.handful: r'$0.99',
    DiamondPack.bag: r'$4.99',
    DiamondPack.chest: r'$9.99',
  };

  @override
  Stream<DiamondPack> get deliveries => _deliveries.stream;

  @override
  Future<List<StoreOffer>> offers() async => available
      ? [for (final pack in DiamondPack.values) StoreOffer(pack: pack, price: prices[pack]!)]
      : const [];

  @override
  Future<PurchaseOutcome> buy(DiamondPack pack) async {
    if (!available) {
      return PurchaseOutcome.unavailable;
    }
    bought.add(pack);
    if (outcome == PurchaseOutcome.delivered) {
      _deliveries.add(pack);
      await Future<void>.delayed(Duration.zero);
    }
    return outcome;
  }

  void deliver(DiamondPack pack) => _deliveries.add(pack);

  @override
  void dispose() {
    _deliveries.close();
  }
}
