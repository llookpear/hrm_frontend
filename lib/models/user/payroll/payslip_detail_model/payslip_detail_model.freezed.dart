// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payslip_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaySlipDetailModel _$PaySlipDetailModelFromJson(Map<String, dynamic> json) {
  return _PaySlipDetailModel.fromJson(json);
}

/// @nodoc
mixin _$PaySlipDetailModel {
  @JsonKey(name: 'payslip_id')
  int get payslipID => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'salary_detail')
  String get salaryDetail => throw _privateConstructorUsedError;
  @JsonKey(name: 'salary_type_id')
  int get salaryTypeID => throw _privateConstructorUsedError;

  /// Serializes this PaySlipDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaySlipDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaySlipDetailModelCopyWith<PaySlipDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaySlipDetailModelCopyWith<$Res> {
  factory $PaySlipDetailModelCopyWith(
          PaySlipDetailModel value, $Res Function(PaySlipDetailModel) then) =
      _$PaySlipDetailModelCopyWithImpl<$Res, PaySlipDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payslip_id') int payslipID,
      double amount,
      @JsonKey(name: 'salary_detail') String salaryDetail,
      @JsonKey(name: 'salary_type_id') int salaryTypeID});
}

/// @nodoc
class _$PaySlipDetailModelCopyWithImpl<$Res, $Val extends PaySlipDetailModel>
    implements $PaySlipDetailModelCopyWith<$Res> {
  _$PaySlipDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaySlipDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payslipID = null,
    Object? amount = null,
    Object? salaryDetail = null,
    Object? salaryTypeID = null,
  }) {
    return _then(_value.copyWith(
      payslipID: null == payslipID
          ? _value.payslipID
          : payslipID // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      salaryDetail: null == salaryDetail
          ? _value.salaryDetail
          : salaryDetail // ignore: cast_nullable_to_non_nullable
              as String,
      salaryTypeID: null == salaryTypeID
          ? _value.salaryTypeID
          : salaryTypeID // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaySlipDetailModelImplCopyWith<$Res>
    implements $PaySlipDetailModelCopyWith<$Res> {
  factory _$$PaySlipDetailModelImplCopyWith(_$PaySlipDetailModelImpl value,
          $Res Function(_$PaySlipDetailModelImpl) then) =
      __$$PaySlipDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payslip_id') int payslipID,
      double amount,
      @JsonKey(name: 'salary_detail') String salaryDetail,
      @JsonKey(name: 'salary_type_id') int salaryTypeID});
}

/// @nodoc
class __$$PaySlipDetailModelImplCopyWithImpl<$Res>
    extends _$PaySlipDetailModelCopyWithImpl<$Res, _$PaySlipDetailModelImpl>
    implements _$$PaySlipDetailModelImplCopyWith<$Res> {
  __$$PaySlipDetailModelImplCopyWithImpl(_$PaySlipDetailModelImpl _value,
      $Res Function(_$PaySlipDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaySlipDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payslipID = null,
    Object? amount = null,
    Object? salaryDetail = null,
    Object? salaryTypeID = null,
  }) {
    return _then(_$PaySlipDetailModelImpl(
      payslipID: null == payslipID
          ? _value.payslipID
          : payslipID // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      salaryDetail: null == salaryDetail
          ? _value.salaryDetail
          : salaryDetail // ignore: cast_nullable_to_non_nullable
              as String,
      salaryTypeID: null == salaryTypeID
          ? _value.salaryTypeID
          : salaryTypeID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaySlipDetailModelImpl extends _PaySlipDetailModel {
  _$PaySlipDetailModelImpl(
      {@JsonKey(name: 'payslip_id') required this.payslipID,
      required this.amount,
      @JsonKey(name: 'salary_detail') this.salaryDetail = '-',
      @JsonKey(name: 'salary_type_id') required this.salaryTypeID})
      : super._();

  factory _$PaySlipDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaySlipDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'payslip_id')
  final int payslipID;
  @override
  final double amount;
  @override
  @JsonKey(name: 'salary_detail')
  final String salaryDetail;
  @override
  @JsonKey(name: 'salary_type_id')
  final int salaryTypeID;

  @override
  String toString() {
    return 'PaySlipDetailModel(payslipID: $payslipID, amount: $amount, salaryDetail: $salaryDetail, salaryTypeID: $salaryTypeID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaySlipDetailModelImpl &&
            (identical(other.payslipID, payslipID) ||
                other.payslipID == payslipID) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.salaryDetail, salaryDetail) ||
                other.salaryDetail == salaryDetail) &&
            (identical(other.salaryTypeID, salaryTypeID) ||
                other.salaryTypeID == salaryTypeID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, payslipID, amount, salaryDetail, salaryTypeID);

  /// Create a copy of PaySlipDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaySlipDetailModelImplCopyWith<_$PaySlipDetailModelImpl> get copyWith =>
      __$$PaySlipDetailModelImplCopyWithImpl<_$PaySlipDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaySlipDetailModelImplToJson(
      this,
    );
  }
}

abstract class _PaySlipDetailModel extends PaySlipDetailModel {
  factory _PaySlipDetailModel(
          {@JsonKey(name: 'payslip_id') required final int payslipID,
          required final double amount,
          @JsonKey(name: 'salary_detail') final String salaryDetail,
          @JsonKey(name: 'salary_type_id') required final int salaryTypeID}) =
      _$PaySlipDetailModelImpl;
  _PaySlipDetailModel._() : super._();

  factory _PaySlipDetailModel.fromJson(Map<String, dynamic> json) =
      _$PaySlipDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'payslip_id')
  int get payslipID;
  @override
  double get amount;
  @override
  @JsonKey(name: 'salary_detail')
  String get salaryDetail;
  @override
  @JsonKey(name: 'salary_type_id')
  int get salaryTypeID;

  /// Create a copy of PaySlipDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaySlipDetailModelImplCopyWith<_$PaySlipDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
