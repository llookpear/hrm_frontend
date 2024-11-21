// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftWorkModelImpl _$$ShiftWorkModelImplFromJson(Map<String, dynamic> json) =>
    _$ShiftWorkModelImpl(
      rosterId: (json['roster_id'] as num).toInt(),
      staffId: (json['staff_id'] as num).toInt(),
      fullName: json['fullname'] as String,
      position: json['position'] as String,
      department: json['department'] as String,
      date: json['date'] as String,
      shiftTime: json['shift_time'] as String,
    );

Map<String, dynamic> _$$ShiftWorkModelImplToJson(
        _$ShiftWorkModelImpl instance) =>
    <String, dynamic>{
      'roster_id': instance.rosterId,
      'staff_id': instance.staffId,
      'fullname': instance.fullName,
      'position': instance.position,
      'department': instance.department,
      'date': instance.date,
      'shift_time': instance.shiftTime,
    };
