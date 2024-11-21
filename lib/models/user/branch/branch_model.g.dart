// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchModelImpl _$$BranchModelImplFromJson(Map<String, dynamic> json) =>
    _$BranchModelImpl(
      branchID: (json['branch_id'] as num).toInt(),
      branchName: json['branch_name'] as String,
      lat: (json['latitude'] as num).toDouble(),
      lng: (json['longitude'] as num).toDouble(),
      identifier: json['identifier'] as String? ?? '-',
      uuid: json['uuid'] as String? ?? '-',
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      taxID: json['tax_id'] as String,
      locationDistance: (json['locationDistance'] as num?)?.toDouble() ?? 5,
    );

Map<String, dynamic> _$$BranchModelImplToJson(_$BranchModelImpl instance) =>
    <String, dynamic>{
      'branch_id': instance.branchID,
      'branch_name': instance.branchName,
      'latitude': instance.lat,
      'longitude': instance.lng,
      'identifier': instance.identifier,
      'uuid': instance.uuid,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'tax_id': instance.taxID,
      'locationDistance': instance.locationDistance,
    };
