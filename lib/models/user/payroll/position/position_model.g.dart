// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionModelImpl _$$PositionModelImplFromJson(Map<String, dynamic> json) =>
    _$PositionModelImpl(
      positionID: (json['position_id'] as num).toInt(),
      departmentID: DateTime.parse(json['department_id'] as String),
      position: json['position'] as String,
    );

Map<String, dynamic> _$$PositionModelImplToJson(_$PositionModelImpl instance) =>
    <String, dynamic>{
      'position_id': instance.positionID,
      'department_id': instance.departmentID.toIso8601String(),
      'position': instance.position,
    };
