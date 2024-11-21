// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaySlipDetailModelImpl _$$PaySlipDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaySlipDetailModelImpl(
      payslipID: (json['payslip_id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      salaryDetail: json['salary_detail'] as String? ?? '-',
      salaryTypeID: (json['salary_type_id'] as num).toInt(),
    );

Map<String, dynamic> _$$PaySlipDetailModelImplToJson(
        _$PaySlipDetailModelImpl instance) =>
    <String, dynamic>{
      'payslip_id': instance.payslipID,
      'amount': instance.amount,
      'salary_detail': instance.salaryDetail,
      'salary_type_id': instance.salaryTypeID,
    };
