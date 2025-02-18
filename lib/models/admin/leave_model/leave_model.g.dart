// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveModelImpl _$$LeaveModelImplFromJson(Map<String, dynamic> json) =>
    _$LeaveModelImpl(
      leaveID: (json['leave_id'] as num).toInt(),
      title: json['title'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      position: json['position'] as String,
      department: json['department'] as String,
      type: (json['type'] as num).toInt(),
      statusID: (json['status_id'] as num).toInt(),
      detail: json['detail'] as String? ?? '-',
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      total: (json['total'] as num).toInt(),
      file: json['file'] as String? ?? '-',
      approvedBY: json['approved_by'] as String? ?? '-',
    );

Map<String, dynamic> _$$LeaveModelImplToJson(_$LeaveModelImpl instance) =>
    <String, dynamic>{
      'leave_id': instance.leaveID,
      'title': instance.title,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'position': instance.position,
      'department': instance.department,
      'type': instance.type,
      'status_id': instance.statusID,
      'detail': instance.detail,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'total': instance.total,
      'file': instance.file,
      'approved_by': instance.approvedBY,
    };
