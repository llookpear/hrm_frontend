// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payslip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaySlipModel _$PaySlipModelFromJson(Map<String, dynamic> json) {
  return _PaySlipModell.fromJson(json);
}

/// @nodoc
mixin _$PaySlipModel {
  @JsonKey(name: 'payslip_id')
  int get payslipID => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this PaySlipModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaySlipModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaySlipModelCopyWith<PaySlipModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaySlipModelCopyWith<$Res> {
  factory $PaySlipModelCopyWith(
          PaySlipModel value, $Res Function(PaySlipModel) then) =
      _$PaySlipModelCopyWithImpl<$Res, PaySlipModel>;
  @useResult
  $Res call({@JsonKey(name: 'payslip_id') int payslipID, DateTime date});
}

/// @nodoc
class _$PaySlipModelCopyWithImpl<$Res, $Val extends PaySlipModel>
    implements $PaySlipModelCopyWith<$Res> {
  _$PaySlipModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaySlipModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payslipID = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      payslipID: null == payslipID
          ? _value.payslipID
          : payslipID // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaySlipModellImplCopyWith<$Res>
    implements $PaySlipModelCopyWith<$Res> {
  factory _$$PaySlipModellImplCopyWith(
          _$PaySlipModellImpl value, $Res Function(_$PaySlipModellImpl) then) =
      __$$PaySlipModellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'payslip_id') int payslipID, DateTime date});
}

/// @nodoc
class __$$PaySlipModellImplCopyWithImpl<$Res>
    extends _$PaySlipModelCopyWithImpl<$Res, _$PaySlipModellImpl>
    implements _$$PaySlipModellImplCopyWith<$Res> {
  __$$PaySlipModellImplCopyWithImpl(
      _$PaySlipModellImpl _value, $Res Function(_$PaySlipModellImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaySlipModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payslipID = null,
    Object? date = null,
  }) {
    return _then(_$PaySlipModellImpl(
      payslipID: null == payslipID
          ? _value.payslipID
          : payslipID // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaySlipModellImpl extends _PaySlipModell {
  _$PaySlipModellImpl(
      {@JsonKey(name: 'payslip_id') required this.payslipID,
      required this.date})
      : super._();

  factory _$PaySlipModellImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaySlipModellImplFromJson(json);

  @override
  @JsonKey(name: 'payslip_id')
  final int payslipID;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'PaySlipModel(payslipID: $payslipID, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaySlipModellImpl &&
            (identical(other.payslipID, payslipID) ||
                other.payslipID == payslipID) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, payslipID, date);

  /// Create a copy of PaySlipModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaySlipModellImplCopyWith<_$PaySlipModellImpl> get copyWith =>
      __$$PaySlipModellImplCopyWithImpl<_$PaySlipModellImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaySlipModellImplToJson(
      this,
    );
  }
}

abstract class _PaySlipModell extends PaySlipModel {
  factory _PaySlipModell(
      {@JsonKey(name: 'payslip_id') required final int payslipID,
      required final DateTime date}) = _$PaySlipModellImpl;
  _PaySlipModell._() : super._();

  factory _PaySlipModell.fromJson(Map<String, dynamic> json) =
      _$PaySlipModellImpl.fromJson;

  @override
  @JsonKey(name: 'payslip_id')
  int get payslipID;
  @override
  DateTime get date;

  /// Create a copy of PaySlipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaySlipModellImplCopyWith<_$PaySlipModellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
