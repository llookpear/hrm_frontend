import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_detail_model.freezed.dart';
part 'user_detail_model.g.dart';

@freezed
class UserDetailModel with _$UserDetailModel {
  UserDetailModel._();

  factory UserDetailModel({
    @JsonKey(name:'staff_id') required int staffID,
    required String firstname,
    required String lastname,
    required String email,
    @JsonKey(name: 'date_of_birth')required DateTime dateOfBirth,
    required String phone,
    required String gender,
    @Default("-")   @JsonKey(name: 'user_image')
    String userImage,
  }) = _UserDetailModel;

  factory UserDetailModel.fromJson(Map<String, Object?> json) =>
      _$UserDetailModelFromJson(json);


}
