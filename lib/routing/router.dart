import 'dart:typed_data';
import 'package:animations/animations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/models/user/user_detail/user_detail_model.dart';
import '../app/screens/admin_screen/menu_bar/menu_bar_admin.dart';
import '../app/screens/admin_screen/profile_screen/edit_password/admin_edit_password_screen.dart';
import '../app/screens/admin_screen/profile_screen/edit_profile/admin_edit_profile_screen.dart';
import '../app/screens/user_screen/home_screen/menu_bar.dart';
import '../app/screens/user_screen/home_screen/profile_menu_screen/edit_password/edit_password_screen.dart';
import '../app/screens/user_screen/home_screen/profile_menu_screen/edit_profile/edit_profile_screen.dart';
import '../app/screens/user_screen/leave_screen/history_screen/history_screen.dart';
import '../app/screens/user_screen/leave_screen/leave_request_screen/leave_request_screen.dart';
import '../app/screens/user_screen/leave_screen/leave_request_status_screen/leave_request_status_screen.dart';
import '../app/screens/user_screen/leave_screen/leave_screen.dart';
import '../app/screens/user_screen/login_screen/login_screen.dart';
import '../app/screens/user_screen/overtime_screen/overtime_request_screen/overtime_request_screen.dart';
import '../app/screens/user_screen/overtime_screen/overtime_screen.dart';
import '../app/screens/user_screen/payroll_screen/payroll_screen.dart';
import '../app/screens/user_screen/payroll_screen/salary_certificate_screen/salary_certificate_request_screen.dart';
import '../app/screens/user_screen/payroll_screen/salary_certificate_status_screen/salary_certificate_status_screen.dart';
import '../app/screens/user_screen/shift_work/shift_work_request_screen/shift_work_request_screen.dart';
import '../app/screens/user_screen/shift_work/shift_work_screen.dart';
import '../app/screens/user_screen/shift_work/shift_work_user_approve/shift_work_notifications.dart';
import 'app_router.dart';

Widget _customTransition(context, animation, secondaryAnimation, child) {
  return SharedAxisTransition(
    transitionType: SharedAxisTransitionType.horizontal,
    animation: animation,
    secondaryAnimation: secondaryAnimation,
    child: child,
  );
}

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    observers: [BotToastNavigatorObserver()],
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: LoginScreen(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().loginScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: LoginScreen(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().homeScreen,
        pageBuilder: (context, state) {
          return  const CustomTransitionPage(
            child: AnimatedBottomBar(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().editProfileScreen,
        pageBuilder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final userDetail = extras['userDetail'] as UserDetailModel;
          final image = extras['image'] as String;
          return CustomTransitionPage(
            child: EditProfileScreenWidget(userDetail: userDetail, image: image),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().editPasswordScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: EditPasswordScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().editAdminProfileScreen,
        pageBuilder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final userDetail = extras['userDetail'] as UserDetailModel;
          final image = extras['image'] as String;
          return CustomTransitionPage(
            child: EditAdminProfileScreenWidget(userDetail: userDetail, image: image),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().editAdminPasswordScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: EditAdminPasswordScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      // GoRoute(
      //   path: AppRouter().calendarScreen,
      //   pageBuilder: (context, state) {
      //     return  const CustomTransitionPage(
      //       child: CalendarScreenWidget(),
      //       transitionsBuilder: _customTransition,
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRouter().requestScreen,
      //   pageBuilder: (context, state) {
      //     return const CustomTransitionPage(
      //       child: RequestScreenWidget(),
      //       transitionsBuilder: _customTransition,
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: AppRouter().profileScreen,
      //   pageBuilder: (context, state) {
      //     return const CustomTransitionPage(
      //       child: ProfileScreenWidget(),
      //       transitionsBuilder: _customTransition,
      //     );
      //   },
      // ),GoRoute(
      //   path: AppRouter().checkScreen,
      //   pageBuilder: (context, state) {
      //     return const CustomTransitionPage(
      //       child: CheckInOutScreenWidget(),
      //       transitionsBuilder: _customTransition,
      //     );
      //   },
      // ),
       GoRoute(
        path: AppRouter().leaveScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: LeaveScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().leaveRequestScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: LeaveRequestScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().leaveRequestStatusScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: LeaveRequestStatusScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().leaveHistoryScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: HistoryScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().overtimeScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: OvertimeScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().shiftworkScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: ShiftWorkScreenWidget(
              staffID: state.extra as String,
            ),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().shiftworkRequestScreen,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: ShiftWorkRequestScreenWidget(
              staffID: state.extra as String,
            ),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().shiftWorkNotificationsScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: ShiftWorkNotificationsScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().payrollScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: PayrollScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().payrollrequestScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: SalaryCertificateRequestScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().overtimeRequestScreen,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: OvertimeRequestScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      GoRoute(
        path: AppRouter().statusPayrollScreenWidget,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: SalaryCertificateStatusScreenWidget(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
///////////////////////////////////////////////////////////////////////////////
      GoRoute(
        path: AppRouter().addminHomeMenuScreenWidget,
        pageBuilder: (context, state) {
          return const CustomTransitionPage(
            child: AnimatedBottomBarAddmin(),
            transitionsBuilder: _customTransition,
          );
        },
      ),
      // GoRoute(
      //   path: AppRouter().overtimeAddminScreenWidget,
      //   pageBuilder: (context, state) {
      //     return const CustomTransitionPage(
      //       child: OvertimeAddminScreenWidget(),
      //       transitionsBuilder: _customTransition,
      //     );
      //   },
      // ),GoRoute(
      //   path: AppRouter().addminProfileScreenWidget,
      //   pageBuilder: (context, state) {
      //     return const CustomTransitionPage(
      //       child: AddminProfileScreenWidget(),
      //       transitionsBuilder: _customTransition,
      //     );
      //   },
      // ),GoRoute(
      //   path: AppRouter().addminShiftworkScreenWidget,
      //   pageBuilder: (context, state) {
      //     return const CustomTransitionPage(
      //       child: AddminShiftworkScreenWidget(),
      //       transitionsBuilder: _customTransition,
      //     );
      //   },
      // ),
    ],
  ),
);
