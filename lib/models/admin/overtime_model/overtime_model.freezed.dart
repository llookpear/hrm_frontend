// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overtime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OvertimeModel _$OvertimeModelFromJson(Map<String, dynamic> json) {
  return _OvertimeModel.fromJson(json);
}

/// @nodoc
mixin _$OvertimeModel {
  @JsonKey(name: 'ot_id')
  int get otID => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_id')
  int get statusID => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String get approvedBY => throw _privateConstructorUsedError;

  /// Serializes this OvertimeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OvertimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OvertimeModelCopyWith<OvertimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeModelCopyWith<$Res> {
  factory $OvertimeModelCopyWith(
          OvertimeModel value, $Res Function(OvertimeModel) then) =
      _$OvertimeModelCopyWithImpl<$Res, OvertimeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ot_id') int otID,
      String title,
      String firstname,
      String lastname,
      String position,
      String department,
      @JsonKey(name: 'status_id') int statusID,
      String date,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      String detail,
      @JsonKey(name: 'approved_by') String approvedBY});
}

/// @nodoc
class _$OvertimeModelCopyWithImpl<$Res, $Val extends OvertimeModel>
    implements $OvertimeModelCopyWith<$Res> {
  _$OvertimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OvertimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otID = null,
    Object? title = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? position = null,
    Object? department = null,
    Object? statusID = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? detail = null,
    Object? approvedBY = null,
  }) {
    return _then(_value.copyWith(
      otID: null == otID
          ? _value.otID
          : otID // ignore: cast_nullable_to_non_nullable
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
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBY: null == approvedBY
          ? _value.approvedBY
          : approvedBY // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OvertimeModelImplCopyWith<$Res>
    implements $OvertimeModelCopyWith<$Res> {
  factory _$$OvertimeModelImplCopyWith(
          _$OvertimeModelImpl value, $Res Function(_$OvertimeModelImpl) then) =
      __$$OvertimeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ot_id') int otID,
      String title,
      String firstname,
      String lastname,
      String position,
      String department,
      @JsonKey(name: 'status_id') int statusID,
      String date,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      String detail,
      @JsonKey(name: 'approved_by') String approvedBY});
}

/// @nodoc
class __$$OvertimeModelImplCopyWithImpl<$Res>
    extends _$OvertimeModelCopyWithImpl<$Res, _$OvertimeModelImpl>
    implements _$$OvertimeModelImplCopyWith<$Res> {
  __$$OvertimeModelImplCopyWithImpl(
      _$OvertimeModelImpl _value, $Res Function(_$OvertimeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OvertimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otID = null,
    Object? title = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? position = null,
    Object? department = null,
    Object? statusID = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? detail = null,
    Object? approvedBY = null,
  }) {
    return _then(_$OvertimeModelImpl(
      otID: null == otID
          ? _value.otID
          : otID // ignore: cast_nullable_to_non_nullable
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
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
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
class _$OvertimeModelImpl implements _OvertimeModel {
  const _$OvertimeModelImpl(
      {@JsonKey(name: 'ot_id') required this.otID,
      required this.title,
      required this.firstname,
      required this.lastname,
      required this.position,
      required this.department,
      @JsonKey(name: 'status_id') required this.statusID,
      required this.date,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      this.detail = '-',
      @JsonKey(name: 'approved_by') this.approvedBY = '-'});

  factory _$OvertimeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeModelImplFromJson(json);

  @override
  @JsonKey(name: 'ot_id')
  final int otID;
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
  @JsonKey(name: 'status_id')
  final int statusID;
  @override
  final String date;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  @JsonKey()
  final String detail;
  @override
  @JsonKey(name: 'approved_by')
  final String approvedBY;

  @override
  String toString() {
    return 'OvertimeModel(otID: $otID, title: $title, firstname: $firstname, lastname: $lastname, position: $position, department: $department, statusID: $statusID, date: $date, startTime: $startTime, endTime: $endTime, detail: $detail, approvedBY: $approvedBY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeModelImpl &&
            (identical(other.otID, otID) || other.otID == otID) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.statusID, statusID) ||
                other.statusID == statusID) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.approvedBY, approvedBY) ||
                other.approvedBY == approvedBY));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      otID,
      title,
      firstname,
      lastname,
      position,
      department,
      statusID,
      date,
      startTime,
      endTime,
      detail,
      approvedBY);

  /// Create a copy of OvertimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeModelImplCopyWith<_$OvertimeModelImpl> get copyWith =>
      __$$OvertimeModelImplCopyWithImpl<_$OvertimeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeModelImplToJson(
      this,
    );
  }
}

abstract class _OvertimeModel implements OvertimeModel {
  const factory _OvertimeModel(
          {@JsonKey(name: 'ot_id') required final int otID,
          required final String title,
          required final String firstname,
          required final String lastname,
          required final String position,
          required final String department,
          @JsonKey(name: 'status_id') required final int statusID,
          required final String date,
          @JsonKey(name: 'start_time') required final String startTime,
          @JsonKey(name: 'end_time') required final String endTime,
          final String detail,
          @JsonKey(name: 'approved_by') final String approvedBY}) =
      _$OvertimeModelImpl;

  factory _OvertimeModel.fromJson(Map<String, dynamic> json) =
      _$OvertimeModelImpl.fromJson;

  @override
  @JsonKey(name: 'ot_id')
  int get otID;
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
  @JsonKey(name: 'status_id')
  int get statusID;
  @override
  String get date;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  String get detail;
  @override
  @JsonKey(name: 'approved_by')
  String get approvedBY;

  /// Create a copy of OvertimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OvertimeModelImplCopyWith<_$OvertimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
