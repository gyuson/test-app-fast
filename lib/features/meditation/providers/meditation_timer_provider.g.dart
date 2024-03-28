// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$meditationTimerHash() => r'0773d7f4662889e028a10a05688d426bbeb9ebc2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MeditationTimer extends BuildlessAutoDisposeNotifier<int> {
  late final int seconds;

  int build(
    int seconds,
  );
}

/// See also [MeditationTimer].
@ProviderFor(MeditationTimer)
const meditationTimerProvider = MeditationTimerFamily();

/// See also [MeditationTimer].
class MeditationTimerFamily extends Family<int> {
  /// See also [MeditationTimer].
  const MeditationTimerFamily();

  /// See also [MeditationTimer].
  MeditationTimerProvider call(
    int seconds,
  ) {
    return MeditationTimerProvider(
      seconds,
    );
  }

  @override
  MeditationTimerProvider getProviderOverride(
    covariant MeditationTimerProvider provider,
  ) {
    return call(
      provider.seconds,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'meditationTimerProvider';
}

/// See also [MeditationTimer].
class MeditationTimerProvider
    extends AutoDisposeNotifierProviderImpl<MeditationTimer, int> {
  /// See also [MeditationTimer].
  MeditationTimerProvider(
    int seconds,
  ) : this._internal(
          () => MeditationTimer()..seconds = seconds,
          from: meditationTimerProvider,
          name: r'meditationTimerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$meditationTimerHash,
          dependencies: MeditationTimerFamily._dependencies,
          allTransitiveDependencies:
              MeditationTimerFamily._allTransitiveDependencies,
          seconds: seconds,
        );

  MeditationTimerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seconds,
  }) : super.internal();

  final int seconds;

  @override
  int runNotifierBuild(
    covariant MeditationTimer notifier,
  ) {
    return notifier.build(
      seconds,
    );
  }

  @override
  Override overrideWith(MeditationTimer Function() create) {
    return ProviderOverride(
      origin: this,
      override: MeditationTimerProvider._internal(
        () => create()..seconds = seconds,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seconds: seconds,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MeditationTimer, int> createElement() {
    return _MeditationTimerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MeditationTimerProvider && other.seconds == seconds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seconds.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MeditationTimerRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `seconds` of this provider.
  int get seconds;
}

class _MeditationTimerProviderElement
    extends AutoDisposeNotifierProviderElement<MeditationTimer, int>
    with MeditationTimerRef {
  _MeditationTimerProviderElement(super.provider);

  @override
  int get seconds => (origin as MeditationTimerProvider).seconds;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
