import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrm_project/data/base/base.repository.dart';
import '../../models/user/branch/branch_model.dart';
import '../../models/user/check_in_out/check_in_out_time_model/check_in_out_time_model.dart';
import '../../models/user/check_in_out/check_in_out_total_model/check_in_out_total_model.dart';
import '../../models/user/leave/leave_quota_model/leave_quota_model.dart';
import '../../models/user/overtime/overtime_model/overtime_model.dart';
import '../base/response.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

class HomeRepository extends BaseRepository {
  // Future<APIResponse<CheckInOutTotalModel>> checkinTotal({
  //   required String jwtToken,
  // }) async {
  //   try {
  //     final res = await dio.get(apiCheckinTotal, data: {"jwtToken": jwtToken});
  //     return APIResponse.completed(CheckInOutTotalModel.fromJson(res.data),
  //         res: res);
  //   } catch (e) {
  //     return APIResponse.error("$e");
  //   }
  // }
  //
  // Future<APIResponse<CheckInOutTotalModel>> checkoutTotal({
  //   required String jwtToken,
  // }) async {
  //   try {
  //     final res = await dio.get(apiCheckoutTotal, data: {"jwtToken": jwtToken});
  //     return APIResponse.completed(CheckInOutTotalModel.fromJson(res.data),
  //         res: res);
  //   } catch (e) {
  //     return APIResponse.error("$e");
  //   }
  // }
  //
  Future<APIResponse<CheckInOutTotalModel>> checkInOutWorkday({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get(apiCheckInOutWorkday, data: {"jwtToken": jwtToken});
      return APIResponse.completed(CheckInOutTotalModel.fromJson(res.data), res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<OvertimeModel>> overtimeTotal({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get(
        apiOvertime,
        data: {"jwtToken": jwtToken},
      );
      if (res.data != null) {
        final overtimeData = OvertimeModel.fromJson(res.data[0]);
        return APIResponse.completed(overtimeData, res: res);
      } else {
        return APIResponse.error("Invalid data format");
      }
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<LeaveQuotaModel>> leaveQuota({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get(
        apiLeaveQuota,
        data: {"jwtToken": jwtToken},
      );
      return APIResponse.completed(LeaveQuotaModel.fromJson(res.data), res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<List<BranchModel>>> branch() async {
    try {
      final res = await dio.get<List>(apiBranch);
      var data = res.data!.map<BranchModel>((e) => BranchModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }
  // Future<APIResponse<List<BranchModel>>> branch() async {
  //   try {
  //     final res = await dio.get<List>(apiBranch);
  //
  //     print("Raw API response: ${res.data}");
  //
  //     if (res.data == null || res.data!.isEmpty) {
  //       return APIResponse.error("No branches found");
  //     }
  //
  //     final data = res.data!
  //         .where((e) => e is Map<String, dynamic>)
  //         .map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
  //         .toList();
  //
  //     print("Mapped data: $data");
  //
  //     return APIResponse.completed(data, res: res);
  //   } catch (e, stackTrace) {
  //     print("Error: $e");
  //     print("StackTrace: $stackTrace");
  //     return APIResponse.error("An error occurred: $e");
  //   }
  // }

  Future<APIResponse<List<CheckInOutTimeModel>>> checkInOutTime({
    required String jwtToken,
    required String date,
  }) async {
    try {
      final res = await dio.get<List>(apiCheckInOutTime,
          data: {"jwtToken": jwtToken, "date": date});
      var data = res.data!.map<CheckInOutTimeModel>((e) => CheckInOutTimeModel.fromJson(e)).toList();

      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse> checkInOut({
    required String jwtToken,
    required String checkTypeID,
    required String date,
    required String time,
    String? uuid,
    String? latitude,
    String? longitude,
    required String createdAt,
  }) async {
    try {
      final response = await dio.post(
        apiCheckInOut,
        data: {
          "jwtToken": jwtToken,
          "check_type_id": checkTypeID,
          "date": date,
          "time": time,
          "uuid": uuid,
          "latitude": latitude,
          "longitude": longitude,
          "created_at": createdAt,
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

  // Future<APIResponse> getImage({
  //   required String jwtToken,
  //   required String filename,
  // }) async {
  //   try {
  //     final response = await dio.get(
  //       "$apiGetImage/$filename",
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $jwtToken',
  //         },
  //         responseType: ResponseType.bytes,
  //       ),
  //     );
  //     return APIResponse.completed(response.data, res: response);
  //   } catch (e) {
  //     return APIResponse.error("$e");
  //   }
  // }

  /// รับค่าเป็น  ResponseType.bytes --> ให้ provider เป็น Uint8List
  Future<APIResponse> getPDF({
    required String filename,
  }) async {
    try {
      final response = await dio.get(
        "$apiGetPDF/$filename",
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Accept': 'application/pdf',
          },
        ),
      );

      return APIResponse.completed(response.data, res: response);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }
}
