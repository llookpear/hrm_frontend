// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateUserModel _$UpdateUserModelFromJson(Map<String, dynamic> json) {
  return _UpdateUserModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserModel {
  @JsonKey(name: 'staff_id')
  int get staffID => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserModelCopyWith<UpdateUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserModelCopyWith<$Res> {
  factory $UpdateUserModelCopyWith(
          UpdateUserModel value, $Res Function(UpdateUserModel) then) =
      _$UpdateUserModelCopyWithImpl<$Res, UpdateUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'staff_id') int staffID,
      String firstname,
      String lastname,
      String phone,
      String email});
}

/// @nodoc
class _$UpdateUserModelCopyWithImpl<$Res, $Val extends UpdateUserModel>
    implements $UpdateUserModelCopyWith<$Res> {
  _$UpdateUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffID = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      staffID: null == staffID
          ? _value.staffID
          : staffID // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserModelImplCopyWith<$Res>
    implements $UpdateUserModelCopyWith<$Res> {
  factory _$$UpdateUserModelImplCopyWith(_$UpdateUserModelImpl value,
          $Res Function(_$UpdateUserModelImpl) then) =
      __$$UpdateUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'staff_id') int staffID,
      String firstname,
      String lastname,
      String phone,
      String email});
}

/// @nodoc
class __$$UpdateUserModelImplCopyWithImpl<$Res>
    extends _$UpdateUserModelCopyWithImpl<$Res, _$UpdateUserModelImpl>
    implements _$$UpdateUserModelImplCopyWith<$Res> {
  __$$UpdateUserModelImplCopyWithImpl(
      _$UpdateUserModelImpl _value, $Res Function(_$UpdateUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffID = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? phone = null,
    Object? email = null,
  }) {
    return _then(_$UpdateUserModelImpl(
      staffID: null == staffID
          ? _value.staffID
          : staffID // ignore: cast_nullable_to_non_nullable
              as int,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserModelImpl implements _UpdateUserModel {
  const _$UpdateUserModelImpl(
      {@JsonKey(name: 'staff_id') required this.staffID,
      required this.firstname,
      required this.lastname,
      required this.phone,
      required this.email});

  factory _$UpdateUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserModelImplFromJson(json);

  @override
  @JsonKey(name: 'staff_id')
  final int staffID;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String phone;
  @override
  final String email;

  @override
  String toString() {
    return 'UpdateUserModel(staffID: $staffID, firstname: $firstname, lastname: $lastname, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserModelImpl &&
            (identical(other.staffID, staffID) || other.staffID == staffID) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, staffID, firstname, lastname, phone, email);

  /// Create a copy of UpdateUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserModelImplCopyWith<_$UpdateUserModelImpl> get copyWith =>
      __$$UpdateUserModelImplCopyWithImpl<_$UpdateUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserModelImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserModel implements UpdateUserModel {
  const factory _UpdateUserModel(
      {@JsonKey(name: 'staff_id') required final int staffID,
      required final String firstname,
      required final String lastname,
      required final String phone,
      required final String email}) = _$UpdateUserModelImpl;

  factory _UpdateUserModel.fromJson(Map<String, dynamic> json) =
      _$UpdateUserModelImpl.fromJson;

  @override
  @JsonKey(name: 'staff_id')
  int get staffID;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get phone;
  @override
  String get email;

  /// Create a copy of UpdateUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserModelImplCopyWith<_$UpdateUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
