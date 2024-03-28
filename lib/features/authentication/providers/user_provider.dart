import 'package:fast_flutter_template/features/authentication/models/app_user.dart';
import 'package:fast_flutter_template/features/authentication/providers/firebase_auth_repository.dart';
import 'package:fast_flutter_template/features/authentication/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<AppUser> user(UserRef ref) {
  final firebase = ref.watch(authStateChangesProvider).asData?.value;

  if (firebase != null) {
    final user = ref.refresh(userRepositoryProvider).syncUser(firebase.uid);

    return user;
  }

  return const Stream.empty();
}

@riverpod
String? userId(UserIdRef ref) {
  return ref.watch(userProvider).asData?.value.uid;
}
