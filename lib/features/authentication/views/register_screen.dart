import 'package:auto_route/auto_route.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:fast_flutter_template/common/widgets/primary_button.dart';
import 'package:fast_flutter_template/common/widgets/text_fields/email_text_field.dart';
import 'package:fast_flutter_template/common/widgets/text_fields/password_text_field.dart';
import 'package:fast_flutter_template/features/authentication/auth_error_handling.dart';
import 'package:fast_flutter_template/features/authentication/providers/auth_provider.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RegisterScreen extends HookConsumerWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authProvider,
      (previous, next) {
        handleAuthErrors(previous, next, context);
      },
    );

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    useListenable(emailController);
    useListenable(passwordController);

    bool isButtonEnabled() {
      return emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    }

    final auth = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              const _RegisterImage(),
              verticalSpace32,
              Text(
                S.of(context).register,
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
              verticalSpace24,
              PrimaryButton(
                text: S.of(context).register,
                isLoading: auth.isLoading,
                onPressed: isButtonEnabled()
                    ? () {
                        ref
                            .read(authProvider.notifier)
                            .createUserWithEmailAndPassword(
                                emailController.text, passwordController.text);
                      }
                    : null,
              ),
              verticalSpace12,
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterImage extends StatelessWidget {
  const _RegisterImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        context.isDarkMode
            ? 'assets/images/register_white.png'
            : 'assets/images/register_black.png',
        height: context.dynamicHeight(0.4));
  }
}
