// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_out_total_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInOutTotalModelImpl _$$CheckInOutTotalModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckInOutTotalModelImpl(
      checkIn: (json['check_in'] as num?)?.toInt() ?? 0,
      checkOut: (json['check_out'] as num?)?.toInt() ?? 0,
      workDay: (json['work_days'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$$CheckInOutTotalModelImplToJson(
        _$CheckInOutTotalModelImpl instance) =>
    <String, dynamic>{
      'check_in': instance.checkIn,
      'check_out': instance.checkOut,
      'work_days': instance.workDay,
    };
