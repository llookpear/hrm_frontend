// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      accessToken: json['api_token'] as String,
      expiryTime: DateTime.parse(json['expiry_time'] as String),
      permission: json['permission'] as String,
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'api_token': instance.accessToken,
      'expiry_time': instance.expiryTime.toIso8601String(),
      'permission': instance.permission,
    };
