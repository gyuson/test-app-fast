import 'package:fast_flutter_template/features/authentication/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../setup.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('login test light mode', (tester) async {
    await tester.pumpWidgetBuilder(
      createMaterialAppForTestingOneScreenOnly(
        child: LoginScreen(),
      ),
    );

    await multiScreenGolden(tester, 'login_screen_light');
  });

  testGoldens('login test dark mode', (tester) async {
    await tester.pumpWidgetBuilder(
      createMaterialAppForTestingOneScreenOnly(
        themeMode: ThemeMode.dark,
        child: LoginScreen(),
      ),
    );

    await multiScreenGolden(tester, 'login_screen_dark');
  });
}
