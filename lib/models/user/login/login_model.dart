import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const LoginModel._();
  factory LoginModel({
    @JsonKey(name: 'api_token') required String accessToken,
    @JsonKey(name: 'expiry_time') required DateTime expiryTime,
    @JsonKey(name: 'permission') required String permission,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) => _$LoginModelFromJson(json);
}
