import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:fast_flutter_template/common/widgets/text_fields/email_text_field.dart';
import 'package:fast_flutter_template/features/authentication/providers/auth_provider.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordDialog extends HookConsumerWidget {
  const ForgotPasswordDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    useListenable(emailController);

    bool isButtonEnabled() {
      return emailController.text.isNotEmpty;
    }

    return AlertDialog(
      title: Text(S.of(context).resetPasswordDialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).resetPasswordDialogMessage),
          verticalSpace20,
          EmailTextField(
            controller: emailController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            S.of(context).cancel,
            style: context.textTheme.labelMedium,
          ),
        ),
        TextButton(
          onPressed: isButtonEnabled()
              ? () {
                  ref
                      .read(authProvider.notifier)
                      .forgotPassword(emailController.text)
                      .then(
                    (_) {
                      if (context.mounted) {
                        Navigator.of(context).pop();
                        context.showSnackBar(
                            S.of(context).resetEmailSnackbarMessage);
                      }
                    },
                  );
                }
              : null,
          child: Text(
            S.of(context).resetPassword,
          ),
        )
      ],
    );
  }
}
