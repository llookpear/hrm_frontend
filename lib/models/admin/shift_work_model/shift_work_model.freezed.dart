// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_work_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminShiftWorkModel _$AdminShiftWorkModelFromJson(Map<String, dynamic> json) {
  return _AdminShiftWorkModel.fromJson(json);
}

/// @nodoc
mixin _$AdminShiftWorkModel {
  @JsonKey(name: 'shift_change_id')
  int get shiftChangeID => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_shift')
  int get requestingShift => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_shift_time')
  String get requestingShiftTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'requesting_staff_name')
  String get requestingName => throw _privateConstructorUsedError;
  @JsonKey(name: 'requesting_staff_position')
  String get requestingPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'requesting_staff_department')
  String get requestingDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'desired_shift')
  int get desiredShift => throw _privateConstructorUsedError;
  @JsonKey(name: 'desired_shift_time')
  String get desiredShiftTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'desired_staff_name')
  String get desiredName => throw _privateConstructorUsedError;
  @JsonKey(name: 'desired_staff_position')
  String get desiredPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'desired_staff_department')
  String get desiredDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_id')
  int get statusID => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String get approvedBY => throw _privateConstructorUsedError;

  /// Serializes this AdminShiftWorkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminShiftWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminShiftWorkModelCopyWith<AdminShiftWorkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminShiftWorkModelCopyWith<$Res> {
  factory $AdminShiftWorkModelCopyWith(
          AdminShiftWorkModel value, $Res Function(AdminShiftWorkModel) then) =
      _$AdminShiftWorkModelCopyWithImpl<$Res, AdminShiftWorkModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'shift_change_id') int shiftChangeID,
      String date,
      @JsonKey(name: 'current_shift') int requestingShift,
      @JsonKey(name: 'current_shift_time') String requestingShiftTime,
      @JsonKey(name: 'requesting_staff_name') String requestingName,
      @JsonKey(name: 'requesting_staff_position') String requestingPosition,
      @JsonKey(name: 'requesting_staff_department') String requestingDepartment,
      @JsonKey(name: 'desired_shift') int desiredShift,
      @JsonKey(name: 'desired_shift_time') String desiredShiftTime,
      @JsonKey(name: 'desired_staff_name') String desiredName,
      @JsonKey(name: 'desired_staff_position') String desiredPosition,
      @JsonKey(name: 'desired_staff_department') String desiredDepartment,
      @JsonKey(name: 'status_id') int statusID,
      @JsonKey(name: 'approved_by') String approvedBY});
}

