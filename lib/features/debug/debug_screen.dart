import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/common/providers/storage_provider.dart';
import 'package:fast_flutter_template/features/meditation/providers/sessions_provider.dart';
import 'package:fast_flutter_template/features/meditation/repositories/meditation_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DebugScreen extends ConsumerWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(sessionsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Menu'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Reset onboarding'),
            leading: const Icon(Icons.first_page),
            onTap: () {
              ref.read(storageProvider).setOnboardingDone(false);
            },
          ),
          ListTile(
            title: const Text('Delete sessions'),
            leading: const Icon(Icons.first_page),
            onTap: () {
              for (final session in sessions.asData?.value ?? []) {
                ref
                    .read(meditationReposioryProvider)
                    .deleteDocument(session.id);
              }
            },
          ),
        ],
      ),
    );
  }
}
