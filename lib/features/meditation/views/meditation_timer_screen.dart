import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/common/repositories/firebase_repository.dart';
import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/utils/extensions/string_extension.dart';
import 'package:fast_flutter_template/common/widgets/primary_button.dart';
import 'package:fast_flutter_template/features/meditation/models/session.dart';
import 'package:fast_flutter_template/features/meditation/providers/meditation_timer_provider.dart';
import 'package:fast_flutter_template/features/meditation/repositories/meditation_repository.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MeditationTimerSceen extends ConsumerWidget {
  const MeditationTimerSceen({required this.duration, super.key});

  final int duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(meditationTimerProvider(duration));
    final remaining = duration - timer;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation Timer'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 40),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Center(
                child: Text(
                  _formatTimer(remaining),
                  style: context.textTheme.displayLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ),
            PrimaryButton(
                text: S.of(context).finish,
                onPressed: () {
                  ref.read(meditationReposioryProvider).saveSession(Session(
                        id: ref.read(docIdProvider),
                        durationInSeconds: timer,
                        createdAt: DateTime.now(),
                      ));
                  context.router.pop();

                  context.showSnackBar('Session saved'.hardcoded);
                }),
          ],
        ),
      ),
    );
  }

  bool isButtonEnabled(int remaining) {
    return remaining <= 0;
  }

  String _formatTimer(int remaining) {
    final minutes = (remaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (remaining % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
