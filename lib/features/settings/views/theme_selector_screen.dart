import 'package:auto_route/annotations.dart';
import 'package:fast_flutter_template/common/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/providers/storage_provider.dart';

@RoutePage()
class ThemeSelectionScreen extends ConsumerWidget {
  const ThemeSelectionScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.watch(storageProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Select theme'),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: availableThemes.length,
          itemBuilder: (BuildContext context, int index) {
            final item = availableThemes[index];
            return CheckboxListTile(
              value: storage.getTheme() == index,
              title: Text(item),
              onChanged: (_) {
                ref.read(storageProvider.notifier).setTheme(index);
              },
            );
          },
        )));
  }
}
