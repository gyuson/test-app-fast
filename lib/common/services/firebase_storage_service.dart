import 'dart:io';

import 'package:fast_flutter_template/common/utils/logger.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_storage_service.g.dart';

@riverpod
FirebaseStorageService firebaseStorageService(FirebaseStorageServiceRef ref) {
  return FirebaseStorageService();
}

class FirebaseStorageService {
  final storage = FirebaseStorage.instance;
  final _logger = getLogger('FirebaseStorageService');

  Future<String> uploadFile(String path, String userId) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('userImages')
          .child(userId)
          .child('${DateTime.now().millisecondsSinceEpoch}.png');

      final uploadTask = ref.putFile(File(path));
      final TaskSnapshot downloadUrl = (await uploadTask);
      final String url = (await downloadUrl.ref.getDownloadURL());

      _logger.d('downloadUrl: $url');
      return url;
    } catch (e) {
      _logger.e('uploadFile: $e');
      rethrow;
    }
  }
}
