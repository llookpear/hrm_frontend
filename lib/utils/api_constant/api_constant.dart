class APIConstance {
  String pathMapping(String api) {
    String? url;
    return url ?? _apiBaseUrlToken;
  }
  // static String baseURL = "http://172.10.1.180:8080";
  static String baseURL = "https://hrm.up.railway.app";
  final String _apiBaseUrlToken = "$baseURL/";
  final String apiLogin = "login";
  final String apiUserDetail = "user-detail";
  final String apiUpdateUserDetail = "update-user";
  final String apiUpdatePassword =   "update-password";
  final String apiLeaveTotal = "leave-total";
  final String apiLeaveQuota = "leave-quota";
  final String apiOvertime= "ot-total";
  final String apiOvertimeRequest= "add-overtime";
  final String apiCheckInOutWorkday= "check-in-out-workday";
  final String apiLeaveRequest = "add-leave-request";
  final String apiLeaveType = "leave-type";
  final String apiOTCalendar= "ot-calendar";
  final String apiLeaveCalendar= "leave-calendar";
  //----------------------------------------------------------------------------//
  final String apiSalaryCertificateRequest= "add-salary-certificate-request";
  final String apiPaySlip= "select-payslip";
  final String apiPayslipDetail= "payslip-detail";
  /// ResponseType.bytes รับด้วย Uint8List
  final String apiRequestPayslip= "requestPayslip";
  final String apiLeaveTakenAndQuota= "leaveTaken-quota";
  final String apiLeaveStatus= "leave-status";
  final String apiLeaveHistory= "leave-history";
  final String apiOvertimeHistory= "overtime-history";
  final String apiCertificateStatus= "salary-certificate-status";
  final String apiSelectRoster= "select-roster";
  final String apiShiftRequest= "post-shift-request";
  final String apiShiftStatus= "select-shift-status";
  final String apiDesiredShift= "select-desired-shift";
  final String apiBranch = "select-branch";
  final String apiCheckInOut = "add-check-in-out";
  final String apiCheckInOutTime = "check-in-out-time";
  final String apiGetPDF = "getPDF";
  static  String getImage(String userImage) {
      return "$baseURL/getImage/$userImage";
  }
  //-----------------------------------Addmin-----------------------------//
  final String apiAllLeave= "select-all-leave";
  final String apiAllOvertime= "select-all-overtime";
  final String apiApproveLeave= "update-leave-status";
  final String apiApproveOvertime= "update-overtime-status";
  final String apiAllShiftWork= "select-all-shift-work";
  final String apiApproveShiftWork= "update-shift-status";


  static bool ignoreRefreshToken(String url) {
    final List<String> list = [];
    return list.where((element) => element == url).isNotEmpty;
  }
}



