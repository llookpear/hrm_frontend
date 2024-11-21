// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OvertimeHistoryModelImpl _$$OvertimeHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OvertimeHistoryModelImpl(
      otID: (json['ot_id'] as num).toInt(),
      statusID: (json['status_id'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      detail: json['detail'] as String? ?? '-',
      approvedBy: json['approved_by'] as String? ?? '-',
    );

Map<String, dynamic> _$$OvertimeHistoryModelImplToJson(
        _$OvertimeHistoryModelImpl instance) =>
    <String, dynamic>{
      'ot_id': instance.otID,
      'status_id': instance.statusID,
      'total': instance.total,
      'date': instance.date,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'detail': instance.detail,
      'approved_by': instance.approvedBy,
    };
