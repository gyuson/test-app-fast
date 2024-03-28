import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecondaryButton extends ConsumerWidget {
  final String text;
  final VoidCallback? onPressed;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 40,
      width: double.maxFinite,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            side: BorderSide(
              color: context.colors.primary,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
