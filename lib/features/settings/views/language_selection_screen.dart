import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/common/providers/storage_provider.dart';
import 'package:fast_flutter_template/common/utils/extensions/language_extension.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LanguageSelectionScreen extends ConsumerWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = ref.watch(storageProvider);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).language)),
      body: ListView.builder(
          itemCount: S.delegate.supportedLocales.length,
          itemBuilder: (context, index) {
            final item = S.delegate.supportedLocales.elementAt(index);
            return ListTile(
              tileColor: item.languageCode == storage.getSelecedLanguageCode()
                  ? Theme.of(context).highlightColor
                  : null,
              title: Text(item.fullLanguageName),
              onTap: () {
                storage.setLanguage(item.languageCode);
              },
            );
          }),
    );
  }
}
