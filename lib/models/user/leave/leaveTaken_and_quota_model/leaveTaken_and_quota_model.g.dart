// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaveTaken_and_quota_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveTakenAndQuotaModelImpl _$$LeaveTakenAndQuotaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveTakenAndQuotaModelImpl(
      quota: (json['quota'] as num).toInt(),
      type: (json['type'] as num).toInt(),
      leaveTaken: json['leave_taken'] as String? ?? "0",
    );

Map<String, dynamic> _$$LeaveTakenAndQuotaModelImplToJson(
        _$LeaveTakenAndQuotaModelImpl instance) =>
    <String, dynamic>{
      'quota': instance.quota,
      'type': instance.type,
      'leave_taken': instance.leaveTaken,
    };
