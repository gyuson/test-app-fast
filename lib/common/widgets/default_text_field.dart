import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry contentPadding;

  const DefaultTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.validator,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.only(left: 16),
    this.errorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      validator: validator,
      maxLines: 1,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        errorStyle: errorStyle,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
        border: const OutlineInputBorder(),
        labelText: labelText ?? hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
