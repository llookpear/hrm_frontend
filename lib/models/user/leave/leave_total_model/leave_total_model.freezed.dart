// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_total_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveTotalModel _$LeaveTotalModelFromJson(Map<String, dynamic> json) {
  return _LeaveTotalModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveTotalModel {
  String get total => throw _privateConstructorUsedError;

  /// Serializes this LeaveTotalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveTotalModelCopyWith<LeaveTotalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveTotalModelCopyWith<$Res> {
  factory $LeaveTotalModelCopyWith(
          LeaveTotalModel value, $Res Function(LeaveTotalModel) then) =
      _$LeaveTotalModelCopyWithImpl<$Res, LeaveTotalModel>;
  @useResult
  $Res call({String total});
}

/// @nodoc
class _$LeaveTotalModelCopyWithImpl<$Res, $Val extends LeaveTotalModel>
    implements $LeaveTotalModelCopyWith<$Res> {
  _$LeaveTotalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveTotalModelImplCopyWith<$Res>
    implements $LeaveTotalModelCopyWith<$Res> {
  factory _$$LeaveTotalModelImplCopyWith(_$LeaveTotalModelImpl value,
          $Res Function(_$LeaveTotalModelImpl) then) =
      __$$LeaveTotalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String total});
}

/// @nodoc
class __$$LeaveTotalModelImplCopyWithImpl<$Res>
    extends _$LeaveTotalModelCopyWithImpl<$Res, _$LeaveTotalModelImpl>
    implements _$$LeaveTotalModelImplCopyWith<$Res> {
  __$$LeaveTotalModelImplCopyWithImpl(
      _$LeaveTotalModelImpl _value, $Res Function(_$LeaveTotalModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaveTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$LeaveTotalModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveTotalModelImpl extends _LeaveTotalModel {
  _$LeaveTotalModelImpl({this.total = "0"}) : super._();

  factory _$LeaveTotalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveTotalModelImplFromJson(json);

  @override
  @JsonKey()
  final String total;

  @override
  String toString() {
    return 'LeaveTotalModel(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveTotalModelImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total);

  /// Create a copy of LeaveTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveTotalModelImplCopyWith<_$LeaveTotalModelImpl> get copyWith =>
      __$$LeaveTotalModelImplCopyWithImpl<_$LeaveTotalModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveTotalModelImplToJson(
      this,
    );
  }
}

abstract class _LeaveTotalModel extends LeaveTotalModel {
  factory _LeaveTotalModel({final String total}) = _$LeaveTotalModelImpl;
  _LeaveTotalModel._() : super._();

  factory _LeaveTotalModel.fromJson(Map<String, dynamic> json) =
      _$LeaveTotalModelImpl.fromJson;

  @override
  String get total;

  /// Create a copy of LeaveTotalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveTotalModelImplCopyWith<_$LeaveTotalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
