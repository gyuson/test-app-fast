// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_cat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$proUserHash() => r'13bd6c110c4867d8011223c7d9b275b067114b14';

/// See also [proUser].
@ProviderFor(proUser)
final proUserProvider = AutoDisposeFutureProvider<bool>.internal(
  proUser,
  name: r'proUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$proUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProUserRef = AutoDisposeFutureProviderRef<bool>;
String _$customerInfoHash() => r'2913979dc18f19090acda9f586076ccae80666bf';

/// See also [customerInfo].
@ProviderFor(customerInfo)
final customerInfoProvider = AutoDisposeFutureProvider<CustomerInfo>.internal(
  customerInfo,
  name: r'customerInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$customerInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CustomerInfoRef = AutoDisposeFutureProviderRef<CustomerInfo>;
String _$restorePurchaseHash() => r'b5b5fa3c60b9c05a6804185a7a26970b50bf8357';

/// See also [restorePurchase].
@ProviderFor(restorePurchase)
final restorePurchaseProvider =
    AutoDisposeFutureProvider<CustomerInfo?>.internal(
  restorePurchase,
  name: r'restorePurchaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$restorePurchaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RestorePurchaseRef = AutoDisposeFutureProviderRef<CustomerInfo?>;
String _$offeringsControllerHash() =>
    r'f6683314dfeecc3550ec776a34b4dcbaecb9318c';

/// See also [OfferingsController].
@ProviderFor(OfferingsController)
final offeringsControllerProvider =
    AsyncNotifierProvider<OfferingsController, Offerings?>.internal(
  OfferingsController.new,
  name: r'offeringsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$offeringsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OfferingsController = AsyncNotifier<Offerings?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
