import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/admin/leave_model/leave_model.dart';
import '../../models/admin/overtime_model/overtime_model.dart';
import '../../models/admin/shift_work_model/shift_work_model.dart';
import '../base/base.repository.dart';
import '../base/response.dart';

final addminRepositoryProvider = Provider<AddminRepository>((ref) {
  return AddminRepository();
});

class AddminRepository extends BaseRepository {

  Future<APIResponse<List<LeaveModel>>> allLeave() async {
    try {
      final res = await dio.get<List>(apiAllLeave);
      var data = res.data!.map((e) => LeaveModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<List<OvertimeModel>>> allOvertime() async {
    try {
      final res = await dio.get<List>(apiAllOvertime);
      var data = res.data!.map((e) => OvertimeModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<List<AdminShiftWorkModel>>> allShiftWork() async {
    try {
      final res = await dio.get<List>(apiAllShiftWork);
      var data = res.data!.map((e) => AdminShiftWorkModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse> approveLeave({
    required String jwtToken,
    required String leaveID,
    required String statusID,
  }) async {
    try {
      ///put
      final res = await dio.post(
        apiApproveLeave,
        data: {
          "jwtToken": jwtToken,
          "leave_id": leaveID,
          "status_id": statusID,
        },
      );
      return APIResponse.completed(res.data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse> approveOvertime({
    required String jwtToken,
    required String otID,
    required String statusID,
  }) async {
    try {
      ///put
      final res = await dio.post(
        apiApproveOvertime,
        data: {
          "jwtToken": jwtToken,
          "ot_id": otID,
          "status_id": statusID,
        },
      );
      return APIResponse.completed(res.data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse> approveShiftWork({
    required String jwtToken,
    required String shiftChangeID,
    required String statusID,
    required String currentRosterID,
    required String desiredRosterID,
  }) async {
    try {
      ///put
      final res = await dio.post(
        apiApproveShiftWork,
        data: {
          "jwtToken": jwtToken,
          "shiftChangeID": shiftChangeID,
          "status_id": statusID,
          "current_roster_id": currentRosterID,
          "desired_roster_id": desiredRosterID,
        },
      );
      return APIResponse.completed(res.data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }
}
