import 'package:fast_flutter_template/common/utils/validation.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'default_text_field.dart';

class PasswordTextField extends HookWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final Function(String?)? onChanged;
  final String? hintText;

  const PasswordTextField({
    Key? key,
    this.controller,
    this.validator,
    this.onSaved,
    this.onEditingComplete,
    this.autofillHints,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  String? _validate(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!isPasswordValid(value)) {
      return S.of(context).passwordValidation;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isObscured = useState(true);

    return DefaultTextField(
      enableInteractiveSelection: false,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      hintText: hintText ?? S.of(context).enterPassword,
      validator: (value) => _validate(value, context),
      errorStyle: const TextStyle(height: 0),
      obscureText: isObscured.value,
      suffixIcon: IconButton(
        icon: Icon(
          isObscured.value
              ? Icons.remove_red_eye_outlined
              : Icons.visibility_off_outlined,
        ),
        onPressed: () {
          isObscured.value = !isObscured.value;
        },
      ),
    );
  }
}
