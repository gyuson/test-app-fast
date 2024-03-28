import 'package:fast_flutter_template/common/utils/constants.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:fast_flutter_template/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Widget createMaterialAppForTestingOneScreenOnly({
  required Widget child,
  List<Override> overrides = const [],
  ThemeMode themeMode = ThemeMode.light,
}) {
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale(defaultLanguage),
      theme: themeData(Brightness.light, colorScheme(Brightness.light)),
      darkTheme: themeData(Brightness.dark, colorScheme(Brightness.dark)),
      themeMode: themeMode,
      home: child,
    ),
  );
}
