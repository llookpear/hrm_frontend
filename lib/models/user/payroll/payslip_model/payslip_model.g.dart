// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaySlipModellImpl _$$PaySlipModellImplFromJson(Map<String, dynamic> json) =>
    _$PaySlipModellImpl(
      payslipID: (json['payslip_id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$PaySlipModellImplToJson(_$PaySlipModellImpl instance) =>
    <String, dynamic>{
      'payslip_id': instance.payslipID,
      'date': instance.date.toIso8601String(),
    };
