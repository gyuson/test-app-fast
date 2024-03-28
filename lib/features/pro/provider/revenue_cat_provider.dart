import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'revenue_cat_provider.g.dart';

@riverpod
FutureOr<bool> proUser(ProUserRef ref) async {
  CustomerInfo customerInfo = await Purchases.getCustomerInfo();
  return customerInfo.activeSubscriptions.isNotEmpty;
}

@Riverpod(keepAlive: true)
class OfferingsController extends _$OfferingsController {
  @override
  Future<Offerings?> build() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        return offerings;
      }
    } on PlatformException catch (e, s) {
      // optional error handling
      state = AsyncValue.error(e, s);
    }
    return null;
  }

  Future<void> purchasePro(Package package) async {
    try {
      CustomerInfo customerInfo = await Purchases.purchasePackage(package);
      var isPro = customerInfo.activeSubscriptions.isNotEmpty;
      if (isPro) {
        ref.invalidate(proUserProvider);
      }
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        if (kDebugMode) {
          print('Error: $e');
          rethrow;
        }
      }
    }
  }
}

@riverpod
FutureOr<CustomerInfo> customerInfo(CustomerInfoRef ref) async {
  return Purchases.getCustomerInfo();
}

@riverpod
FutureOr<CustomerInfo?> restorePurchase(RestorePurchaseRef ref) async {
  try {
    return await Purchases.restorePurchases();
  } on PlatformException catch (_) {}
  return null;
}
