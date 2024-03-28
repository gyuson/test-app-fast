import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_flutter_template/common/repositories/firebase_repository.dart';
import 'package:fast_flutter_template/common/utils/logger.dart';
import 'package:fast_flutter_template/features/authentication/models/app_user.dart';
import 'package:fast_flutter_template/features/authentication/providers/firebase_auth_repository.dart';
import 'package:fast_flutter_template/features/authentication/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(ref);
}

class UserRepository extends FirebaseRepository<AppUser> {
  final UserRepositoryRef ref;

  final _logger = getLogger('UserRepository');

  UserRepository(this.ref)
      : super(
          collection: FirebaseFirestore.instance.collection('users'),
          toFirestore: (user, _) {
            return user.toJson();
          },
          fromFirestore: (snapshot, _) {
            return AppUser.fromJson(
              snapshot.data()!,
            );
          },
        );

  void addFcmToken(String token) {
    final user = ref.read(userProvider).asData?.value;
    if (user != null) {
      final tokens = user.fcmTokens ?? [];
      add(user.copyWith(fcmTokens: [...tokens, token]), user.uid);
    }
  }

  Stream<AppUser> syncUser(String id) {
    final doc = streamDocument(id).handleError((error) {
      _logger.e(error);
    });

    return doc;
  }

  Future<void> logout() async {
    await ref.read(firebaseAuthRepositoryProvider).signOut();
  }
}
