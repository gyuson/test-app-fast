// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      displayName: json['displayName'] as String?,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'fcmTokens': instance.fcmTokens,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
    };