/// @nodoc
class _$AdminShiftWorkModelCopyWithImpl<$Res, $Val extends AdminShiftWorkModel>
    implements $AdminShiftWorkModelCopyWith<$Res> {
  _$AdminShiftWorkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminShiftWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftChangeID = null,
    Object? date = null,
    Object? requestingShift = null,
    Object? requestingShiftTime = null,
    Object? requestingName = null,
    Object? requestingPosition = null,
    Object? requestingDepartment = null,
    Object? desiredShift = null,
    Object? desiredShiftTime = null,
    Object? desiredName = null,
    Object? desiredPosition = null,
    Object? desiredDepartment = null,
    Object? statusID = null,
    Object? approvedBY = null,
  }) {
    return _then(_value.copyWith(
      shiftChangeID: null == shiftChangeID
          ? _value.shiftChangeID
          : shiftChangeID // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      requestingShift: null == requestingShift
          ? _value.requestingShift
          : requestingShift // ignore: cast_nullable_to_non_nullable
              as int,
      requestingShiftTime: null == requestingShiftTime
          ? _value.requestingShiftTime
          : requestingShiftTime // ignore: cast_nullable_to_non_nullable
              as String,
      requestingName: null == requestingName
          ? _value.requestingName
          : requestingName // ignore: cast_nullable_to_non_nullable
              as String,
      requestingPosition: null == requestingPosition
          ? _value.requestingPosition
          : requestingPosition // ignore: cast_nullable_to_non_nullable
              as String,
      requestingDepartment: null == requestingDepartment
          ? _value.requestingDepartment
          : requestingDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      desiredShift: null == desiredShift
          ? _value.desiredShift
          : desiredShift // ignore: cast_nullable_to_non_nullable
              as int,
      desiredShiftTime: null == desiredShiftTime
          ? _value.desiredShiftTime
          : desiredShiftTime // ignore: cast_nullable_to_non_nullable
              as String,
      desiredName: null == desiredName
          ? _value.desiredName
          : desiredName // ignore: cast_nullable_to_non_nullable
              as String,
      desiredPosition: null == desiredPosition
          ? _value.desiredPosition
          : desiredPosition // ignore: cast_nullable_to_non_nullable
              as String,
      desiredDepartment: null == desiredDepartment
          ? _value.desiredDepartment
          : desiredDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      approvedBY: null == approvedBY
          ? _value.approvedBY
          : approvedBY // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminShiftWorkModelImplCopyWith<$Res>
    implements $AdminShiftWorkModelCopyWith<$Res> {
  factory _$$AdminShiftWorkModelImplCopyWith(_$AdminShiftWorkModelImpl value,
          $Res Function(_$AdminShiftWorkModelImpl) then) =
      __$$AdminShiftWorkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'shift_change_id') int shiftChangeID,
      String date,
      @JsonKey(name: 'current_shift') int requestingShift,
      @JsonKey(name: 'current_shift_time') String requestingShiftTime,
      @JsonKey(name: 'requesting_staff_name') String requestingName,
      @JsonKey(name: 'requesting_staff_position') String requestingPosition,
      @JsonKey(name: 'requesting_staff_department') String requestingDepartment,
      @JsonKey(name: 'desired_shift') int desiredShift,
      @JsonKey(name: 'desired_shift_time') String desiredShiftTime,
      @JsonKey(name: 'desired_staff_name') String desiredName,
      @JsonKey(name: 'desired_staff_position') String desiredPosition,
      @JsonKey(name: 'desired_staff_department') String desiredDepartment,
      @JsonKey(name: 'status_id') int statusID,
      @JsonKey(name: 'approved_by') String approvedBY});
}

