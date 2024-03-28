import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditation_timer_provider.g.dart';

@riverpod
class MeditationTimer extends _$MeditationTimer {
  late Timer _timer;

  @override
  int build(int seconds) {
    _startTimer(seconds);

    ref.onDispose(() {
      _timer.cancel();
    });

    return 0;
  }

  void _startTimer(int seconds) {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (timer.tick - 1 == seconds) {
          timer.cancel();
        } else {
          state = timer.tick;
        }
      },
    );
  }
}
