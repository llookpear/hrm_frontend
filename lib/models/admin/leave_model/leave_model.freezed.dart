// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveModel _$LeaveModelFromJson(Map<String, dynamic> json) {
  return _LeaveModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveModel {
  @JsonKey(name: 'leave_id')
  int get leaveID => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_id')
  int get statusID => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  String get file => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String get approvedBY => throw _privateConstructorUsedError;

  /// Serializes this LeaveModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveModelCopyWith<LeaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveModelCopyWith<$Res> {
  factory $LeaveModelCopyWith(
          LeaveModel value, $Res Function(LeaveModel) then) =
      _$LeaveModelCopyWithImpl<$Res, LeaveModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'leave_id') int leaveID,
      String title,
      String firstname,
      String lastname,
      String position,
      String department,
      int type,
      @JsonKey(name: 'status_id') int statusID,
      String detail,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      int total,
      String file,
      @JsonKey(name: 'approved_by') String approvedBY});
}

/// @nodoc
class _$LeaveModelCopyWithImpl<$Res, $Val extends LeaveModel>
    implements $LeaveModelCopyWith<$Res> {
  _$LeaveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaveID = null,
    Object? title = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? position = null,
    Object? department = null,
    Object? type = null,
    Object? statusID = null,
    Object? detail = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? total = null,
    Object? file = null,
    Object? approvedBY = null,
  }) {
    return _then(_value.copyWith(
      leaveID: null == leaveID
          ? _value.leaveID
          : leaveID // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBY: null == approvedBY
          ? _value.approvedBY
          : approvedBY // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveModelImplCopyWith<$Res>
    implements $LeaveModelCopyWith<$Res> {
  factory _$$LeaveModelImplCopyWith(
          _$LeaveModelImpl value, $Res Function(_$LeaveModelImpl) then) =
      __$$LeaveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'leave_id') int leaveID,
      String title,
      String firstname,
      String lastname,
      String position,
      String department,
      int type,
      @JsonKey(name: 'status_id') int statusID,
      String detail,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      int total,
      String file,
      @JsonKey(name: 'approved_by') String approvedBY});
}

/// @nodoc
class __$$LeaveModelImplCopyWithImpl<$Res>
    extends _$LeaveModelCopyWithImpl<$Res, _$LeaveModelImpl>
    implements _$$LeaveModelImplCopyWith<$Res> {
  __$$LeaveModelImplCopyWithImpl(
      _$LeaveModelImpl _value, $Res Function(_$LeaveModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leaveID = null,
    Object? title = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? position = null,
    Object? department = null,
    Object? type = null,
    Object? statusID = null,
    Object? detail = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? total = null,
    Object? file = null,
    Object? approvedBY = null,
  }) {
    return _then(_$LeaveModelImpl(
      leaveID: null == leaveID
          ? _value.leaveID
          : leaveID // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
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
class _$LeaveModelImpl implements _LeaveModel {
  const _$LeaveModelImpl(
      {@JsonKey(name: 'leave_id') required this.leaveID,
      required this.title,
      required this.firstname,
      required this.lastname,
      required this.position,
      required this.department,
      required this.type,
      @JsonKey(name: 'status_id') required this.statusID,
      this.detail = '-',
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      required this.total,
      this.file = '-',
      @JsonKey(name: 'approved_by') this.approvedBY = '-'});

  factory _$LeaveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveModelImplFromJson(json);

  @override
  @JsonKey(name: 'leave_id')
  final int leaveID;
  @override
  final String title;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String position;
  @override
  final String department;
  @override
  final int type;
  @override
  @JsonKey(name: 'status_id')
  final int statusID;
  @override
  @JsonKey()
  final String detail;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  final int total;
  @override
  @JsonKey()
  final String file;
  @override
  @JsonKey(name: 'approved_by')
  final String approvedBY;

  @override
  String toString() {
    return 'LeaveModel(leaveID: $leaveID, title: $title, firstname: $firstname, lastname: $lastname, position: $position, department: $department, type: $type, statusID: $statusID, detail: $detail, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, total: $total, file: $file, approvedBY: $approvedBY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveModelImpl &&
            (identical(other.leaveID, leaveID) || other.leaveID == leaveID) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.statusID, statusID) ||
                other.statusID == statusID) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.approvedBY, approvedBY) ||
                other.approvedBY == approvedBY));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      leaveID,
      title,
      firstname,
      lastname,
      position,
      department,
      type,
      statusID,
      detail,
      startDate,
      endDate,
      startTime,
      endTime,
      total,
      file,
      approvedBY);

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveModelImplCopyWith<_$LeaveModelImpl> get copyWith =>
      __$$LeaveModelImplCopyWithImpl<_$LeaveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveModelImplToJson(
      this,
    );
  }
}

abstract class _LeaveModel implements LeaveModel {
  const factory _LeaveModel(
          {@JsonKey(name: 'leave_id') required final int leaveID,
          required final String title,
          required final String firstname,
          required final String lastname,
          required final String position,
          required final String department,
          required final int type,
          @JsonKey(name: 'status_id') required final int statusID,
          final String detail,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') required final String endDate,
          @JsonKey(name: 'start_time') required final String startTime,
          @JsonKey(name: 'end_time') required final String endTime,
          required final int total,
          final String file,
          @JsonKey(name: 'approved_by') final String approvedBY}) =
      _$LeaveModelImpl;

  factory _LeaveModel.fromJson(Map<String, dynamic> json) =
      _$LeaveModelImpl.fromJson;

  @override
  @JsonKey(name: 'leave_id')
  int get leaveID;
  @override
  String get title;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get position;
  @override
  String get department;
  @override
  int get type;
  @override
  @JsonKey(name: 'status_id')
  int get statusID;
  @override
  String get detail;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  int get total;
  @override
  String get file;
  @override
  @JsonKey(name: 'approved_by')
  String get approvedBY;

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveModelImplCopyWith<_$LeaveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
