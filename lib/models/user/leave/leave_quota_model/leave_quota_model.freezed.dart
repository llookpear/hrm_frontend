// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_quota_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveQuotaModel _$LeaveQuotaModelFromJson(Map<String, dynamic> json) {
  return _LeaveQuotaModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveQuotaModel {
  String get quota => throw _privateConstructorUsedError;

  /// Serializes this LeaveQuotaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveQuotaModelCopyWith<LeaveQuotaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveQuotaModelCopyWith<$Res> {
  factory $LeaveQuotaModelCopyWith(
          LeaveQuotaModel value, $Res Function(LeaveQuotaModel) then) =
      _$LeaveQuotaModelCopyWithImpl<$Res, LeaveQuotaModel>;
  @useResult
  $Res call({String quota});
}

/// @nodoc
class _$LeaveQuotaModelCopyWithImpl<$Res, $Val extends LeaveQuotaModel>
    implements $LeaveQuotaModelCopyWith<$Res> {
  _$LeaveQuotaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quota = null,
  }) {
    return _then(_value.copyWith(
      quota: null == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveQuotaModelImplCopyWith<$Res>
    implements $LeaveQuotaModelCopyWith<$Res> {
  factory _$$LeaveQuotaModelImplCopyWith(_$LeaveQuotaModelImpl value,
          $Res Function(_$LeaveQuotaModelImpl) then) =
      __$$LeaveQuotaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String quota});
}

/// @nodoc
class __$$LeaveQuotaModelImplCopyWithImpl<$Res>
    extends _$LeaveQuotaModelCopyWithImpl<$Res, _$LeaveQuotaModelImpl>
    implements _$$LeaveQuotaModelImplCopyWith<$Res> {
  __$$LeaveQuotaModelImplCopyWithImpl(
      _$LeaveQuotaModelImpl _value, $Res Function(_$LeaveQuotaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaveQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quota = null,
  }) {
    return _then(_$LeaveQuotaModelImpl(
      quota: null == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveQuotaModelImpl implements _LeaveQuotaModel {
  const _$LeaveQuotaModelImpl({required this.quota});

  factory _$LeaveQuotaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveQuotaModelImplFromJson(json);

  @override
  final String quota;

  @override
  String toString() {
    return 'LeaveQuotaModel(quota: $quota)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveQuotaModelImpl &&
            (identical(other.quota, quota) || other.quota == quota));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quota);

  /// Create a copy of LeaveQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveQuotaModelImplCopyWith<_$LeaveQuotaModelImpl> get copyWith =>
      __$$LeaveQuotaModelImplCopyWithImpl<_$LeaveQuotaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveQuotaModelImplToJson(
      this,
    );
  }
}

abstract class _LeaveQuotaModel implements LeaveQuotaModel {
  const factory _LeaveQuotaModel({required final String quota}) =
      _$LeaveQuotaModelImpl;

  factory _LeaveQuotaModel.fromJson(Map<String, dynamic> json) =
      _$LeaveQuotaModelImpl.fromJson;

  @override
  String get quota;

  /// Create a copy of LeaveQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveQuotaModelImplCopyWith<_$LeaveQuotaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