/// @nodoc
class __$$AdminShiftWorkModelImplCopyWithImpl<$Res>
    extends _$AdminShiftWorkModelCopyWithImpl<$Res, _$AdminShiftWorkModelImpl>
    implements _$$AdminShiftWorkModelImplCopyWith<$Res> {
  __$$AdminShiftWorkModelImplCopyWithImpl(_$AdminShiftWorkModelImpl _value,
      $Res Function(_$AdminShiftWorkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminShiftWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftChangeID = null,
    Object? date = null,
    Object? requestingShift = null,
    Object? requestingShiftTime = null,
    Object? requestingName = null,
    Object? requestingPosition = null,
    Object? requestingDepartment = null,
    Object? desiredShift = null,
    Object? desiredShiftTime = null,
    Object? desiredName = null,
    Object? desiredPosition = null,
    Object? desiredDepartment = null,
    Object? statusID = null,
    Object? approvedBY = null,
  }) {
    return _then(_$AdminShiftWorkModelImpl(
      shiftChangeID: null == shiftChangeID
          ? _value.shiftChangeID
          : shiftChangeID // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      requestingShift: null == requestingShift
          ? _value.requestingShift
          : requestingShift // ignore: cast_nullable_to_non_nullable
              as int,
      requestingShiftTime: null == requestingShiftTime
          ? _value.requestingShiftTime
          : requestingShiftTime // ignore: cast_nullable_to_non_nullable
              as String,
      requestingName: null == requestingName
          ? _value.requestingName
          : requestingName // ignore: cast_nullable_to_non_nullable
              as String,
      requestingPosition: null == requestingPosition
          ? _value.requestingPosition
          : requestingPosition // ignore: cast_nullable_to_non_nullable
              as String,
      requestingDepartment: null == requestingDepartment
          ? _value.requestingDepartment
          : requestingDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      desiredShift: null == desiredShift
          ? _value.desiredShift
          : desiredShift // ignore: cast_nullable_to_non_nullable
              as int,
      desiredShiftTime: null == desiredShiftTime
          ? _value.desiredShiftTime
          : desiredShiftTime // ignore: cast_nullable_to_non_nullable
              as String,
      desiredName: null == desiredName
          ? _value.desiredName
          : desiredName // ignore: cast_nullable_to_non_nullable
              as String,
      desiredPosition: null == desiredPosition
          ? _value.desiredPosition
          : desiredPosition // ignore: cast_nullable_to_non_nullable
              as String,
      desiredDepartment: null == desiredDepartment
          ? _value.desiredDepartment
          : desiredDepartment // ignore: cast_nullable_to_non_nullable
              as String,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      approvedBY: null == approvedBY
          ? _value.approvedBY
          : approvedBY // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminShiftWorkModelImpl implements _AdminShiftWorkModel {
  const _$AdminShiftWorkModelImpl(
      {@JsonKey(name: 'shift_change_id') required this.shiftChangeID,
      required this.date,
      @JsonKey(name: 'current_shift') required this.requestingShift,
      @JsonKey(name: 'current_shift_time') required this.requestingShiftTime,
      @JsonKey(name: 'requesting_staff_name') required this.requestingName,
      @JsonKey(name: 'requesting_staff_position')
      required this.requestingPosition,
      @JsonKey(name: 'requesting_staff_department')
      required this.requestingDepartment,
      @JsonKey(name: 'desired_shift') required this.desiredShift,
      @JsonKey(name: 'desired_shift_time') required this.desiredShiftTime,
      @JsonKey(name: 'desired_staff_name') required this.desiredName,
      @JsonKey(name: 'desired_staff_position') required this.desiredPosition,
      @JsonKey(name: 'desired_staff_department')
      required this.desiredDepartment,
      @JsonKey(name: 'status_id') required this.statusID,
      @JsonKey(name: 'approved_by') this.approvedBY = '-'});

  factory _$AdminShiftWorkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminShiftWorkModelImplFromJson(json);

  @override
  @JsonKey(name: 'shift_change_id')
  final int shiftChangeID;
  @override
  final String date;
  @override
  @JsonKey(name: 'current_shift')
  final int requestingShift;
  @override
  @JsonKey(name: 'current_shift_time')
  final String requestingShiftTime;
  @override
  @JsonKey(name: 'requesting_staff_name')
  final String requestingName;
  @override
  @JsonKey(name: 'requesting_staff_position')
  final String requestingPosition;
  @override
  @JsonKey(name: 'requesting_staff_department')
  final String requestingDepartment;
  @override
  @JsonKey(name: 'desired_shift')
  final int desiredShift;
  @override
  @JsonKey(name: 'desired_shift_time')
  final String desiredShiftTime;
  @override
  @JsonKey(name: 'desired_staff_name')
  final String desiredName;
  @override
  @JsonKey(name: 'desired_staff_position')
  final String desiredPosition;
  @override
  @JsonKey(name: 'desired_staff_department')
  final String desiredDepartment;
  @override
  @JsonKey(name: 'status_id')
  final int statusID;
  @override
  @JsonKey(name: 'approved_by')
  final String approvedBY;

  @override
  String toString() {
    return 'AdminShiftWorkModel(shiftChangeID: $shiftChangeID, date: $date, requestingShift: $requestingShift, requestingShiftTime: $requestingShiftTime, requestingName: $requestingName, requestingPosition: $requestingPosition, requestingDepartment: $requestingDepartment, desiredShift: $desiredShift, desiredShiftTime: $desiredShiftTime, desiredName: $desiredName, desiredPosition: $desiredPosition, desiredDepartment: $desiredDepartment, statusID: $statusID, approvedBY: $approvedBY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminShiftWorkModelImpl &&
            (identical(other.shiftChangeID, shiftChangeID) ||
                other.shiftChangeID == shiftChangeID) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.requestingShift, requestingShift) ||
                other.requestingShift == requestingShift) &&
            (identical(other.requestingShiftTime, requestingShiftTime) ||
                other.requestingShiftTime == requestingShiftTime) &&
            (identical(other.requestingName, requestingName) ||
                other.requestingName == requestingName) &&
            (identical(other.requestingPosition, requestingPosition) ||
                other.requestingPosition == requestingPosition) &&
            (identical(other.requestingDepartment, requestingDepartment) ||
                other.requestingDepartment == requestingDepartment) &&
            (identical(other.desiredShift, desiredShift) ||
                other.desiredShift == desiredShift) &&
            (identical(other.desiredShiftTime, desiredShiftTime) ||
                other.desiredShiftTime == desiredShiftTime) &&
            (identical(other.desiredName, desiredName) ||
                other.desiredName == desiredName) &&
            (identical(other.desiredPosition, desiredPosition) ||
                other.desiredPosition == desiredPosition) &&
            (identical(other.desiredDepartment, desiredDepartment) ||
                other.desiredDepartment == desiredDepartment) &&
            (identical(other.statusID, statusID) ||
                other.statusID == statusID) &&
            (identical(other.approvedBY, approvedBY) ||
                other.approvedBY == approvedBY));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      shiftChangeID,
      date,
      requestingShift,
      requestingShiftTime,
      requestingName,
      requestingPosition,
      requestingDepartment,
      desiredShift,
      desiredShiftTime,
      desiredName,
      desiredPosition,
      desiredDepartment,
      statusID,
      approvedBY);

  /// Create a copy of AdminShiftWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminShiftWorkModelImplCopyWith<_$AdminShiftWorkModelImpl> get copyWith =>
      __$$AdminShiftWorkModelImplCopyWithImpl<_$AdminShiftWorkModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminShiftWorkModelImplToJson(
      this,
    );
  }
}

