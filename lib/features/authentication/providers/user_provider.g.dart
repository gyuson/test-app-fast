// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'7df923c0c08d71657ff5ddacf6bfb0c67f70ccf3';

/// See also [user].
@ProviderFor(user)
final userProvider = StreamProvider<AppUser>.internal(
  user,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRef = StreamProviderRef<AppUser>;
String _$userIdHash() => r'78e125f00172b7fdf11ecc06e6e019e39fb00e9b';

/// See also [userId].
@ProviderFor(userId)
final userIdProvider = AutoDisposeProvider<String?>.internal(
  userId,
  name: r'userIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserIdRef = AutoDisposeProviderRef<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
