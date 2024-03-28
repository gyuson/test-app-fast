// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:fast_flutter_template/app_router.dart' as _i3;
import 'package:fast_flutter_template/common/widgets/bottom_nav_bar.dart'
    as _i1;
import 'package:fast_flutter_template/features/authentication/views/login_screen.dart'
    as _i6;
import 'package:fast_flutter_template/features/authentication/views/register_screen.dart'
    as _i11;
import 'package:fast_flutter_template/features/dashboard/views/dashboard_screen.dart'
    as _i2;
import 'package:fast_flutter_template/features/debug/debug_screen.dart' as _i4;
import 'package:fast_flutter_template/features/meditation/views/meditation_timer_screen.dart'
    as _i7;
import 'package:fast_flutter_template/features/onboarding/onboarding_screen.dart'
    as _i8;
import 'package:fast_flutter_template/features/pro/views/pro_screen.dart'
    as _i9;
import 'package:fast_flutter_template/features/settings/views/language_selection_screen.dart'
    as _i5;
import 'package:fast_flutter_template/features/settings/views/profile_screen.dart'
    as _i10;
import 'package:fast_flutter_template/features/settings/views/settings_screen.dart'
    as _i12;
import 'package:fast_flutter_template/features/settings/views/theme_selector_screen.dart'
    as _i14;
import 'package:fast_flutter_template/features/statistics/statistics_screen.dart'
    as _i13;
import 'package:flutter/material.dart' as _i16;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    BottomNavBar.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavBar(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardScreen(),
      );
    },
    DashboardShellRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardShellPage(),
      );
    },
    DebugRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DebugScreen(),
      );
    },
    LanguageSelectionRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LanguageSelectionScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LoginScreen(key: args.key),
      );
    },
    MeditationTimerSceen.name: (routeData) {
      final args = routeData.argsAs<MeditationTimerSceenArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MeditationTimerSceen(
          duration: args.duration,
          key: args.key,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnboardingScreen(),
      );
    },
    ProRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.RegisterScreen(key: args.key),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SettingsScreen(),
      );
    },
    SettingsShellRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SettingsShellPage(),
      );
    },
    StatisticsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.StatisticsScreen(),
      );
    },
    StatisticsShellRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.StatisticsShellPage(),
      );
    },
    ThemeSelectionRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ThemeSelectionScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomNavBar]
class BottomNavBar extends _i15.PageRouteInfo<void> {
  const BottomNavBar({List<_i15.PageRouteInfo>? children})
      : super(
          BottomNavBar.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBar';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardShellPage]
class DashboardShellRoute extends _i15.PageRouteInfo<void> {
  const DashboardShellRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DashboardShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardShellRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DebugScreen]
class DebugRoute extends _i15.PageRouteInfo<void> {
  const DebugRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DebugRoute.name,
          initialChildren: children,
        );

  static const String name = 'DebugRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LanguageSelectionScreen]
class LanguageSelectionRoute extends _i15.PageRouteInfo<void> {
  const LanguageSelectionRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LanguageSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSelectionRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i15.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i15.PageInfo<LoginRouteArgs> page =
      _i15.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.MeditationTimerSceen]
class MeditationTimerSceen
    extends _i15.PageRouteInfo<MeditationTimerSceenArgs> {
  MeditationTimerSceen({
    required int duration,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          MeditationTimerSceen.name,
          args: MeditationTimerSceenArgs(
            duration: duration,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MeditationTimerSceen';

  static const _i15.PageInfo<MeditationTimerSceenArgs> page =
      _i15.PageInfo<MeditationTimerSceenArgs>(name);
}

class MeditationTimerSceenArgs {
  const MeditationTimerSceenArgs({
    required this.duration,
    this.key,
  });

  final int duration;

  final _i16.Key? key;

  @override
  String toString() {
    return 'MeditationTimerSceenArgs{duration: $duration, key: $key}';
  }
}

/// generated route for
/// [_i8.OnboardingScreen]
class OnboardingRoute extends _i15.PageRouteInfo<void> {
  const OnboardingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProScreen]
class ProRoute extends _i15.PageRouteInfo<void> {
  const ProRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileRoute extends _i15.PageRouteInfo<void> {
  const ProfileRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RegisterScreen]
class RegisterRoute extends _i15.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i15.PageInfo<RegisterRouteArgs> page =
      _i15.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.SettingsScreen]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SettingsShellPage]
class SettingsShellRoute extends _i15.PageRouteInfo<void> {
  const SettingsShellRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsShellRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.StatisticsScreen]
class StatisticsRoute extends _i15.PageRouteInfo<void> {
  const StatisticsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          StatisticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StatisticsShellPage]
class StatisticsShellRoute extends _i15.PageRouteInfo<void> {
  const StatisticsShellRoute({List<_i15.PageRouteInfo>? children})
      : super(
          StatisticsShellRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticsShellRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ThemeSelectionScreen]
class ThemeSelectionRoute extends _i15.PageRouteInfo<void> {
  const ThemeSelectionRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ThemeSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeSelectionRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