abstract class _AdminShiftWorkModel implements AdminShiftWorkModel {
  const factory _AdminShiftWorkModel(
      {@JsonKey(name: 'shift_change_id') required final int shiftChangeID,
      required final String date,
      @JsonKey(name: 'current_shift') required final int requestingShift,
      @JsonKey(name: 'current_shift_time')
      required final String requestingShiftTime,
      @JsonKey(name: 'requesting_staff_name')
      required final String requestingName,
      @JsonKey(name: 'requesting_staff_position')
      required final String requestingPosition,
      @JsonKey(name: 'requesting_staff_department')
      required final String requestingDepartment,
      @JsonKey(name: 'desired_shift') required final int desiredShift,
      @JsonKey(name: 'desired_shift_time')
      required final String desiredShiftTime,
      @JsonKey(name: 'desired_staff_name') required final String desiredName,
      @JsonKey(name: 'desired_staff_position')
      required final String desiredPosition,
      @JsonKey(name: 'desired_staff_department')
      required final String desiredDepartment,
      @JsonKey(name: 'status_id') required final int statusID,
      @JsonKey(name: 'approved_by')
      final String approvedBY}) = _$AdminShiftWorkModelImpl;

  factory _AdminShiftWorkModel.fromJson(Map<String, dynamic> json) =
      _$AdminShiftWorkModelImpl.fromJson;

  @override
  @JsonKey(name: 'shift_change_id')
  int get shiftChangeID;
  @override
  String get date;
  @override
  @JsonKey(name: 'current_shift')
  int get requestingShift;
  @override
  @JsonKey(name: 'current_shift_time')
  String get requestingShiftTime;
  @override
  @JsonKey(name: 'requesting_staff_name')
  String get requestingName;
  @override
  @JsonKey(name: 'requesting_staff_position')
  String get requestingPosition;
  @override
  @JsonKey(name: 'requesting_staff_department')
  String get requestingDepartment;
  @override
  @JsonKey(name: 'desired_shift')
  int get desiredShift;
  @override
  @JsonKey(name: 'desired_shift_time')
  String get desiredShiftTime;
  @override
  @JsonKey(name: 'desired_staff_name')
  String get desiredName;
  @override
  @JsonKey(name: 'desired_staff_position')
  String get desiredPosition;
  @override
  @JsonKey(name: 'desired_staff_department')
  String get desiredDepartment;
  @override
  @JsonKey(name: 'status_id')
  int get statusID;
  @override
  @JsonKey(name: 'approved_by')
  String get approvedBY;

  /// Create a copy of AdminShiftWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminShiftWorkModelImplCopyWith<_$AdminShiftWorkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
