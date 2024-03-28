import 'package:fast_flutter_template/common/utils/validation.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'default_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;

  const EmailTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      validator: (value) => _validate(value, context),
      hintText: hintText ?? 'Enter your email',
      suffixIcon: IconButton(
          icon: const Icon(
            Icons.highlight_remove_outlined,
          ),
          onPressed: () {
            controller.clear();
            if (onChanged != null) {
              onChanged!('');
            }
          }),
    );
  }

  String? _validate(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!isEmailValid(value)) {
      return S.of(context).emailValidation;
    }

    if (validator != null) {
      return validator!(value);
    }

    return null;
  }
}
