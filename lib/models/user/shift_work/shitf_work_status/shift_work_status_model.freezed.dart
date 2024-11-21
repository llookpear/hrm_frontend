// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_work_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShiftWorkStatusModel _$ShiftWorkStatusModelFromJson(Map<String, dynamic> json) {
  return _ShiftWorkStatusModel.fromJson(json);
}

/// @nodoc
mixin _$ShiftWorkStatusModel {
  @JsonKey(name: 'shift_change_id')
  int get shiftChangeID => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_shift')
  int get currentShift => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_shift_time')
  String get currentShiftTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'desired_shift')
  int get desiredShift => throw _privateConstructorUsedError;
  @JsonKey(name: 'desired_shift_time')
  String get desiredShiftTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_id')
  int get statusID => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String get approvedBY => throw _privateConstructorUsedError;

  /// Serializes this ShiftWorkStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShiftWorkStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftWorkStatusModelCopyWith<ShiftWorkStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftWorkStatusModelCopyWith<$Res> {
  factory $ShiftWorkStatusModelCopyWith(ShiftWorkStatusModel value,
          $Res Function(ShiftWorkStatusModel) then) =
      _$ShiftWorkStatusModelCopyWithImpl<$Res, ShiftWorkStatusModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'shift_change_id') int shiftChangeID,
      String date,
      @JsonKey(name: 'current_shift') int currentShift,
      @JsonKey(name: 'current_shift_time') String currentShiftTime,
      @JsonKey(name: 'desired_shift') int desiredShift,
      @JsonKey(name: 'desired_shift_time') String desiredShiftTime,
      @JsonKey(name: 'status_id') int statusID,
      String fullName,
      String position,
      String department,
      @JsonKey(name: 'approved_by') String approvedBY});
}

/// @nodoc
class _$ShiftWorkStatusModelCopyWithImpl<$Res,
        $Val extends ShiftWorkStatusModel>
    implements $ShiftWorkStatusModelCopyWith<$Res> {
  _$ShiftWorkStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftWorkStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftChangeID = null,
    Object? date = null,
    Object? currentShift = null,
    Object? currentShiftTime = null,
    Object? desiredShift = null,
    Object? desiredShiftTime = null,
    Object? statusID = null,
    Object? fullName = null,
    Object? position = null,
    Object? department = null,
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
      currentShift: null == currentShift
          ? _value.currentShift
          : currentShift // ignore: cast_nullable_to_non_nullable
              as int,
      currentShiftTime: null == currentShiftTime
          ? _value.currentShiftTime
          : currentShiftTime // ignore: cast_nullable_to_non_nullable
              as String,
      desiredShift: null == desiredShift
          ? _value.desiredShift
          : desiredShift // ignore: cast_nullable_to_non_nullable
              as int,
      desiredShiftTime: null == desiredShiftTime
          ? _value.desiredShiftTime
          : desiredShiftTime // ignore: cast_nullable_to_non_nullable
              as String,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBY: null == approvedBY
          ? _value.approvedBY
          : approvedBY // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftWorkStatusModelImplCopyWith<$Res>
    implements $ShiftWorkStatusModelCopyWith<$Res> {
  factory _$$ShiftWorkStatusModelImplCopyWith(_$ShiftWorkStatusModelImpl value,
          $Res Function(_$ShiftWorkStatusModelImpl) then) =
      __$$ShiftWorkStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'shift_change_id') int shiftChangeID,
      String date,
      @JsonKey(name: 'current_shift') int currentShift,
      @JsonKey(name: 'current_shift_time') String currentShiftTime,
      @JsonKey(name: 'desired_shift') int desiredShift,
      @JsonKey(name: 'desired_shift_time') String desiredShiftTime,
      @JsonKey(name: 'status_id') int statusID,
      String fullName,
      String position,
      String department,
      @JsonKey(name: 'approved_by') String approvedBY});
}

