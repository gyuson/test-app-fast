import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_flutter_template/common/utils/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required final String uid,
    required final String email,
    @TimestampConverter() required final DateTime createdAt,
    final List<String>? fcmTokens,
    final String? displayName,
    final String? photoURL,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}
