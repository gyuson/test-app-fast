import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config_provider.g.dart';

@Riverpod(keepAlive: true)
RemoteConfigService remoteConfig(RemoteConfigRef ref) {
  return RemoteConfigService();
}

class RemoteConfigService {
  final remoteConfig = FirebaseRemoteConfig.instance;

  RemoteConfigService() {
    init();
  }

  Future<void> init() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval:
          kDebugMode ? Duration.zero : const Duration(hours: 1),
    ));

    await remoteConfig.setDefaults(<String, dynamic>{
      'showOnboarding': true,
    });

    await remoteConfig.fetchAndActivate();
  }

  bool get showOnboarding => remoteConfig.getBool('showOnboarding');
}
