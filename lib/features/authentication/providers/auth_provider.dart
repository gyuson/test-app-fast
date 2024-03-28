import 'package:fast_flutter_template/common/providers/fireabse/analytics_provider.dart';
import 'package:fast_flutter_template/common/utils/logger.dart';
import 'package:fast_flutter_template/features/authentication/providers/firebase_auth_repository.dart';
import 'package:fast_flutter_template/features/authentication/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  final _logger = getLogger('AuthProvider');

  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      state = await AsyncValue.guard(() async {
        final user = await ref
            .read(firebaseAuthRepositoryProvider)
            .signIn(email, password);

        //Log analytics event
        ref.read(analyticsProvider).logEvent(name: 'Login');
        return user;
      });
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    state = const AsyncValue.loading();
    try {
      state = await AsyncValue.guard(() async {
        final user = await ref
            .read(firebaseAuthRepositoryProvider)
            .createUserWithEmailAndPassword(email, password);
        return user;
      });
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      return ref.read(firebaseAuthRepositoryProvider).forgotPassword(email);
    } catch (e, s) {
      AsyncValue.error(e, s);
    }
  }

  Future<void> logout() async {
    _logger.d('logout');
    ref.read(userRepositoryProvider).logout();
  }
}
