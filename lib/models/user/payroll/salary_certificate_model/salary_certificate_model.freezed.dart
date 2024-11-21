// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_certificate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CertificateModel _$CertificateModelFromJson(Map<String, dynamic> json) {
  return _CertificateModel.fromJson(json);
}

/// @nodoc
mixin _$CertificateModel {
  @JsonKey(name: 'certificate_id')
  int get certificateID => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_stamp')
  String get dateStamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_id')
  int get statusID => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CertificateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CertificateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateModelCopyWith<CertificateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateModelCopyWith<$Res> {
  factory $CertificateModelCopyWith(
          CertificateModel value, $Res Function(CertificateModel) then) =
      _$CertificateModelCopyWithImpl<$Res, CertificateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'certificate_id') int certificateID,
      @JsonKey(name: 'date_stamp') String dateStamp,
      @JsonKey(name: 'status_id') int statusID,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$CertificateModelCopyWithImpl<$Res, $Val extends CertificateModel>
    implements $CertificateModelCopyWith<$Res> {
  _$CertificateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertificateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificateID = null,
    Object? dateStamp = null,
    Object? statusID = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      certificateID: null == certificateID
          ? _value.certificateID
          : certificateID // ignore: cast_nullable_to_non_nullable
              as int,
      dateStamp: null == dateStamp
          ? _value.dateStamp
          : dateStamp // ignore: cast_nullable_to_non_nullable
              as String,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertificateModelImplCopyWith<$Res>
    implements $CertificateModelCopyWith<$Res> {
  factory _$$CertificateModelImplCopyWith(_$CertificateModelImpl value,
          $Res Function(_$CertificateModelImpl) then) =
      __$$CertificateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'certificate_id') int certificateID,
      @JsonKey(name: 'date_stamp') String dateStamp,
      @JsonKey(name: 'status_id') int statusID,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$CertificateModelImplCopyWithImpl<$Res>
    extends _$CertificateModelCopyWithImpl<$Res, _$CertificateModelImpl>
    implements _$$CertificateModelImplCopyWith<$Res> {
  __$$CertificateModelImplCopyWithImpl(_$CertificateModelImpl _value,
      $Res Function(_$CertificateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? certificateID = null,
    Object? dateStamp = null,
    Object? statusID = null,
    Object? createdAt = null,
  }) {
    return _then(_$CertificateModelImpl(
      certificateID: null == certificateID
          ? _value.certificateID
          : certificateID // ignore: cast_nullable_to_non_nullable
              as int,
      dateStamp: null == dateStamp
          ? _value.dateStamp
          : dateStamp // ignore: cast_nullable_to_non_nullable
              as String,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CertificateModelImpl extends _CertificateModel {
  _$CertificateModelImpl(
      {@JsonKey(name: 'certificate_id') required this.certificateID,
      @JsonKey(name: 'date_stamp') required this.dateStamp,
      @JsonKey(name: 'status_id') required this.statusID,
      @JsonKey(name: 'created_at') required this.createdAt})
      : super._();

  factory _$CertificateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CertificateModelImplFromJson(json);

  @override
  @JsonKey(name: 'certificate_id')
  final int certificateID;
  @override
  @JsonKey(name: 'date_stamp')
  final String dateStamp;
  @override
  @JsonKey(name: 'status_id')
  final int statusID;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'CertificateModel(certificateID: $certificateID, dateStamp: $dateStamp, statusID: $statusID, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateModelImpl &&
            (identical(other.certificateID, certificateID) ||
                other.certificateID == certificateID) &&
            (identical(other.dateStamp, dateStamp) ||
                other.dateStamp == dateStamp) &&
            (identical(other.statusID, statusID) ||
                other.statusID == statusID) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, certificateID, dateStamp, statusID, createdAt);

  /// Create a copy of CertificateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateModelImplCopyWith<_$CertificateModelImpl> get copyWith =>
      __$$CertificateModelImplCopyWithImpl<_$CertificateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CertificateModelImplToJson(
      this,
    );
  }
}

abstract class _CertificateModel extends CertificateModel {
  factory _CertificateModel(
          {@JsonKey(name: 'certificate_id') required final int certificateID,
          @JsonKey(name: 'date_stamp') required final String dateStamp,
          @JsonKey(name: 'status_id') required final int statusID,
          @JsonKey(name: 'created_at') required final String createdAt}) =
      _$CertificateModelImpl;
  _CertificateModel._() : super._();

  factory _CertificateModel.fromJson(Map<String, dynamic> json) =
      _$CertificateModelImpl.fromJson;

  @override
  @JsonKey(name: 'certificate_id')
  int get certificateID;
  @override
  @JsonKey(name: 'date_stamp')
  String get dateStamp;
  @override
  @JsonKey(name: 'status_id')
  int get statusID;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of CertificateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateModelImplCopyWith<_$CertificateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
