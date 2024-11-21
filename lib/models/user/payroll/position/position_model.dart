// class PositionModel {
//   int position_id;
//   int department_id;
//   String position;
//
//   PositionModel({required this.department_id, required this.position,required this.position_id});
//
//   factory PositionModel.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//         'position_id' : int position_id,
//         'department_id': int department_id,
//         'position': String position,
//       } =>
//           PositionModel(
//           position_id : position_id,
//           department_id: department_id,
//           position: position,
//         ),
//       _ => throw const FormatException('Failed to load'),
//     };
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part 'position_model.freezed.dart';
part 'position_model.g.dart';

@freezed
class PositionModel with _$PositionModel {
  PositionModel._();

  factory PositionModel({
    @JsonKey(name:'position_id') required int positionID,
    @JsonKey(name: 'department_id')required DateTime departmentID,
     required String position,
  }) = _PositionModel;

  factory PositionModel.fromJson(Map<String, Object?> json) =>
      _$PositionModelFromJson(json);
}
