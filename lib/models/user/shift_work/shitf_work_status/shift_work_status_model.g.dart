// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_work_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShiftWorkStatusModelImpl _$$ShiftWorkStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ShiftWorkStatusModelImpl(
      shiftChangeID: (json['shift_change_id'] as num).toInt(),
      date: json['date'] as String,
      currentShift: (json['current_shift'] as num).toInt(),
      currentShiftTime: json['current_shift_time'] as String,
      desiredShift: (json['desired_shift'] as num).toInt(),
      desiredShiftTime: json['desired_shift_time'] as String,
      statusID: (json['status_id'] as num).toInt(),
      fullName: json['fullName'] as String,
      position: json['position'] as String,
      department: json['department'] as String,
      approvedBY: json['approved_by'] as String? ?? '-',
    );

Map<String, dynamic> _$$ShiftWorkStatusModelImplToJson(
        _$ShiftWorkStatusModelImpl instance) =>
    <String, dynamic>{
      'shift_change_id': instance.shiftChangeID,
      'date': instance.date,
      'current_shift': instance.currentShift,
      'current_shift_time': instance.currentShiftTime,
      'desired_shift': instance.desiredShift,
      'desired_shift_time': instance.desiredShiftTime,
      'status_id': instance.statusID,
      'fullName': instance.fullName,
      'position': instance.position,
      'department': instance.department,
      'approved_by': instance.approvedBY,
    };
