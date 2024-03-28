import 'package:auto_route/auto_route.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:fast_flutter_template/app_router.gr.dart';
import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:fast_flutter_template/common/widgets/primary_button.dart';
import 'package:fast_flutter_template/common/widgets/text_fields/email_text_field.dart';
import 'package:fast_flutter_template/common/widgets/text_fields/password_text_field.dart';
import 'package:fast_flutter_template/features/authentication/auth_error_handling.dart';
import 'package:fast_flutter_template/features/authentication/providers/auth_provider.dart';
import 'package:fast_flutter_template/features/authentication/views/forgot_password_dialog.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authProvider,
      (previous, next) {
        handleAuthErrors(previous, next, context);
      },
    );

    final auth = ref.watch(authProvider);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    useListenable(emailController);
    useListenable(passwordController);

    bool isButtonEnabled() {
      return emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              const _LoginImage(),
              verticalSpace32,
              Text(
                S.of(context).login,
                style: context.textTheme.headlineMedium,
              ),
              verticalSpace24,
              EmailTextField(
                controller: emailController,
              ),
              verticalSpace24,
              PasswordTextField(
                controller: passwordController,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const ForgotPasswordDialog();
                        });
                  },
                  child: Text(
                    S.of(context).forgotPassword,
                    style: context.textTheme.bodySmall,
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              PrimaryButton(
                text: S.of(context).login,
                isLoading: auth.isLoading,
                onPressed: isButtonEnabled()
                    ? () {
                        ref
                            .read(authProvider.notifier)
                            .signInWithEmailAndPassword(
                                emailController.text, passwordController.text);
                      }
                    : null,
              ),
              verticalSpace12,
              TextButton(
                onPressed: () {
                  context.navigateTo(RegisterRoute());
                },
                child: Text(
                  S.of(context).registerNow,
                  style: context.textTheme.bodySmall,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginImage extends StatelessWidget {
  const _LoginImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        context.isDarkMode
            ? 'assets/images/login_white.png'
            : 'assets/images/login_black.png',
        height: context.dynamicHeight(0.4));
  }
}
