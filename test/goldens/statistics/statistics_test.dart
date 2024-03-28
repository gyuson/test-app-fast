import 'package:fast_flutter_template/features/statistics/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../setup.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('statistics test light mode', (tester) async {
    await tester.pumpWidgetBuilder(
      createMaterialAppForTestingOneScreenOnly(
        child: const StatisticsScreen(),
      ),
    );

    await multiScreenGolden(tester, 'statistics_screen_light');
  });

  testGoldens('statistics test dark mode', (tester) async {
    await tester.pumpWidgetBuilder(
      createMaterialAppForTestingOneScreenOnly(
        themeMode: ThemeMode.dark,
        child: const StatisticsScreen(),
      ),
    );

    await multiScreenGolden(tester, 'statistics_screen_dark');
  });
}
