// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_out_total_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckInOutTotalModel _$CheckInOutTotalModelFromJson(Map<String, dynamic> json) {
  return _CheckInOutTotalModel.fromJson(json);
}

/// @nodoc
mixin _$CheckInOutTotalModel {
  @JsonKey(name: 'check_in')
  int get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out')
  int get checkOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_days')
  int get workDay => throw _privateConstructorUsedError;

  /// Serializes this CheckInOutTotalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInOutTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInOutTotalModelCopyWith<CheckInOutTotalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInOutTotalModelCopyWith<$Res> {
  factory $CheckInOutTotalModelCopyWith(CheckInOutTotalModel value,
          $Res Function(CheckInOutTotalModel) then) =
      _$CheckInOutTotalModelCopyWithImpl<$Res, CheckInOutTotalModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'check_in') int checkIn,
      @JsonKey(name: 'check_out') int checkOut,
      @JsonKey(name: 'work_days') int workDay});
}

/// @nodoc
class _$CheckInOutTotalModelCopyWithImpl<$Res,
        $Val extends CheckInOutTotalModel>
    implements $CheckInOutTotalModelCopyWith<$Res> {
  _$CheckInOutTotalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInOutTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkIn = null,
    Object? checkOut = null,
    Object? workDay = null,
  }) {
    return _then(_value.copyWith(
      checkIn: null == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as int,
      checkOut: null == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as int,
      workDay: null == workDay
          ? _value.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckInOutTotalModelImplCopyWith<$Res>
    implements $CheckInOutTotalModelCopyWith<$Res> {
  factory _$$CheckInOutTotalModelImplCopyWith(_$CheckInOutTotalModelImpl value,
          $Res Function(_$CheckInOutTotalModelImpl) then) =
      __$$CheckInOutTotalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'check_in') int checkIn,
      @JsonKey(name: 'check_out') int checkOut,
      @JsonKey(name: 'work_days') int workDay});
}

/// @nodoc
class __$$CheckInOutTotalModelImplCopyWithImpl<$Res>
    extends _$CheckInOutTotalModelCopyWithImpl<$Res, _$CheckInOutTotalModelImpl>
    implements _$$CheckInOutTotalModelImplCopyWith<$Res> {
  __$$CheckInOutTotalModelImplCopyWithImpl(_$CheckInOutTotalModelImpl _value,
      $Res Function(_$CheckInOutTotalModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckInOutTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkIn = null,
    Object? checkOut = null,
    Object? workDay = null,
  }) {
    return _then(_$CheckInOutTotalModelImpl(
      checkIn: null == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as int,
      checkOut: null == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as int,
      workDay: null == workDay
          ? _value.workDay
          : workDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInOutTotalModelImpl implements _CheckInOutTotalModel {
  const _$CheckInOutTotalModelImpl(
      {@JsonKey(name: 'check_in') this.checkIn = 0,
      @JsonKey(name: 'check_out') this.checkOut = 0,
      @JsonKey(name: 'work_days') this.workDay = 20});

  factory _$CheckInOutTotalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInOutTotalModelImplFromJson(json);

  @override
  @JsonKey(name: 'check_in')
  final int checkIn;
  @override
  @JsonKey(name: 'check_out')
  final int checkOut;
  @override
  @JsonKey(name: 'work_days')
  final int workDay;

  @override
  String toString() {
    return 'CheckInOutTotalModel(checkIn: $checkIn, checkOut: $checkOut, workDay: $workDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInOutTotalModelImpl &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.workDay, workDay) || other.workDay == workDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, checkIn, checkOut, workDay);

  /// Create a copy of CheckInOutTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInOutTotalModelImplCopyWith<_$CheckInOutTotalModelImpl>
      get copyWith =>
          __$$CheckInOutTotalModelImplCopyWithImpl<_$CheckInOutTotalModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInOutTotalModelImplToJson(
      this,
    );
  }
}

abstract class _CheckInOutTotalModel implements CheckInOutTotalModel {
  const factory _CheckInOutTotalModel(
          {@JsonKey(name: 'check_in') final int checkIn,
          @JsonKey(name: 'check_out') final int checkOut,
          @JsonKey(name: 'work_days') final int workDay}) =
      _$CheckInOutTotalModelImpl;

  factory _CheckInOutTotalModel.fromJson(Map<String, dynamic> json) =
      _$CheckInOutTotalModelImpl.fromJson;

  @override
  @JsonKey(name: 'check_in')
  int get checkIn;
  @override
  @JsonKey(name: 'check_out')
  int get checkOut;
  @override
  @JsonKey(name: 'work_days')
  int get workDay;

  /// Create a copy of CheckInOutTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInOutTotalModelImplCopyWith<_$CheckInOutTotalModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
