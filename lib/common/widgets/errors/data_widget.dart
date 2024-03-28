import 'package:fast_flutter_template/common/widgets/custom_loading_indicator.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataWidget<A> extends StatelessWidget {
  const DataWidget({
    Key? key,
    required this.value,
    required this.onData,
    this.showAppbar = true,
  }) : super(key: key);

  final AsyncValue<A> value;
  final Function(A) onData;
  final bool showAppbar;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (data) {
        return onData(data);
      },
      error: (e, s) {
        return Center(child: Text(S.of(context).generalErrorMessage));
      },
      loading: () {
        return const CustomLoadingIndicator();
      },
    );
  }
}
