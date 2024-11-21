// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) {
  return _BranchModel.fromJson(json);
}

/// @nodoc
mixin _$BranchModel {
  @JsonKey(name: 'branch_id')
  int get branchID => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_name')
  String get branchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double get lng => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_id')
  String get taxID => throw _privateConstructorUsedError;

  ///default
  double get locationDistance => throw _privateConstructorUsedError;

  /// Serializes this BranchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BranchModelCopyWith<BranchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchModelCopyWith<$Res> {
  factory $BranchModelCopyWith(
          BranchModel value, $Res Function(BranchModel) then) =
      _$BranchModelCopyWithImpl<$Res, BranchModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'branch_id') int branchID,
      @JsonKey(name: 'branch_name') String branchName,
      @JsonKey(name: 'latitude') double lat,
      @JsonKey(name: 'longitude') double lng,
      String identifier,
      String uuid,
      String address,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String email,
      @JsonKey(name: 'tax_id') String taxID,
      double locationDistance});
}

/// @nodoc
class _$BranchModelCopyWithImpl<$Res, $Val extends BranchModel>
    implements $BranchModelCopyWith<$Res> {
  _$BranchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchID = null,
    Object? branchName = null,
    Object? lat = null,
    Object? lng = null,
    Object? identifier = null,
    Object? uuid = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? taxID = null,
    Object? locationDistance = null,
  }) {
    return _then(_value.copyWith(
      branchID: null == branchID
          ? _value.branchID
          : branchID // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      taxID: null == taxID
          ? _value.taxID
          : taxID // ignore: cast_nullable_to_non_nullable
              as String,
      locationDistance: null == locationDistance
          ? _value.locationDistance
          : locationDistance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BranchModelImplCopyWith<$Res>
    implements $BranchModelCopyWith<$Res> {
  factory _$$BranchModelImplCopyWith(
          _$BranchModelImpl value, $Res Function(_$BranchModelImpl) then) =
      __$$BranchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'branch_id') int branchID,
      @JsonKey(name: 'branch_name') String branchName,
      @JsonKey(name: 'latitude') double lat,
      @JsonKey(name: 'longitude') double lng,
      String identifier,
      String uuid,
      String address,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String email,
      @JsonKey(name: 'tax_id') String taxID,
      double locationDistance});
}

/// @nodoc
class __$$BranchModelImplCopyWithImpl<$Res>
    extends _$BranchModelCopyWithImpl<$Res, _$BranchModelImpl>
    implements _$$BranchModelImplCopyWith<$Res> {
  __$$BranchModelImplCopyWithImpl(
      _$BranchModelImpl _value, $Res Function(_$BranchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchID = null,
    Object? branchName = null,
    Object? lat = null,
    Object? lng = null,
    Object? identifier = null,
    Object? uuid = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? taxID = null,
    Object? locationDistance = null,
  }) {
    return _then(_$BranchModelImpl(
      branchID: null == branchID
          ? _value.branchID
          : branchID // ignore: cast_nullable_to_non_nullable
              as int,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      taxID: null == taxID
          ? _value.taxID
          : taxID // ignore: cast_nullable_to_non_nullable
              as String,
      locationDistance: null == locationDistance
          ? _value.locationDistance
          : locationDistance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchModelImpl implements _BranchModel {
  const _$BranchModelImpl(
      {@JsonKey(name: 'branch_id') required this.branchID,
      @JsonKey(name: 'branch_name') required this.branchName,
      @JsonKey(name: 'latitude') required this.lat,
      @JsonKey(name: 'longitude') required this.lng,
      this.identifier = '-',
      this.uuid = '-',
      required this.address,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      required this.email,
      @JsonKey(name: 'tax_id') required this.taxID,
      this.locationDistance = 5});

  factory _$BranchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchModelImplFromJson(json);

  @override
  @JsonKey(name: 'branch_id')
  final int branchID;
  @override
  @JsonKey(name: 'branch_name')
  final String branchName;
  @override
  @JsonKey(name: 'latitude')
  final double lat;
  @override
  @JsonKey(name: 'longitude')
  final double lng;
  @override
  @JsonKey()
  final String identifier;
  @override
  @JsonKey()
  final String uuid;
  @override
  final String address;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String email;
  @override
  @JsonKey(name: 'tax_id')
  final String taxID;

  ///default
  @override
  @JsonKey()
  final double locationDistance;

  @override
  String toString() {
    return 'BranchModel(branchID: $branchID, branchName: $branchName, lat: $lat, lng: $lng, identifier: $identifier, uuid: $uuid, address: $address, phoneNumber: $phoneNumber, email: $email, taxID: $taxID, locationDistance: $locationDistance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchModelImpl &&
            (identical(other.branchID, branchID) ||
                other.branchID == branchID) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.taxID, taxID) || other.taxID == taxID) &&
            (identical(other.locationDistance, locationDistance) ||
                other.locationDistance == locationDistance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, branchID, branchName, lat, lng,
      identifier, uuid, address, phoneNumber, email, taxID, locationDistance);

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchModelImplCopyWith<_$BranchModelImpl> get copyWith =>
      __$$BranchModelImplCopyWithImpl<_$BranchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchModelImplToJson(
      this,
    );
  }
}

abstract class _BranchModel implements BranchModel {
  const factory _BranchModel(
      {@JsonKey(name: 'branch_id') required final int branchID,
      @JsonKey(name: 'branch_name') required final String branchName,
      @JsonKey(name: 'latitude') required final double lat,
      @JsonKey(name: 'longitude') required final double lng,
      final String identifier,
      final String uuid,
      required final String address,
      @JsonKey(name: 'phone_number') required final String phoneNumber,
      required final String email,
      @JsonKey(name: 'tax_id') required final String taxID,
      final double locationDistance}) = _$BranchModelImpl;

  factory _BranchModel.fromJson(Map<String, dynamic> json) =
      _$BranchModelImpl.fromJson;

  @override
  @JsonKey(name: 'branch_id')
  int get branchID;
  @override
  @JsonKey(name: 'branch_name')
  String get branchName;
  @override
  @JsonKey(name: 'latitude')
  double get lat;
  @override
  @JsonKey(name: 'longitude')
  double get lng;
  @override
  String get identifier;
  @override
  String get uuid;
  @override
  String get address;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  String get email;
  @override
  @JsonKey(name: 'tax_id')
  String get taxID;

  ///default
  @override
  double get locationDistance;

  /// Create a copy of BranchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BranchModelImplCopyWith<_$BranchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
