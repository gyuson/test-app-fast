import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/common/providers/fireabse/analytics_provider.dart';
import 'package:fast_flutter_template/common/providers/rate_my_app_provider.dart';
import 'package:fast_flutter_template/common/providers/router_provider.dart';
import 'package:fast_flutter_template/features/messaging/provider/messaging_provider.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/providers/storage_provider.dart';
import 'theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final storage = ref.watch(storageProvider);

    ref.watch(firebaseMessagingHandlerProvider);
    ref.watch(fcmTokenProvider);
    ref.read(rateMyAppProvider);

    return MaterialApp.router(
      routerConfig: router.config(
        navigatorObservers: () => <NavigatorObserver>[
          AutoRouteObserver(),
          HeroController(),
          FirebaseAnalyticsObserver(analytics: ref.read(analyticsProvider)),
        ],
      ),
      title: 'Fast Flutter Template',
      debugShowCheckedModeBanner: false,
      locale: Locale(storage.getSelecedLanguageCode()),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      themeMode: ThemeMode.values[storage.getTheme()],
      darkTheme: themeData(Brightness.dark, colorScheme(Brightness.dark)),
      theme: themeData(Brightness.light, colorScheme(Brightness.light)),
    );
  }
}
