// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveStatusModelImpl _$$LeaveStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveStatusModelImpl(
      leaveID: (json['leave_id'] as num).toInt(),
      type: (json['type'] as num).toInt(),
      statusID: (json['status_id'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      detail: json['detail'] as String? ?? '-',
      file: json['file'] as String? ?? '-',
      approvedBy: json['approved_by'] as String? ?? '-',
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
    );

Map<String, dynamic> _$$LeaveStatusModelImplToJson(
        _$LeaveStatusModelImpl instance) =>
    <String, dynamic>{
      'leave_id': instance.leaveID,
      'type': instance.type,
      'status_id': instance.statusID,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'detail': instance.detail,
      'file': instance.file,
      'approved_by': instance.approvedBy,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
