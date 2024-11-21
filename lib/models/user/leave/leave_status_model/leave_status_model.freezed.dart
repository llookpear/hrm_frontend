// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveStatusModel _$LeaveStatusModelFromJson(Map<String, dynamic> json) {
  return _LeaveStatusModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveStatusModel {
  @JsonKey(name: 'leave_id')
  int get leaveID => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_id')
  int get statusID => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String get file => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String get approvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;

  /// Serializes this LeaveStatusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveStatusModelCopyWith<LeaveStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveStatusModelCopyWith<$Res> {
  factory $LeaveStatusModelCopyWith(
          LeaveStatusModel value, $Res Function(LeaveStatusModel) then) =
      _$LeaveStatusModelCopyWithImpl<$Res, LeaveStatusModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'leave_id') int leaveID,
      int type,
      @JsonKey(name: 'status_id') int statusID,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String detail,
      String file,
      @JsonKey(name: 'approved_by') String approvedBy,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime});
}

/// @nodoc
class _$LeaveStatusModelCopyWithImpl<$Res, $Val extends LeaveStatusModel>
    implements $LeaveStatusModelCopyWith<$Res> {
  _$LeaveStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaveID = null,
    Object? type = null,
    Object? statusID = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? detail = null,
    Object? file = null,
    Object? approvedBy = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      leaveID: null == leaveID
          ? _value.leaveID
          : leaveID // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBy: null == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveStatusModelImplCopyWith<$Res>
    implements $LeaveStatusModelCopyWith<$Res> {
  factory _$$LeaveStatusModelImplCopyWith(_$LeaveStatusModelImpl value,
          $Res Function(_$LeaveStatusModelImpl) then) =
      __$$LeaveStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'leave_id') int leaveID,
      int type,
      @JsonKey(name: 'status_id') int statusID,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String detail,
      String file,
      @JsonKey(name: 'approved_by') String approvedBy,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime});
}

/// @nodoc
class __$$LeaveStatusModelImplCopyWithImpl<$Res>
    extends _$LeaveStatusModelCopyWithImpl<$Res, _$LeaveStatusModelImpl>
    implements _$$LeaveStatusModelImplCopyWith<$Res> {
  __$$LeaveStatusModelImplCopyWithImpl(_$LeaveStatusModelImpl _value,
      $Res Function(_$LeaveStatusModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaveStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaveID = null,
    Object? type = null,
    Object? statusID = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? detail = null,
    Object? file = null,
    Object? approvedBy = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$LeaveStatusModelImpl(
      leaveID: null == leaveID
          ? _value.leaveID
          : leaveID // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBy: null == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveStatusModelImpl extends _LeaveStatusModel {
  _$LeaveStatusModelImpl(
      {@JsonKey(name: 'leave_id') required this.leaveID,
      required this.type,
      @JsonKey(name: 'status_id') required this.statusID,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      this.detail = '-',
      this.file = '-',
      @JsonKey(name: 'approved_by') this.approvedBy = '-',
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime})
      : super._();

  factory _$LeaveStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveStatusModelImplFromJson(json);

  @override
  @JsonKey(name: 'leave_id')
  final int leaveID;
  @override
  final int type;
  @override
  @JsonKey(name: 'status_id')
  final int statusID;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  @JsonKey()
  final String detail;
  @override
  @JsonKey()
  final String file;
  @override
  @JsonKey(name: 'approved_by')
  final String approvedBy;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;

  @override
  String toString() {
    return 'LeaveStatusModel(leaveID: $leaveID, type: $type, statusID: $statusID, startDate: $startDate, endDate: $endDate, detail: $detail, file: $file, approvedBy: $approvedBy, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveStatusModelImpl &&
            (identical(other.leaveID, leaveID) || other.leaveID == leaveID) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.statusID, statusID) ||
                other.statusID == statusID) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, leaveID, type, statusID,
      startDate, endDate, detail, file, approvedBy, startTime, endTime);

  /// Create a copy of LeaveStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveStatusModelImplCopyWith<_$LeaveStatusModelImpl> get copyWith =>
      __$$LeaveStatusModelImplCopyWithImpl<_$LeaveStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveStatusModelImplToJson(
      this,
    );
  }
}

abstract class _LeaveStatusModel extends LeaveStatusModel {
  factory _LeaveStatusModel(
          {@JsonKey(name: 'leave_id') required final int leaveID,
          required final int type,
          @JsonKey(name: 'status_id') required final int statusID,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') required final String endDate,
          final String detail,
          final String file,
          @JsonKey(name: 'approved_by') final String approvedBy,
          @JsonKey(name: 'start_time') required final String startTime,
          @JsonKey(name: 'end_time') required final String endTime}) =
      _$LeaveStatusModelImpl;
  _LeaveStatusModel._() : super._();

  factory _LeaveStatusModel.fromJson(Map<String, dynamic> json) =
      _$LeaveStatusModelImpl.fromJson;

  @override
  @JsonKey(name: 'leave_id')
  int get leaveID;
  @override
  int get type;
  @override
  @JsonKey(name: 'status_id')
  int get statusID;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  String get detail;
  @override
  String get file;
  @override
  @JsonKey(name: 'approved_by')
  String get approvedBy;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;

  /// Create a copy of LeaveStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveStatusModelImplCopyWith<_$LeaveStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
