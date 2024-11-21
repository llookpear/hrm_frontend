// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_certificate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CertificateModelImpl _$$CertificateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CertificateModelImpl(
      certificateID: (json['certificate_id'] as num).toInt(),
      dateStamp: json['date_stamp'] as String,
      statusID: (json['status_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$CertificateModelImplToJson(
        _$CertificateModelImpl instance) =>
    <String, dynamic>{
      'certificate_id': instance.certificateID,
      'date_stamp': instance.dateStamp,
      'status_id': instance.statusID,
      'created_at': instance.createdAt,
    };
