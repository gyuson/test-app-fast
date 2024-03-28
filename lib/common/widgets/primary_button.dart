import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final Color? color;
  final bool isLoading;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.onPressed,
    this.color,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              backgroundColor: color ?? Theme.of(context).colorScheme.primary),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: isLoading
                  ? const CustomLoadingIndicator(
                      color: Colors.white,
                    )
                  : Text(text,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: onPressed == null
                              ? context.colorScheme.secondary
                              : context.colorScheme.onPrimary))),
        ),
      ),
    );
  }
}
