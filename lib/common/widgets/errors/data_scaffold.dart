import 'package:fast_flutter_template/common/widgets/errors/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataScaffold<A> extends ConsumerWidget {
  const DataScaffold({
    Key? key,
    required this.value,
    required this.onData,
    this.appBar,
    this.showAppbar = true,
    this.refresh,
    this.appBarTitle,
  }) : super(key: key);

  final AsyncValue<A> value;
  final Function(A) onData;
  final String? appBarTitle;
  final AppBar? appBar;
  final bool showAppbar;
  final VoidCallback? refresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBar = showAppbar
        ? this.appBar ??
            AppBar(
              title: appBarTitle != null ? Text(appBarTitle!) : null,
            )
        : null;

    return value.when(
      data: (data) {
        return Scaffold(appBar: appBar, body: onData(data));
      },
      error: (e, s) {
        return ErrorScreen(
          refresh: refresh,
        );
      },
      loading: () {
        return Scaffold(
          appBar: appBar,
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
