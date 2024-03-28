import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 40,
      indent: 40,
      color: Theme.of(context).brightness == Brightness.light
          ? Theme.of(context).colorScheme.primaryContainer
          : Theme.of(context).colorScheme.tertiary,
      height: 0.4,
    );
  }
}
