// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionModel _$PositionModelFromJson(Map<String, dynamic> json) {
  return _PositionModel.fromJson(json);
}

/// @nodoc
mixin _$PositionModel {
  @JsonKey(name: 'position_id')
  int get positionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  DateTime get departmentID => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;

  /// Serializes this PositionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PositionModelCopyWith<PositionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionModelCopyWith<$Res> {
  factory $PositionModelCopyWith(
          PositionModel value, $Res Function(PositionModel) then) =
      _$PositionModelCopyWithImpl<$Res, PositionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'position_id') int positionID,
      @JsonKey(name: 'department_id') DateTime departmentID,
      String position});
}

/// @nodoc
class _$PositionModelCopyWithImpl<$Res, $Val extends PositionModel>
    implements $PositionModelCopyWith<$Res> {
  _$PositionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionID = null,
    Object? departmentID = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      positionID: null == positionID
          ? _value.positionID
          : positionID // ignore: cast_nullable_to_non_nullable
              as int,
      departmentID: null == departmentID
          ? _value.departmentID
          : departmentID // ignore: cast_nullable_to_non_nullable
              as DateTime,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionModelImplCopyWith<$Res>
    implements $PositionModelCopyWith<$Res> {
  factory _$$PositionModelImplCopyWith(
          _$PositionModelImpl value, $Res Function(_$PositionModelImpl) then) =
      __$$PositionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'position_id') int positionID,
      @JsonKey(name: 'department_id') DateTime departmentID,
      String position});
}

/// @nodoc
class __$$PositionModelImplCopyWithImpl<$Res>
    extends _$PositionModelCopyWithImpl<$Res, _$PositionModelImpl>
    implements _$$PositionModelImplCopyWith<$Res> {
  __$$PositionModelImplCopyWithImpl(
      _$PositionModelImpl _value, $Res Function(_$PositionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionID = null,
    Object? departmentID = null,
    Object? position = null,
  }) {
    return _then(_$PositionModelImpl(
      positionID: null == positionID
          ? _value.positionID
          : positionID // ignore: cast_nullable_to_non_nullable
              as int,
      departmentID: null == departmentID
          ? _value.departmentID
          : departmentID // ignore: cast_nullable_to_non_nullable
              as DateTime,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionModelImpl extends _PositionModel {
  _$PositionModelImpl(
      {@JsonKey(name: 'position_id') required this.positionID,
      @JsonKey(name: 'department_id') required this.departmentID,
      required this.position})
      : super._();

  factory _$PositionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionModelImplFromJson(json);

  @override
  @JsonKey(name: 'position_id')
  final int positionID;
  @override
  @JsonKey(name: 'department_id')
  final DateTime departmentID;
  @override
  final String position;

  @override
  String toString() {
    return 'PositionModel(positionID: $positionID, departmentID: $departmentID, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionModelImpl &&
            (identical(other.positionID, positionID) ||
                other.positionID == positionID) &&
            (identical(other.departmentID, departmentID) ||
                other.departmentID == departmentID) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, positionID, departmentID, position);

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionModelImplCopyWith<_$PositionModelImpl> get copyWith =>
      __$$PositionModelImplCopyWithImpl<_$PositionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionModelImplToJson(
      this,
    );
  }
}

abstract class _PositionModel extends PositionModel {
  factory _PositionModel(
      {@JsonKey(name: 'position_id') required final int positionID,
      @JsonKey(name: 'department_id') required final DateTime departmentID,
      required final String position}) = _$PositionModelImpl;
  _PositionModel._() : super._();

  factory _PositionModel.fromJson(Map<String, dynamic> json) =
      _$PositionModelImpl.fromJson;

  @override
  @JsonKey(name: 'position_id')
  int get positionID;
  @override
  @JsonKey(name: 'department_id')
  DateTime get departmentID;
  @override
  String get position;

  /// Create a copy of PositionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PositionModelImplCopyWith<_$PositionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
