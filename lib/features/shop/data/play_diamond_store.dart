import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:transport_minister/features/shop/domain/diamond_pack.dart';
import 'package:transport_minister/features/shop/domain/diamond_store.dart';

class PlayDiamondStore implements DiamondStore {
  PlayDiamondStore({InAppPurchase? billing}) : _billing = billing ?? InAppPurchase.instance {
    _subscription = _billing.purchaseStream.listen(
      _onPurchases,
      onError: (Object error) => _settle(PurchaseOutcome.failed),
    );
  }

  final InAppPurchase _billing;
  final _deliveries = StreamController<DiamondPack>.broadcast();
  late final StreamSubscription<List<PurchaseDetails>> _subscription;
  var _products = <String, ProductDetails>{};
  Completer<PurchaseOutcome>? _pending;
  String? _pendingProduct;

  @override
  Stream<DiamondPack> get deliveries => _deliveries.stream;

  @override
  Future<List<StoreOffer>> offers() async {
    try {
      if (!await _billing.isAvailable()) {
        return const [];
      }
      final response = await _billing.queryProductDetails({
        for (final pack in DiamondPack.values) pack.productId,
      });
      _products = {for (final product in response.productDetails) product.id: product};
      return [
        for (final pack in DiamondPack.values)
          if (_products[pack.productId] case final product?)
            StoreOffer(pack: pack, price: product.price),
      ];
    } on Exception catch (error) {
      debugPrint('Store unavailable: $error');
      return const [];
    }
  }

  @override
  Future<PurchaseOutcome> buy(DiamondPack pack) async {
    if (_pending != null) {
      return PurchaseOutcome.unavailable;
    }
    final product = _products[pack.productId] ?? await _lookUp(pack);
    if (product == null) {
      return PurchaseOutcome.unavailable;
    }
    final completer = Completer<PurchaseOutcome>();
    _pending = completer;
    _pendingProduct = pack.productId;
    try {
      final started = await _billing.buyConsumable(
        purchaseParam: PurchaseParam(productDetails: product),
      );
      if (!started) {
        _settle(PurchaseOutcome.failed);
      }
    } on Exception catch (error) {
      debugPrint('Purchase could not start: $error');
      _settle(PurchaseOutcome.failed);
    }
    return completer.future;
  }

  @override
  void dispose() {
    _subscription.cancel();
    _deliveries.close();
  }

  Future<ProductDetails?> _lookUp(DiamondPack pack) async {
    await offers();
    return _products[pack.productId];
  }

  void _onPurchases(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      if (purchase.pendingCompletePurchase) {
        unawaited(_billing.completePurchase(purchase));
      }
      switch (purchase.status) {
        case PurchaseStatus.pending:
          break;
        case PurchaseStatus.purchased || PurchaseStatus.restored:
          final pack = DiamondPack.values
              .where((pack) => pack.productId == purchase.productID)
              .firstOrNull;
          if (pack != null) {
            _deliveries.add(pack);
          }
          if (purchase.productID == _pendingProduct) {
            _settle(PurchaseOutcome.delivered);
          }
        case PurchaseStatus.error:
          if (purchase.productID == _pendingProduct) {
            _settle(PurchaseOutcome.failed);
          }
        case PurchaseStatus.canceled:
          if (purchase.productID == _pendingProduct) {
            _settle(PurchaseOutcome.cancelled);
          }
      }
    }
  }

  void _settle(PurchaseOutcome outcome) {
    final pending = _pending;
    _pending = null;
    _pendingProduct = null;
    if (pending != null && !pending.isCompleted) {
      pending.complete(outcome);
    }
  }
}
