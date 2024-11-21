import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user/shift_work/shift_work_model.dart';
import '../base/base.repository.dart';
import '../base/response.dart';

final requestRepositoryProvider = Provider<RequestRepository>((ref) {
  return RequestRepository();
});

class RequestRepository extends BaseRepository {

  Future<APIResponse> leaveRequestFile({
    required String jwtToken,
    required String msleaveID,
    required int statusID,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
    required int total,
    required String detail,
    required String createdAt,
    PlatformFile? file,
  }) async {
    try {
      final formData = FormData.fromMap({
        "msleave_id": msleaveID,
        "status_id": statusID,
        "start_date": startDate,
        "end_date": endDate,
        "start_time": startTime,
        "end_time": endTime,
        "total": total,
        "detail": detail,
        "created_at": createdAt,
        "file": await MultipartFile.fromFile(file?.path ?? '', filename: file?.name),
      });
      final response = await dio.post(
        apiLeaveRequest,
        data: formData,
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

  Future<APIResponse> leaveRequestImage({
    required String jwtToken,
    required String msleaveID,
    required int statusID,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
    required int total,
    required String detail,
    required String createdAt,
    XFile? file,
  }) async {
    try {
      final formData = FormData.fromMap({
        "msleave_id": msleaveID,
        "status_id": statusID,
        "start_date": startDate,
        "end_date": endDate,
        "start_time": startTime,
        "end_time": endTime,
        "total": total,
        "detail": detail,
        "created_at": createdAt,
        "file": await MultipartFile.fromFile(file?.path ?? '' , filename: file?.name ?? ''),

      });
      final response = await dio.post(
        apiLeaveRequest,
        data: formData,
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


  Future<APIResponse> leaveRequest({
    required String jwtToken,
    required String msleaveID,
    required int statusID,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
    required int total,
    required String detail,
    required String createdAt,
  }) async {
    try {
      final formData = FormData.fromMap({
        "msleave_id": msleaveID,
        "status_id": statusID,
        "start_date": startDate,
        "end_date": endDate,
        "start_time": startTime,
        "end_time": endTime,
        "total": total,
        "detail": detail,
        "created_at": createdAt,
        "file": null,

      });
      final response = await dio.post(
        apiLeaveRequest,
        data: formData,
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


  Future<APIResponse> salaryCertificateRequest({
    required String jwtToken,
    required int statusID,
    required String dateStamp,
    required String createdAt,
  }) async {
    try {
      final response = await dio.post(
        apiSalaryCertificateRequest,
        data: {
          "status_id": statusID,
          "date_stamp": dateStamp,
          "created_at": createdAt
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

  Future<APIResponse<List<ShiftWorkModel>>> selectShiftWork({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiSelectRoster,
        data: {"jwtToken": jwtToken},
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwtToken',
          },
        ),
      );
      var data = res.data!.map((e) => ShiftWorkModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse> overtimeRequest({
    required String jwtToken,
    required int statusID,
    required String total,
    required String date,
    required String startTime,
    required String endTime,
    required String detail,
    required String createdAt,
  }) async {
    try {
      final response = await dio.post(
        apiOvertimeRequest,
        data: {
          "jwtToken": jwtToken,
          "status_id": statusID,
          "total": total,
          "date": date,
          "start_time": startTime,
          "end_time": endTime,
          "detail": detail,
          "created_at": createdAt
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

  Future<APIResponse> shiftRequest({
    required String jwtToken,
    required String currentRosterID,
    required String desiredRosterID,
    required String statusID,
    required String createdAt,
  }) async {
    try {
      final response = await dio.post(
        apiShiftRequest,
        data: {
          "current_roster_id": currentRosterID,
          "desired_roster_id": desiredRosterID,
          "status_id": statusID,
          "created_at": createdAt
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
