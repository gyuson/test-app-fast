import 'package:auto_route/auto_route.dart';
import 'package:fast_flutter_template/common/utils/extensions/context_extension.dart';
import 'package:fast_flutter_template/common/utils/extensions/date_time_extension.dart';
import 'package:fast_flutter_template/common/utils/extensions/string_extension.dart';
import 'package:fast_flutter_template/common/utils/style.dart';
import 'package:fast_flutter_template/common/widgets/errors/data_scaffold.dart';
import 'package:fast_flutter_template/features/meditation/models/session.dart';
import 'package:fast_flutter_template/features/meditation/providers/sessions_provider.dart';
import 'package:fast_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({super.key}); // You can customize these stats

  @override
  ConsumerState<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final sessions = ref.watch(sessionsProvider);
    final notifier = ref.read(sessionsProvider.notifier);

    return DataScaffold(
      appBar: AppBar(
        title: Text('Statistics'.hardcoded),
      ),
      value: sessions,
      onData: (data) {
        if (data.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'No sessions yet'.hardcoded,
                    style: context.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace12,
                  Text(
                    'Start a session on the dashboard to see your stats here'
                        .hardcoded,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
        return ListView(
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 5,
              children: <Widget>[
                _buildGridTile('Current Streak'.hardcoded,
                    '${notifier.getCurrentStreak()} days'),
                _buildGridTile(
                    'Max Streak'.hardcoded, '${notifier.getMaxStreak()} days'),
                _buildGridTile('Total Sessions'.hardcoded,
                    notifier.getTotalSessions().toString()),
                _buildGridTile('Average Session'.hardcoded,
                    '${notifier.getAverageSessionDuration()} minutes'),
              ],
            ),
            verticalSpace12,
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).sessionLog,
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    ' ${data.length} sessions'.hardcoded,
                  ),
                ],
              ),
            ),
            _buildSessionLog(data),
          ],
        );
      },
    );
  }

  Widget _buildGridTile(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(data),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildSessionLog(List<Session> sessions) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: sessions.length,
        itemBuilder: (context, index) {
          final session = sessions[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(session.createdAt.formatDateTimeShort),
                subtitle: Text(
                    '${(session.durationInSeconds / 60).ceil()} minutes'
                        .hardcoded),
              ),
            ),
          );
        });
  }
}
