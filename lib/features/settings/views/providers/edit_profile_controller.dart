import 'package:fast_flutter_template/common/providers/router_provider.dart';
import 'package:fast_flutter_template/common/services/firebase_storage_service.dart';
import 'package:fast_flutter_template/features/authentication/providers/user_provider.dart';
import 'package:fast_flutter_template/features/authentication/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_controller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  @override
  FutureOr<void> build() {}

  Future<void> save(String? path, String? name) async {
    state = const AsyncValue.loading();
    final user = ref.read(userProvider).asData?.value;
    final userId = user?.uid;
    if (user != null && userId != null) {
      state = await AsyncValue.guard(() async {
        var url = user.photoURL;

        if (path != null) {
          url = await ref
              .read(firebaseStorageServiceProvider)
              .uploadFile(path, userId);
        }

        await ref
            .read(userRepositoryProvider)
            .add(user.copyWith(photoURL: url, displayName: name), userId);

        state = const AsyncValue.data(null);
        ref.read(routerProvider).back();
      });
    }
  }
}
