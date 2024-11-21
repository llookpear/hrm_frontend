// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overtime_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OvertimeHistoryModel _$OvertimeHistoryModelFromJson(Map<String, dynamic> json) {
  return _OvertimeHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$OvertimeHistoryModel {
  @JsonKey(name: 'ot_id')
  int get otID => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_id')
  int get statusID => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String get approvedBy => throw _privateConstructorUsedError;

  /// Serializes this OvertimeHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OvertimeHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OvertimeHistoryModelCopyWith<OvertimeHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OvertimeHistoryModelCopyWith<$Res> {
  factory $OvertimeHistoryModelCopyWith(OvertimeHistoryModel value,
          $Res Function(OvertimeHistoryModel) then) =
      _$OvertimeHistoryModelCopyWithImpl<$Res, OvertimeHistoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ot_id') int otID,
      @JsonKey(name: 'status_id') int statusID,
      int total,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      String detail,
      @JsonKey(name: 'approved_by') String approvedBy});
}

/// @nodoc
class _$OvertimeHistoryModelCopyWithImpl<$Res,
        $Val extends OvertimeHistoryModel>
    implements $OvertimeHistoryModelCopyWith<$Res> {
  _$OvertimeHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OvertimeHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otID = null,
    Object? statusID = null,
    Object? total = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? detail = null,
    Object? approvedBy = null,
  }) {
    return _then(_value.copyWith(
      otID: null == otID
          ? _value.otID
          : otID // ignore: cast_nullable_to_non_nullable
              as int,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
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
      approvedBy: null == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OvertimeHistoryModelImplCopyWith<$Res>
    implements $OvertimeHistoryModelCopyWith<$Res> {
  factory _$$OvertimeHistoryModelImplCopyWith(_$OvertimeHistoryModelImpl value,
          $Res Function(_$OvertimeHistoryModelImpl) then) =
      __$$OvertimeHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ot_id') int otID,
      @JsonKey(name: 'status_id') int statusID,
      int total,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      String detail,
      @JsonKey(name: 'approved_by') String approvedBy});
}

/// @nodoc
class __$$OvertimeHistoryModelImplCopyWithImpl<$Res>
    extends _$OvertimeHistoryModelCopyWithImpl<$Res, _$OvertimeHistoryModelImpl>
    implements _$$OvertimeHistoryModelImplCopyWith<$Res> {
  __$$OvertimeHistoryModelImplCopyWithImpl(_$OvertimeHistoryModelImpl _value,
      $Res Function(_$OvertimeHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OvertimeHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otID = null,
    Object? statusID = null,
    Object? total = null,
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? detail = null,
    Object? approvedBy = null,
  }) {
    return _then(_$OvertimeHistoryModelImpl(
      otID: null == otID
          ? _value.otID
          : otID // ignore: cast_nullable_to_non_nullable
              as int,
      statusID: null == statusID
          ? _value.statusID
          : statusID // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
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
      approvedBy: null == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OvertimeHistoryModelImpl implements _OvertimeHistoryModel {
  const _$OvertimeHistoryModelImpl(
      {@JsonKey(name: 'ot_id') required this.otID,
      @JsonKey(name: 'status_id') required this.statusID,
      required this.total,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      this.detail = '-',
      @JsonKey(name: 'approved_by') this.approvedBy = '-'});

  factory _$OvertimeHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OvertimeHistoryModelImplFromJson(json);

  @override
  @JsonKey(name: 'ot_id')
  final int otID;
  @override
  @JsonKey(name: 'status_id')
  final int statusID;
  @override
  final int total;
  @override
  @JsonKey(name: 'date')
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
  final String approvedBy;

  @override
  String toString() {
    return 'OvertimeHistoryModel(otID: $otID, statusID: $statusID, total: $total, date: $date, startTime: $startTime, endTime: $endTime, detail: $detail, approvedBy: $approvedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OvertimeHistoryModelImpl &&
            (identical(other.otID, otID) || other.otID == otID) &&
            (identical(other.statusID, statusID) ||
                other.statusID == statusID) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, otID, statusID, total, date,
      startTime, endTime, detail, approvedBy);

  /// Create a copy of OvertimeHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OvertimeHistoryModelImplCopyWith<_$OvertimeHistoryModelImpl>
      get copyWith =>
          __$$OvertimeHistoryModelImplCopyWithImpl<_$OvertimeHistoryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OvertimeHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _OvertimeHistoryModel implements OvertimeHistoryModel {
  const factory _OvertimeHistoryModel(
          {@JsonKey(name: 'ot_id') required final int otID,
          @JsonKey(name: 'status_id') required final int statusID,
          required final int total,
          @JsonKey(name: 'date') required final String date,
          @JsonKey(name: 'start_time') required final String startTime,
          @JsonKey(name: 'end_time') required final String endTime,
          final String detail,
          @JsonKey(name: 'approved_by') final String approvedBy}) =
      _$OvertimeHistoryModelImpl;

  factory _OvertimeHistoryModel.fromJson(Map<String, dynamic> json) =
      _$OvertimeHistoryModelImpl.fromJson;

  @override
  @JsonKey(name: 'ot_id')
  int get otID;
  @override
  @JsonKey(name: 'status_id')
  int get statusID;
  @override
  int get total;
  @override
  @JsonKey(name: 'date')
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
  String get approvedBy;

  /// Create a copy of OvertimeHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OvertimeHistoryModelImplCopyWith<_$OvertimeHistoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
