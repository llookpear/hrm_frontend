class AppRouter {
  AppRouter({this.currentModule = ""});
  String currentModule;

  String get homeScreen => "/homeScreen";
  // String get calendarScreen => "/calendarScreen";
  // String get requestScreen => "/requestScreen";
  // String get profileScreen => "/profileScreen";
  // String get checkScreen => "/checkScreen";

  String get loginScreen => "/loginScreen";

  String get editProfileScreen => "/editProfileScreen";
  String get editPasswordScreen => "/editPasswordScreen";
  String get editAdminProfileScreen => "/editAdminProfileScreen";
  String get editAdminPasswordScreen => "/editAdminPasswordScreen";


  String get leaveScreen => "/leaveScreen";
  String get leaveRequestScreen => "/leaveRequestScreen";
  String get leaveRequestStatusScreen => "/leaveRequestStatusScreen";
  String get leaveHistoryScreen => "/leaveHistoryScreen";



  String get overtimeScreen => "/overtimeScreen";
  String get overtimeRequestScreen => "/overtimeRequestScreen";



  String get shiftworkScreen => "/shiftworkScreen";
  String get shiftworkRequestScreen => "/shiftworkRequestScreen";
  String get shiftWorkNotificationsScreen => "/ShiftWorkNotificationsScreen";


  String get payrollScreen => "/payrollScreen";
  String get payrollrequestScreen => "/payrollrequestScreen";
  String get statusPayrollScreenWidget => "/statusPayrollScreenWidget";


  //////////////////////////////// Addmin ////////////////////////////////
  String get addminHomeMenuScreenWidget => "/addminHomeMenuScreenWidget";
  // String get overtimeAddminScreenWidget => "/overtimeAddminScreenWidget";
  // String get addminProfileScreenWidget => "/addminProfileScreenWidget";
  // String get addminShiftworkScreenWidget => "/addminShiftworkScreenWidget";

}
