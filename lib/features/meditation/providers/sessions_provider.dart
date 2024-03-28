import 'package:fast_flutter_template/features/meditation/models/session.dart';
import 'package:fast_flutter_template/features/meditation/repositories/meditation_repository.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sessions_provider.g.dart';

@riverpod
class Sessions extends _$Sessions {
  @override
  Stream<List<Session>> build() {
    return ref.watch(meditationReposioryProvider).getSessions();
  }

  int getCurrentStreak() {
    return state.maybeWhen(
      data: (sessions) {
        if (sessions.isEmpty) return 0;

        sessions.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        int streak = 0;
        DateTime? lastSessionDay;
        Set<String> processedDates = {};
        DateTime now = DateTime.now();

        DateTime today = DateTime(now.year, now.month, now.day);
        DateTime lastSessionDate = DateTime(sessions.first.createdAt.year,
            sessions.first.createdAt.month, sessions.first.createdAt.day);

        if (!lastSessionDate.isAtSameMomentAs(today)) {
          return 0;
        }

        for (Session session in sessions) {
          DateTime sessionDay = DateTime(session.createdAt.year,
              session.createdAt.month, session.createdAt.day);
          String sessionDayStr = DateFormat('yyyy-MM-dd').format(sessionDay);

          if (processedDates.contains(sessionDayStr)) {
            continue;
          }

          if (lastSessionDay == null) {
            streak = 1;
            lastSessionDay = sessionDay;
          } else {
            if (lastSessionDay.difference(sessionDay).inDays == 1) {
              streak++;
            } else if (lastSessionDay.difference(sessionDay).inDays > 1) {
              break;
            }
          }

          processedDates.add(sessionDayStr);
          lastSessionDay = sessionDay;
        }

        return streak;
      },
      orElse: () => 0,
    );
  }

  bool isSameDay(DateTime lastDate, DateTime currentDate) {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(lastDate) == formatter.format(currentDate);
  }

  int getMaxStreak() {
    return state.maybeWhen(
      data: (sessions) {
        if (sessions.isEmpty) return 0;

        List<Session> sortedSessions = List.from(sessions)
          ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

        int maxStreak = 0;
        int currentStreak = 1;
        DateTime lastDay = DateTime(
            sortedSessions.first.createdAt.year,
            sortedSessions.first.createdAt.month,
            sortedSessions.first.createdAt.day);

        for (int i = 1; i < sortedSessions.length; i++) {
          DateTime currentDay = DateTime(
              sortedSessions[i].createdAt.year,
              sortedSessions[i].createdAt.month,
              sortedSessions[i].createdAt.day);

          if (currentDay.difference(lastDay).inDays == 1) {
            currentStreak++;
          } else if (currentDay.difference(lastDay).inDays > 1) {
            currentStreak = 1;
          }

          if (currentStreak > maxStreak) {
            maxStreak = currentStreak;
          }

          lastDay = currentDay;
        }

        return maxStreak;
      },
      orElse: () => 0,
    );
  }

  int getTotalSessions() {
    return state.asData?.value.length ?? 0;
  }

  int getAverageSessionDuration() {
    return state.maybeWhen(
      data: (sessions) {
        if (sessions.isEmpty) return 0;
        return (sessions
                    .map((s) => s.durationInSeconds)
                    .reduce((a, b) => a + b) /
                sessions.length /
                60)
            .ceil();
      },
      orElse: () => 0,
    );
  }
}
