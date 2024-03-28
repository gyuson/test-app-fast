import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/common/providers/fireabse/remote_config_provider.dart';
import 'package:fast_flutter_template/common/providers/router_provider.dart';
import 'package:fast_flutter_template/common/providers/storage_provider.dart';
import 'package:fast_flutter_template/features/authentication/providers/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  AppRouter(this.ref);

  final RouterRef ref;

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(path: '/onboarding', page: OnboardingRoute.page),
    AutoRoute(path: '/login', page: LoginRoute.page),
    AutoRoute(path: '/register', page: RegisterRoute.page),
    AutoRoute(path: '/pro', page: ProRoute.page),
    AutoRoute(path: '/debug', page: DebugRoute.page),
    AutoRoute(path: '/meditation-timer', page: MeditationTimerSceen.page),
    AutoRoute(
      page: BottomNavBar.page,
      initial: true,
      path: '/bottom-nav-bar',
      guards: [
        //NOTE: remove this guard if you don't want to show login
        AuthGuard(ref),
        //NOTE: remove this guard if you don't want to show onboarding
        OnboardingGuard(ref),
      ],
      children: [
        RedirectRoute(path: '', redirectTo: 'dashboard'),
        AutoRoute(
          page: DashboardShellRoute.page,
          path: 'dashboard',
          maintainState: true,
          children: [
            AutoRoute(path: '', page: DashboardRoute.page),
          ],
        ),
        AutoRoute(
          page: StatisticsShellRoute.page,
          path: 'statistics',
          children: [
            AutoRoute(path: '', page: StatisticsRoute.page),
          ],
        ),
        AutoRoute(
          page: SettingsShellRoute.page,
          path: 'settings',
          children: [
            AutoRoute(path: '', page: SettingsRoute.page),
            AutoRoute(path: 'profile', page: ProfileRoute.page),
            AutoRoute(path: 'theme', page: ThemeSelectionRoute.page),
            AutoRoute(path: 'language', page: LanguageSelectionRoute.page),
          ],
        ),
      ],
    ),
  ];
}

@RoutePage()
class DashboardShellPage extends AutoRouter {
  const DashboardShellPage({super.key});
}

@RoutePage()
class StatisticsShellPage extends AutoRouter {
  const StatisticsShellPage({super.key});
}

@RoutePage()
class SettingsShellPage extends AutoRouter {
  const SettingsShellPage({super.key});
}

class OnboardingGuard extends AutoRouteGuard {
  OnboardingGuard(this.ref);

  final RouterRef ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isOnboardingCompleted = ref.read(storageProvider).getOnboardingDone();
    final showOnboarding = ref.read(remoteConfigProvider).showOnboarding;

    if (isOnboardingCompleted || !showOnboarding) {
      resolver.next(true);
    } else {
      resolver.redirect(const OnboardingRoute());
    }
  }
}

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this.ref);

  final RouterRef ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authenticated = ref.watch(authStateChangesProvider);

    //Check if authentication has data
    authenticated.maybeWhen(
      orElse: () {
        resolver.redirect(LoginRoute());
      },
      data: (user) {
        if (user != null) {
          resolver.next(true);
        } else {
          resolver.redirect(LoginRoute());
        }
      },
    );
  }
}
