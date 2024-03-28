import 'dart:async';

import 'package:fast_flutter_template/common/utils/logger.dart';
import 'package:fast_flutter_template/features/authentication/providers/user_provider.dart';
import 'package:fast_flutter_template/features/authentication/repositories/user_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messaging_provider.g.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('Handling a background message ${message.messageId}');
  }
}

@riverpod
FirebaseMessagingHandlerProvider firebaseMessagingHandler(
    FirebaseMessagingHandlerRef ref) {
  return FirebaseMessagingHandlerProvider(ref);
}

Future<void> initMessaging() async {
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

class FirebaseMessagingHandlerProvider {
  FirebaseMessagingHandlerProvider(this.ref) : super() {
    init();
  }
  final Ref ref;
  final _logger = getLogger('FirebaseMessagingHandlerProvider');

  Future<void> init() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _logger.d('getInitialMessage: $initialMessage');
      getInitialMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        _logger.d('onMessageOpenedApp: ${message.data}');
      }
      onMessageClick(message);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logger.d('onMessage: ${message.notification} ${message.data}');
      onMessage([message]);
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      _logger.d('onTokenRefresh: $fcmToken');
    }).onError((err) {
      // Error getting token.
      _logger.e(err);
    });
  }

  void onMessage(List<RemoteMessage> messages) {}

  void getInitialMessage(RemoteMessage message) {
    onMessageClick(message);
  }

  Future<void> onMessageClick(RemoteMessage message) async {
    //INFO
    // you can navigate to a certain screen depending on the payload of the
    //message
    // use ref.read(routerProvider).navigate(route) for this
  }
}

@riverpod
final fcmTokenProvider = Provider((ref) async {
  final user = ref.watch(userProvider).asData?.value;

  //only print token if user is authenticated
  if (user == null) {
    return;
  }

  final fcm = FirebaseMessaging.instance;

  fcm
      .requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      )
      .then((value) => fcm.getToken())
      .then((token) {
    if (token == null) {
      return;
    }

    if (kDebugMode) {
      getLogger('fcmTokenProvider').d('fcm token: $token');
    }

    if (user.fcmTokens?.contains(token) ?? false) {
      return;
    }

    ref.read(userRepositoryProvider).addFcmToken(token);
  });
});
