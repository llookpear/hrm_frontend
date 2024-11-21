// class department_model {
//   int department_id;
//   String department;
//
//   department_model({required this.department_id, required this.department});
//
//   factory department_model.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//         'department_id': int department_id,
//         'department': String department,
//       } =>
//         department_model(
//           department_id: department_id,
//           department: department,
//         ),
//       _ => throw const FormatException('Failed to load'),
//     };
//   }
// }


import 'package:freezed_annotation/freezed_annotation.dart';
part 'department_model.freezed.dart';
part 'department_model.g.dart';

@freezed
class DepartmentModel with _$DepartmentModel {
  DepartmentModel._();

  factory DepartmentModel({
    @JsonKey(name:'department_id') required int departmentID,
    required double department,

  }) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, Object?> json) =>
      _$DepartmentModelFromJson(json);
}
