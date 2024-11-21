// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailModelImpl _$$UserDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDetailModelImpl(
      staffID: (json['staff_id'] as num).toInt(),
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      userImage: json['user_image'] as String? ?? "-",
    );

Map<String, dynamic> _$$UserDetailModelImplToJson(
        _$UserDetailModelImpl instance) =>
    <String, dynamic>{
      'staff_id': instance.staffID,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
      'phone': instance.phone,
      'gender': instance.gender,
      'user_image': instance.userImage,
    };
