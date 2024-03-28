import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:flutter/material.dart';

const fontFamily = 'Roboto';

const Color errorColor = Color(0xFFDC2626);

ThemeData themeData(Brightness brightness, ColorScheme colorScheme) {
  return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(colorScheme.primary),
      ),
      appBarTheme:
          const AppBarTheme(centerTitle: false, scrolledUnderElevation: 0),
      scaffoldBackgroundColor: colorScheme.background,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: defaultBoderRadius),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
        foregroundColor: colorScheme.primary,
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(0, 0),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: TextStyle(color: colorScheme.background, fontSize: 18),
      )),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w600,
          fontSize: 28,
          fontFamily: fontFamily,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w400,
          fontSize: 22,
          fontFamily: fontFamily,
        ),
        titleMedium: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w400,
          color: colorScheme.onBackground,
          fontFamily: fontFamily,
        ),
        bodyLarge: TextStyle(
          color: colorScheme.onBackground,
          fontFamily: fontFamily,
          fontSize: 15,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onBackground,
          fontWeight: FontWeight.w400,
          fontFamily: fontFamily,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onBackground,
          fontFamily: fontFamily,
        ),
        //button
        labelLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontFamily: fontFamily,
          // fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        labelMedium: TextStyle(
            color: colorScheme.onBackground,
            fontSize: 14,
            fontFamily: fontFamily,
            fontWeight: FontWeight.w400),
      ));
}

ColorScheme colorScheme(Brightness b) {
  switch (b) {
    case Brightness.light:
      return lightColorScheme;
    case Brightness.dark:
      return darkColorScheme;
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 25, 146, 116),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF4BFEC8),
  onPrimaryContainer: Color(0xFF002117),
  secondary: Color(0xFF4C6359),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCEE9DB),
  onSecondaryContainer: Color(0xFF082018),
  tertiary: Color(0xFF3F6375),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFC2E8FD),
  onTertiaryContainer: Color(0xFF001E2B),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFDF9),
  onBackground: Color(0xFF191C1A),
  surface: Color(0xFFFBFDF9),
  onSurface: Color(0xFF191C1A),
  surfaceVariant: Color(0xFFDBE5DE),
  onSurfaceVariant: Color(0xFF404944),
  outline: Color(0xFF707974),
  onInverseSurface: Color(0xFFEFF1EE),
  inverseSurface: Color(0xFF2E312F),
  inversePrimary: Color(0xFF0EE0AD),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006C51),
  outlineVariant: Color(0xFFBFC9C3),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF0EE0AD),
  onPrimary: Color(0xFF003829),
  primaryContainer: Color(0xFF00513D),
  onPrimaryContainer: Color(0xFF4BFEC8),
  secondary: Color(0xFFB3CCC0),
  onSecondary: Color(0xFF1E352C),
  secondaryContainer: Color(0xFF354C42),
  onSecondaryContainer: Color(0xFFCEE9DB),
  tertiary: Color(0xFFA7CCE1),
  onTertiary: Color(0xFF0A3445),
  tertiaryContainer: Color(0xFF264B5C),
  onTertiaryContainer: Color(0xFFC2E8FD),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1A),
  onBackground: Color(0xFFE1E3E0),
  surface: Color(0xFF191C1A),
  onSurface: Color(0xFFE1E3E0),
  surfaceVariant: Color(0xFF404944),
  onSurfaceVariant: Color(0xFFBFC9C3),
  outline: Color(0xFF89938D),
  onInverseSurface: Color(0xFF191C1A),
  inverseSurface: Color(0xFFE1E3E0),
  inversePrimary: Color(0xFF006C51),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF0EE0AD),
  outlineVariant: Color(0xFF404944),
  scrim: Color(0xFF000000),
);
