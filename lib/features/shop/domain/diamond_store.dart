import 'package:transport_minister/features/shop/domain/diamond_pack.dart';

enum PurchaseOutcome { delivered, cancelled, failed, unavailable }

class StoreOffer {
  const StoreOffer({required this.pack, required this.price});

  final DiamondPack pack;
  final String price;
}

abstract interface class DiamondStore {
  Stream<DiamondPack> get deliveries;

  Future<List<StoreOffer>> offers();

  Future<PurchaseOutcome> buy(DiamondPack pack);

  void dispose();
}

class NoDiamondStore implements DiamondStore {
  const NoDiamondStore();

  @override
  Stream<DiamondPack> get deliveries => const Stream.empty();

  @override
  Future<List<StoreOffer>> offers() async => const [];

  @override
  Future<PurchaseOutcome> buy(DiamondPack pack) async => PurchaseOutcome.unavailable;

  @override
  void dispose() {}
}
