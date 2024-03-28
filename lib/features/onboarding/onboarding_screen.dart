import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/app_router.gr.dart';
import 'package:fast_flutter_template/common/providers/storage_provider.dart';
import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

@RoutePage()
class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
        pages: _getPages,
        done: Text(S.of(context).done),
        showDoneButton: true,
        showSkipButton: true,
        skip: Text(S.of(context).skip),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.primary,
          color: context.colorScheme.secondary,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        onSkip: () {
          _finishOnboarding(context, ref);
        },
        next: Text(S.of(context).next),
        onDone: () {
          _finishOnboarding(context, ref);
        },
      ),
    );
  }

  void _finishOnboarding(BuildContext context, WidgetRef ref) {
    ref.read(storageProvider).setOnboardingDone(true);
    context.replaceRoute(const BottomNavBar());
  }

  List<PageViewModel> get _getPages {
    return [
      PageViewModel(
        title: S.current.onboarding_titlePage1,
        body: S.current.onboarding_bodyPage1,
        decoration: defaultOnboardingDecoration,
        image: Image.asset('assets/images/rocket.png'),
      ),
      PageViewModel(
        title: S.current.onboarding_titlePage2,
        body: S.current.onboarding_bodyPage2,
        decoration: defaultOnboardingDecoration,
        image: const _OnboardingImage(Icons.stars_rounded),
      )
    ];
  }
}

class _OnboardingImage extends StatelessWidget {
  const _OnboardingImage(this.iconData);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        iconData,
        color: context.colorScheme.primary,
        size: 220,
      ),
    );
  }
}
