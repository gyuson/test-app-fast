import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultTextField extends ConsumerWidget {
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
  final bool autofocus;
  final bool enableInteractiveSelection;
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
    this.autofocus = false,
    this.enableInteractiveSelection = true,
    this.obscureText = false,
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.only(left: 16),
    this.errorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      enableInteractiveSelection: enableInteractiveSelection,
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      validator: validator,
      autofocus: autofocus,
      maxLines: 1,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        filled: true,
        fillColor: context.colorScheme.background,
        errorStyle: errorStyle,
        border: const OutlineInputBorder(),
        labelText: labelText ?? hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
