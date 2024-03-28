import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required final String id,
    required final int durationInSeconds,
    required final DateTime createdAt,
  }) = _Session;

  factory Session.fromJson(Map<String, Object?> json) =>
      _$SessionFromJson(json);
}
