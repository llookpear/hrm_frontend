// class UpdateUserModel {
//   int staff_id;
//   String firstname;
//   String lastname;
//   String phone;
//   String email;
//
//   UpdateUserModel(
//       {required this.staff_id,
//       required this.firstname,
//       required this.lastname,
//       required this.phone,
//       required this.email});
//
//   factory UpdateUserModel.fromJson(Map<String, Object> json) {
//     return switch (json) {
//       {
//         'staff_id': int staff_id,
//         'firstname': String firstname,
//         'lastname': String lastname,
//         'phone': String phone,
//         'email': String email,
//       } =>
//           UpdateUserModel(
//             staff_id: staff_id,
//             firstname: firstname,
//             lastname: lastname,
//             phone: phone,
//             email: email),
//       _ => throw const FormatException('Failed to load'),
//     };
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_model.freezed.dart';

part 'update_user_model.g.dart';

@freezed
class UpdateUserModel with _$UpdateUserModel {
  const factory UpdateUserModel({
    @JsonKey(name: 'staff_id') required int staffID,
    required String firstname,
    required String lastname,
    required String phone,
    required String email,
  }) = _UpdateUserModel;

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserModelFromJson(json);
}
