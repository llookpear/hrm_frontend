// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminShiftWorkModelImpl _$$AdminShiftWorkModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminShiftWorkModelImpl(
      shiftChangeID: (json['shift_change_id'] as num).toInt(),
      date: json['date'] as String,
      requestingShift: (json['current_shift'] as num).toInt(),
      requestingShiftTime: json['current_shift_time'] as String,
      requestingName: json['requesting_staff_name'] as String,
      requestingPosition: json['requesting_staff_position'] as String,
      requestingDepartment: json['requesting_staff_department'] as String,
      desiredShift: (json['desired_shift'] as num).toInt(),
      desiredShiftTime: json['desired_shift_time'] as String,
      desiredName: json['desired_staff_name'] as String,
      desiredPosition: json['desired_staff_position'] as String,
      desiredDepartment: json['desired_staff_department'] as String,
      statusID: (json['status_id'] as num).toInt(),
      approvedBY: json['approved_by'] as String? ?? '-',
    );

Map<String, dynamic> _$$AdminShiftWorkModelImplToJson(
        _$AdminShiftWorkModelImpl instance) =>
    <String, dynamic>{
      'shift_change_id': instance.shiftChangeID,
      'date': instance.date,
      'current_shift': instance.requestingShift,
      'current_shift_time': instance.requestingShiftTime,
      'requesting_staff_name': instance.requestingName,
      'requesting_staff_position': instance.requestingPosition,
      'requesting_staff_department': instance.requestingDepartment,
      'desired_shift': instance.desiredShift,
      'desired_shift_time': instance.desiredShiftTime,
      'desired_staff_name': instance.desiredName,
      'desired_staff_position': instance.desiredPosition,
      'desired_staff_department': instance.desiredDepartment,
      'status_id': instance.statusID,
      'approved_by': instance.approvedBY,
    };
