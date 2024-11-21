// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_out_time_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckInOutTimeModel _$CheckInOutTimeModelFromJson(Map<String, dynamic> json) {
  return _CheckInOutTimeModel.fromJson(json);
}

/// @nodoc
mixin _$CheckInOutTimeModel {
  String get time => throw _privateConstructorUsedError;

  /// Serializes this CheckInOutTimeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInOutTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInOutTimeModelCopyWith<CheckInOutTimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInOutTimeModelCopyWith<$Res> {
  factory $CheckInOutTimeModelCopyWith(
          CheckInOutTimeModel value, $Res Function(CheckInOutTimeModel) then) =
      _$CheckInOutTimeModelCopyWithImpl<$Res, CheckInOutTimeModel>;
  @useResult
  $Res call({String time});
}

/// @nodoc
class _$CheckInOutTimeModelCopyWithImpl<$Res, $Val extends CheckInOutTimeModel>
    implements $CheckInOutTimeModelCopyWith<$Res> {
  _$CheckInOutTimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInOutTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckInOutTimeModelImplCopyWith<$Res>
    implements $CheckInOutTimeModelCopyWith<$Res> {
  factory _$$CheckInOutTimeModelImplCopyWith(_$CheckInOutTimeModelImpl value,
          $Res Function(_$CheckInOutTimeModelImpl) then) =
      __$$CheckInOutTimeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String time});
}

/// @nodoc
class __$$CheckInOutTimeModelImplCopyWithImpl<$Res>
    extends _$CheckInOutTimeModelCopyWithImpl<$Res, _$CheckInOutTimeModelImpl>
    implements _$$CheckInOutTimeModelImplCopyWith<$Res> {
  __$$CheckInOutTimeModelImplCopyWithImpl(_$CheckInOutTimeModelImpl _value,
      $Res Function(_$CheckInOutTimeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckInOutTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_$CheckInOutTimeModelImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInOutTimeModelImpl implements _CheckInOutTimeModel {
  const _$CheckInOutTimeModelImpl({this.time = '-'});

  factory _$CheckInOutTimeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInOutTimeModelImplFromJson(json);

  @override
  @JsonKey()
  final String time;

  @override
  String toString() {
    return 'CheckInOutTimeModel(time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInOutTimeModelImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time);

  /// Create a copy of CheckInOutTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInOutTimeModelImplCopyWith<_$CheckInOutTimeModelImpl> get copyWith =>
      __$$CheckInOutTimeModelImplCopyWithImpl<_$CheckInOutTimeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInOutTimeModelImplToJson(
      this,
    );
  }
}

abstract class _CheckInOutTimeModel implements CheckInOutTimeModel {
  const factory _CheckInOutTimeModel({final String time}) =
      _$CheckInOutTimeModelImpl;

  factory _CheckInOutTimeModel.fromJson(Map<String, dynamic> json) =
      _$CheckInOutTimeModelImpl.fromJson;

  @override
  String get time;

  /// Create a copy of CheckInOutTimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInOutTimeModelImplCopyWith<_$CheckInOutTimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
