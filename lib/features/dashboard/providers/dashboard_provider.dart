import 'package:fast_flutter_template/features/dashboard/mock_data.dart';
import 'package:fast_flutter_template/features/dashboard/models/app_idea.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

@Riverpod(keepAlive: true)
class Dashboard extends _$Dashboard {
  @override
  Future<List<AppIdea>> build() {
    return getBars();
  }
}

Future<List<AppIdea>> getBars() async {
  // Simulate a delay
  await Future.delayed(const Duration(seconds: 1));
  return appIdeas;
}
