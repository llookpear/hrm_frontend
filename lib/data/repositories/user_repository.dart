import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user/login/login_model.dart';
import '../../models/user/update_user/update_user_model.dart';
import '../../models/user/user_detail/user_detail_model.dart';
import '../base/base.repository.dart';
import '../base/response.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

class UserRepository extends BaseRepository {


  Future<APIResponse<LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await dio.post(
          apiLogin, data: {
        "email": email,
        "password": password,
      });
      return APIResponse.completed(LoginModel.fromJson(res.data), res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<UserDetailModel>> userDetail({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get(
        apiUserDetail,
        data: {"jwtToken": jwtToken},
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwtToken',
          },
        ),
      );
      final userDetail = UserDetailModel.fromJson(res.data);
      return APIResponse.completed(userDetail, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<UpdateUserModel>> updateUserDetail({
     String? jwtToken,
     String? firstname,
     String? lastname,
     String? phone,
     String? email,
     String? oldImg,
     XFile? file,
  }) async {
    try {
      final FormData formData = FormData.fromMap({
        "jwtToken": jwtToken,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "oldImg" : oldImg,
        if (file != null)
          "file": await MultipartFile.fromFile(file.path, filename: file.name),
      });
      ///put
      final response = await dio.post(
        apiUpdateUserDetail,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwtToken',
          },
        ),
      );
      return APIResponse.completed(UpdateUserModel.fromJson(response.data),
          res: response);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse> updatePassword({
    required String jwtToken,
    required String newPassword,
  }) async {
    try {
      ///put
      final response = await dio.post(
        apiUpdatePassword,
        data: {
          "jwtToken": jwtToken,
          "new_password": newPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwtToken',
          },
        ),
      );

      return APIResponse.completed(response.data, res: response);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }





}
