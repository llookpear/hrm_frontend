import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/home_repository.dart';
import '../../../../../data/repositories/request_repository.dart';
import '../../../../../data/repositories/user_repository.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/snackbar_widget.dart';
import '../leave_request_status_screen/leave_request_status_provider.dart';

final leaveRequestProvider = Provider<LeaveRequestProvider>((ref) {
  final leaveRequestProvider = ref.watch(userRepositoryProvider);
  final requestProvider = ref.watch(requestRepositoryProvider);
  final homeProvider = ref.read(homeRepositoryProvider);
  return LeaveRequestProvider(
      userRepository: leaveRequestProvider,
      requestRepository: requestProvider,
      homeRepository: homeProvider,
      ref: ref);
});

class LeaveRequestProvider {
  final RequestRepository _requestRepository;
  final Ref _ref;

  LeaveRequestProvider({
    required UserRepository userRepository,
    required HomeRepository homeRepository,
    required RequestRepository requestRepository,
    required Ref ref,
  })  : _requestRepository = requestRepository,
        _ref = ref;

  Future<void> leaveRequestFile(
      String msleaveId,
      int statusID,
      String startDate,
      String endDate,
      String startTime,
      String endTime,
      int total,
      String detail,
      PlatformFile? file,
      BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _requestRepository.leaveRequestFile(
      jwtToken: jwtToken.toString(),
      msleaveID: msleaveId,
      statusID: statusID,
      startDate: startDate,
      endDate: endDate,
      startTime: startTime,
      endTime: endTime,
      total: total,
      detail: detail,
      createdAt: ConvertDateTime.createdAt,
      file: file,
    );
    if (res.isComplete) {
      var refresh = _ref.refresh(leaveRequestStatusProvider);
      refresh;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarSuccessWidget(
            message: 'Your leave request has been submitted',
          ),
        );
      }
    }
    else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarFailedWidget(
            message: 'Failed to submit your leave request',
          ),
        );
      }
    }
  }


  Future<void> leaveRequestImage(
      String msleaveId,
      int statusID,
      String startDate,
      String endDate,
      String startTime,
      String endTime,
      int total,
      String detail,
      XFile? file,
      BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _requestRepository.leaveRequestImage(
      jwtToken: jwtToken.toString(),
      msleaveID: msleaveId,
      statusID: statusID,
      startDate: startDate,
      endDate: endDate,
      startTime: startTime,
      endTime: endTime,
      total: total,
      detail: detail,
      createdAt: ConvertDateTime.createdAt,
      file: file ,
    );

    if (res.isComplete) {
      var refresh = _ref.refresh(leaveRequestStatusProvider);
      refresh;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarSuccessWidget(
            message: 'Your leave request has been submitted',
          ),
        );
      }
    }
    else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarFailedWidget(
            message: 'Failed to submit your leave request',
          ),
        );
      }
    }
  }

Future<void> leaveRequest(
      String msleaveId,
      int statusID,
      String startDate,
      String endDate,
      String startTime,
      String endTime,
      int total,
      String detail,
      BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _requestRepository.leaveRequest(
      jwtToken: jwtToken.toString(),
      msleaveID: msleaveId,
      statusID: statusID,
      startDate: startDate,
      endDate: endDate,
      startTime: startTime,
      endTime: endTime,
      total: total,
      detail: detail,
      createdAt: ConvertDateTime.createdAt,
    );

    if (res.isComplete) {
      var refresh = _ref.refresh(leaveRequestStatusProvider);
      refresh;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarSuccessWidget(
            message: 'Your leave request has been submitted',
          ),
        );
      }
    }
    else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarFailedWidget(
            message: 'Failed to submit your leave request',
          ),
        );
      }
    }
  }
}
