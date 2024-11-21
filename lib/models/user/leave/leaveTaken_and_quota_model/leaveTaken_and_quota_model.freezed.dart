// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaveTaken_and_quota_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveTakenAndQuotaModel _$LeaveTakenAndQuotaModelFromJson(
    Map<String, dynamic> json) {
  return _LeaveTakenAndQuotaModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveTakenAndQuotaModel {
  int get quota => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'leave_taken')
  int get leaveTaken => throw _privateConstructorUsedError;

  /// Serializes this LeaveTakenAndQuotaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveTakenAndQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveTakenAndQuotaModelCopyWith<LeaveTakenAndQuotaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveTakenAndQuotaModelCopyWith<$Res> {
  factory $LeaveTakenAndQuotaModelCopyWith(LeaveTakenAndQuotaModel value,
          $Res Function(LeaveTakenAndQuotaModel) then) =
      _$LeaveTakenAndQuotaModelCopyWithImpl<$Res, LeaveTakenAndQuotaModel>;
  @useResult
  $Res call(
      {int quota, int type, @JsonKey(name: 'leave_taken') int leaveTaken});
}

/// @nodoc
class _$LeaveTakenAndQuotaModelCopyWithImpl<$Res,
        $Val extends LeaveTakenAndQuotaModel>
    implements $LeaveTakenAndQuotaModelCopyWith<$Res> {
  _$LeaveTakenAndQuotaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveTakenAndQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quota = null,
    Object? type = null,
    Object? leaveTaken = null,
  }) {
    return _then(_value.copyWith(
      quota: null == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      leaveTaken: null == leaveTaken
          ? _value.leaveTaken
          : leaveTaken // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveTakenAndQuotaModelImplCopyWith<$Res>
    implements $LeaveTakenAndQuotaModelCopyWith<$Res> {
  factory _$$LeaveTakenAndQuotaModelImplCopyWith(
          _$LeaveTakenAndQuotaModelImpl value,
          $Res Function(_$LeaveTakenAndQuotaModelImpl) then) =
      __$$LeaveTakenAndQuotaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quota, int type, @JsonKey(name: 'leave_taken') int leaveTaken});
}

/// @nodoc
class __$$LeaveTakenAndQuotaModelImplCopyWithImpl<$Res>
    extends _$LeaveTakenAndQuotaModelCopyWithImpl<$Res,
        _$LeaveTakenAndQuotaModelImpl>
    implements _$$LeaveTakenAndQuotaModelImplCopyWith<$Res> {
  __$$LeaveTakenAndQuotaModelImplCopyWithImpl(
      _$LeaveTakenAndQuotaModelImpl _value,
      $Res Function(_$LeaveTakenAndQuotaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaveTakenAndQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quota = null,
    Object? type = null,
    Object? leaveTaken = null,
  }) {
    return _then(_$LeaveTakenAndQuotaModelImpl(
      quota: null == quota
          ? _value.quota
          : quota // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      leaveTaken: null == leaveTaken
          ? _value.leaveTaken
          : leaveTaken // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveTakenAndQuotaModelImpl implements _LeaveTakenAndQuotaModel {
  const _$LeaveTakenAndQuotaModelImpl(
      {required this.quota,
      required this.type,
      @JsonKey(name: 'leave_taken') this.leaveTaken = 0});

  factory _$LeaveTakenAndQuotaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveTakenAndQuotaModelImplFromJson(json);

  @override
  final int quota;
  @override
  final int type;
  @override
  @JsonKey(name: 'leave_taken')
  final int leaveTaken;

  @override
  String toString() {
    return 'LeaveTakenAndQuotaModel(quota: $quota, type: $type, leaveTaken: $leaveTaken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveTakenAndQuotaModelImpl &&
            (identical(other.quota, quota) || other.quota == quota) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.leaveTaken, leaveTaken) ||
                other.leaveTaken == leaveTaken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quota, type, leaveTaken);

  /// Create a copy of LeaveTakenAndQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveTakenAndQuotaModelImplCopyWith<_$LeaveTakenAndQuotaModelImpl>
      get copyWith => __$$LeaveTakenAndQuotaModelImplCopyWithImpl<
          _$LeaveTakenAndQuotaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveTakenAndQuotaModelImplToJson(
      this,
    );
  }
}

abstract class _LeaveTakenAndQuotaModel implements LeaveTakenAndQuotaModel {
  const factory _LeaveTakenAndQuotaModel(
          {required final int quota,
          required final int type,
          @JsonKey(name: 'leave_taken') final int leaveTaken}) =
      _$LeaveTakenAndQuotaModelImpl;

  factory _LeaveTakenAndQuotaModel.fromJson(Map<String, dynamic> json) =
      _$LeaveTakenAndQuotaModelImpl.fromJson;

  @override
  int get quota;
  @override
  int get type;
  @override
  @JsonKey(name: 'leave_taken')
  int get leaveTaken;

  /// Create a copy of LeaveTakenAndQuotaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveTakenAndQuotaModelImplCopyWith<_$LeaveTakenAndQuotaModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
