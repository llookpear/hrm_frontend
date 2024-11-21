// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OvertimeModelImpl _$$OvertimeModelImplFromJson(Map<String, dynamic> json) =>
    _$OvertimeModelImpl(
      otID: (json['ot_id'] as num).toInt(),
      title: json['title'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      statusID: (json['status_id'] as num).toInt(),
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      detail: json['detail'] as String? ?? '-',
      approvedBY: json['approved_by'] as String? ?? '-',
    );

Map<String, dynamic> _$$OvertimeModelImplToJson(_$OvertimeModelImpl instance) =>
    <String, dynamic>{
      'ot_id': instance.otID,
      'title': instance.title,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'status_id': instance.statusID,
      'date': instance.date,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'detail': instance.detail,
      'approved_by': instance.approvedBY,
    };
