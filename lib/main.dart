import 'dart:io';

import 'package:fast_flutter_template/app.dart';
import 'package:fast_flutter_template/common/providers/storage_provider.dart';
import 'package:fast_flutter_template/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await initHive();

  if (!kIsWeb) {
    await Purchases.setLogLevel(LogLevel.debug);
    PurchasesConfiguration configuration;

    //NOTE: Add your own API keys here
    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration('NOTE: add key Android');
    } else {
      configuration = PurchasesConfiguration('NOTE: add key iOS');
    }
    await Purchases.configure(configuration);
  }

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
