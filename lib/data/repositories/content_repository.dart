import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/admin/shift_work_model/shift_work_model.dart';
import '../../models/user/leave/leaveTaken_and_quota_model/leaveTaken_and_quota_model.dart';
import '../../models/user/leave/leave_status_model/leave_status_model.dart';
import '../../models/user/leave/leave_total_model/leave_total_model.dart';
import '../../models/user/leave/leave_type_model.dart';
import '../../models/user/overtime/overtime_history_model/overtime_history_model.dart';
import '../../models/user/payroll/payslip_detail_model/payslip_detail_model.dart';
import '../../models/user/payroll/payslip_model/payslip_model.dart';
import '../../models/user/payroll/salary_certificate_model/salary_certificate_model.dart';
import '../../models/user/shift_work/shitf_work_status/shift_work_status_model.dart';
import '../base/base.repository.dart';
import '../base/response.dart';

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository();
});

class ContentRepository extends BaseRepository {
  Future<APIResponse<List<LeaveTypeModel>>> msLeave() async {
    try {
      final res = await dio.get<List>(apiLeaveType);
      var data = res.data!.map((e) => LeaveTypeModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  //
  // Future<APIResponse> department() async {
  //   try {
  //     final res = await dio.get(apiDepartment);
  //     return APIResponse.completed(res.data, res: res);
  //   } catch (e) {
  //     return APIResponse.error("$e");
  //   }
  // }

  Future<APIResponse> otCalendar({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get(apiOTCalendar, data: {"jwtToken": jwtToken});
      return APIResponse.completed(res.data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse> leaveCalendar({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get(apiLeaveCalendar, data: {"jwtToken": jwtToken});
      return APIResponse.completed(res.data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<LeaveTotalModel>> leaveTotal({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get(
        apiLeaveTotal,
        data: {"jwtToken": jwtToken},
      );
      return APIResponse.completed(LeaveTotalModel.fromJson(res.data),
          res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<List<PaySlipModel>>> payroll({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiPaySlip,
        data: {
          "jwtToken": jwtToken,
        },
      );
      var data = res.data!.map((e) => PaySlipModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse<List<PaySlipDetailModel>>> payslipDetail({
    required String jwtToken,
    required String payslipID,
  }) async {
    try {
      final res = await dio.get<List>(
        apiPayslipDetail,
        data: {
          "payslip_id": payslipID,
        },
      );
      var data = res.data!.map((e) => PaySlipDetailModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse> requestPayslip({
    required String jwtToken,
    required String payslipID,
  }) async {
    try {
      final res = await dio.get(
        apiRequestPayslip,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': 'Bearer $jwtToken',
            'Accept': 'application/pdf',
          },
        ),
        data: {
          "payslip_id": payslipID,
        },
      );
      return APIResponse.completed(res.data, res: res);
    } catch (e) {
      return APIResponse.error("$e");
    }
  }

  Future<APIResponse<List<LeaveTakenAndQuotaModel>>> leaveTakenAndQuota({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiLeaveTakenAndQuota,
        data: {
          "jwtToken": jwtToken,
        },
      );
      var data =
          res.data!.map((e) => LeaveTakenAndQuotaModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse<List<LeaveStatusModel>>> leaveStatus({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiLeaveStatus,
        data: {
          "jwtToken": jwtToken,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwtToken',
          },
        ),
      );
      var data = res.data!.map((e) => LeaveStatusModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse<List<LeaveStatusModel>>> leaveHistory({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiLeaveHistory,
        data: {
          "jwtToken": jwtToken,
        },
      );
      var data = res.data!.map((e) => LeaveStatusModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse<List<OvertimeHistoryModel>>> overtimeHistory({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiOvertimeHistory,
        data: {
          "jwtToken": jwtToken,
        },
      );
      var data =
          res.data!.map((e) => OvertimeHistoryModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse<List<CertificateModel>>> certificateStatus({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiCertificateStatus,
        data: {
          "jwtToken": jwtToken,
        },
      );
      var data = res.data!.map((e) => CertificateModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse<List<ShiftWorkStatusModel>>> shiftStatus({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiShiftStatus,
        data: {
          "jwtToken": jwtToken,
        },
      );
      var data = res.data!.map((e) => ShiftWorkStatusModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }

  Future<APIResponse<List<AdminShiftWorkModel>>> desiredShift({
    required String jwtToken,
  }) async {
    try {
      final res = await dio.get<List>(
        apiDesiredShift,
        data: {
          "jwtToken": jwtToken,
        },
      );
      var data = res.data!.map((e) => AdminShiftWorkModel.fromJson(e)).toList();
      return APIResponse.completed(data, res: res);
    } catch (e) {
      return APIResponse.error("Error : $e");
    }
  }
}