/// @nodoc
class __$$ShiftWorkStatusModelImplCopyWithImpl<$Res>
    extends _$ShiftWorkStatusModelCopyWithImpl<$Res, _$ShiftWorkStatusModelImpl>
    implements _$$ShiftWorkStatusModelImplCopyWith<$Res> {
  __$$ShiftWorkStatusModelImplCopyWithImpl(_$ShiftWorkStatusModelImpl _value,
      $Res Function(_$ShiftWorkStatusModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShiftWorkStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shiftChangeID = null,
    Object? date = null,
    Object? currentShift = null,
    Object? currentShiftTime = null,
    Object? desiredShift = null,
    Object? desiredShiftTime = null,
    Object? statusID = null,
    Object? fullName = null,
    Object? position = null,
    Object? department = null,
    Object? approvedBY = null,
  }) {
    return _then(_$ShiftWorkStatusModelImpl(
      shiftChangeID: null == shiftChangeID
          ? _value.shiftChangeID
          : shiftChangeID // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      currentShift: null == currentShift
          ? _value.currentShift
          : currentShift // ignore: cast_nullable_to_non_nullable
              as int,
      currentShiftTime: null == currentShiftTime
          ? _value.currentShiftTime
          : currentShiftTime // ignore: cast_nullable_to_non_nullable
              as String,
      desiredShift: null == desiredShift
          ? _value.desiredShift
          : desiredShift // ignore: cast_nullable_to_non_nullable
              as int,
      desiredShiftTime: null == desiredShiftTime
          ? _value.desiredShiftTime
          : desiredShiftTime // ignore: cast_nullable_to_non_nullable
              as String,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBY: null == approvedBY
          ? _value.approvedBY
          : approvedBY // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftWorkStatusModelImpl implements _ShiftWorkStatusModel {
  const _$ShiftWorkStatusModelImpl(
      {@JsonKey(name: 'shift_change_id') required this.shiftChangeID,
      required this.date,
      @JsonKey(name: 'current_shift') required this.currentShift,
      @JsonKey(name: 'current_shift_time') required this.currentShiftTime,
      @JsonKey(name: 'desired_shift') required this.desiredShift,
      @JsonKey(name: 'desired_shift_time') required this.desiredShiftTime,
      @JsonKey(name: 'status_id') required this.statusID,
      required this.fullName,
      required this.position,
      required this.department,
      @JsonKey(name: 'approved_by') this.approvedBY = '-'});

  factory _$ShiftWorkStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftWorkStatusModelImplFromJson(json);

  @override
  @JsonKey(name: 'shift_change_id')
  final int shiftChangeID;
  @override
  final String date;
  @override
  @JsonKey(name: 'current_shift')
  final int currentShift;
  @override
  @JsonKey(name: 'current_shift_time')
  final String currentShiftTime;
  @override
  @JsonKey(name: 'desired_shift')
  final int desiredShift;
  @override
  @JsonKey(name: 'desired_shift_time')
  final String desiredShiftTime;
  @override
  @JsonKey(name: 'status_id')
  final int statusID;
  @override
  final String fullName;
  @override
  final String position;
  @override
  final String department;
  @override
  @JsonKey(name: 'approved_by')
  final String approvedBY;

  @override
  String toString() {
    return 'ShiftWorkStatusModel(shiftChangeID: $shiftChangeID, date: $date, currentShift: $currentShift, currentShiftTime: $currentShiftTime, desiredShift: $desiredShift, desiredShiftTime: $desiredShiftTime, statusID: $statusID, fullName: $fullName, position: $position, department: $department, approvedBY: $approvedBY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftWorkStatusModelImpl &&
            (identical(other.shiftChangeID, shiftChangeID) ||
                other.shiftChangeID == shiftChangeID) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.currentShift, currentShift) ||
                other.currentShift == currentShift) &&
            (identical(other.currentShiftTime, currentShiftTime) ||
                other.currentShiftTime == currentShiftTime) &&
            (identical(other.desiredShift, desiredShift) ||
                other.desiredShift == desiredShift) &&
            (identical(other.desiredShiftTime, desiredShiftTime) ||
                other.desiredShiftTime == desiredShiftTime) &&
            (identical(other.statusID, statusID) ||
                other.statusID == statusID) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.approvedBY, approvedBY) ||
                other.approvedBY == approvedBY));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      shiftChangeID,
      date,
      currentShift,
      currentShiftTime,
      desiredShift,
      desiredShiftTime,
      statusID,
      fullName,
      position,
      department,
      approvedBY);

  /// Create a copy of ShiftWorkStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftWorkStatusModelImplCopyWith<_$ShiftWorkStatusModelImpl>
      get copyWith =>
          __$$ShiftWorkStatusModelImplCopyWithImpl<_$ShiftWorkStatusModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftWorkStatusModelImplToJson(
      this,
    );
  }
}

abstract class _ShiftWorkStatusModel implements ShiftWorkStatusModel {
  const factory _ShiftWorkStatusModel(
          {@JsonKey(name: 'shift_change_id') required final int shiftChangeID,
          required final String date,
          @JsonKey(name: 'current_shift') required final int currentShift,
          @JsonKey(name: 'current_shift_time')
          required final String currentShiftTime,
          @JsonKey(name: 'desired_shift') required final int desiredShift,
          @JsonKey(name: 'desired_shift_time')
          required final String desiredShiftTime,
          @JsonKey(name: 'status_id') required final int statusID,
          required final String fullName,
          required final String position,
          required final String department,
          @JsonKey(name: 'approved_by') final String approvedBY}) =
      _$ShiftWorkStatusModelImpl;

  factory _ShiftWorkStatusModel.fromJson(Map<String, dynamic> json) =
      _$ShiftWorkStatusModelImpl.fromJson;

  @override
  @JsonKey(name: 'shift_change_id')
  int get shiftChangeID;
  @override
  String get date;
  @override
  @JsonKey(name: 'current_shift')
  int get currentShift;
  @override
  @JsonKey(name: 'current_shift_time')
  String get currentShiftTime;
  @override
  @JsonKey(name: 'desired_shift')
  int get desiredShift;
  @override
  @JsonKey(name: 'desired_shift_time')
  String get desiredShiftTime;
  @override
  @JsonKey(name: 'status_id')
  int get statusID;
  @override
  String get fullName;
  @override
  String get position;
  @override
  String get department;
  @override
  @JsonKey(name: 'approved_by')
  String get approvedBY;

  /// Create a copy of ShiftWorkStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftWorkStatusModelImplCopyWith<_$ShiftWorkStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
