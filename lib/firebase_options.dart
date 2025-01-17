// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBiI8FWukTFvxF7nddGMgyBVjV9fvKTTT8',
    appId: '1:865032087446:web:d0ffbe4a347a6d03fc5fb7',
    messagingSenderId: '865032087446',
    projectId: 'best-meditation-app-2023',
    authDomain: 'best-meditation-app-2023.firebaseapp.com',
    storageBucket: 'best-meditation-app-2023.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVr9otVYdjb5qu3pLIT0jdwXQVeDmKTtg',
    appId: '1:865032087446:android:4632ab13654d5547fc5fb7',
    messagingSenderId: '865032087446',
    projectId: 'best-meditation-app-2023',
    storageBucket: 'best-meditation-app-2023.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzqQUzCCDXaI8ehyaAMjnOWUrv7QP8hq0',
    appId: '1:865032087446:ios:370935e64df08feefc5fb7',
    messagingSenderId: '865032087446',
    projectId: 'best-meditation-app-2023',
    storageBucket: 'best-meditation-app-2023.appspot.com',
    iosBundleId: 'com.example.fastFlutterTemplate',
  );
}
