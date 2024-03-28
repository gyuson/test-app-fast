import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:fast_flutter_template/common/widgets/secondary_button.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorScreen extends HookConsumerWidget {
  const ErrorScreen({
    Key? key,
    this.refresh,
    this.image,
    this.message,
    this.title,
  }) : super(key: key);

  final VoidCallback? refresh;
  final Widget? image;
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.error_sharp,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                verticalSpace16,
                Center(
                  child: Text(S.of(context).generalErrorMessage),
                ),
                if (refresh != null)
                  SecondaryButton(
                      text: S.of(context).tryAgain,
                      onPressed: () {
                        refresh!();
                        isLoading.value = true;
                        Future.delayed(const Duration(seconds: 5), () {
                          if (context.mounted) {
                            isLoading.value = false;
                          }
                        });
                      }),
                verticalSpace24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
