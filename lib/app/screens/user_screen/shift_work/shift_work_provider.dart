import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../data/local/store_data/store.box.dart';
import '../../../../data/local/store_data/system.dart';
import '../../../../data/repositories/content_repository.dart';
import '../../../../data/repositories/request_repository.dart';
import '../../../../models/admin/shift_work_model/shift_work_model.dart';
import '../../../../models/enum.dart';
import '../../../../models/user/shift_work/shift_work_model.dart';
import '../../../../models/user/shift_work/shitf_work_status/shift_work_status_model.dart';
import '../../../../utils/format.dart';
import '../../../widgets/class/convert_datetime_number.dart';
import '../../../widgets/snackbar_widget.dart';

final shiftProvider = Provider<ShiftProvider>((ref) {
  final requestProvider = ref.watch(requestRepositoryProvider);
  final contentProvider = ref.watch(contentRepositoryProvider);
  return ShiftProvider(
      requestRepository: requestProvider,
      contentRepository: contentProvider,
      ref: ref);
});

class ShiftProvider {
  final RequestRepository _requestRepository;
  final ContentRepository _contentRepository;
  final Ref _ref;

  ShiftProvider({
    required RequestRepository requestRepository,
    required ContentRepository contentRepository,
    required Ref ref,
  })  : _requestRepository = requestRepository,
        _contentRepository = contentRepository,
        _ref = ref;

  Future<List<ShiftWorkModel>> shiftWork() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _requestRepository.selectShiftWork(jwtToken: jwtToken.toString());
    return res.data!;
  }


  Future<void> shiftRequest(String currentRosterID, String desiredRosterID,
      BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _requestRepository.shiftRequest(
      jwtToken: jwtToken.toString(),
      currentRosterID: currentRosterID,
      desiredRosterID: desiredRosterID,
      statusID: Format.statusID(StatusName.Pending).toString(),
      createdAt: ConvertDateTime.createdAt,
    );
    if (res.isComplete) {
      var refresh = _ref.refresh(shiftStatusProvider);
      refresh;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarSuccessWidget(
            message: 'Shift change request has been submitted',
          ),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarFailedWidget(
            message: 'Failed to submit shift change request',
          ),
        );
      }
    }
  }

  Future<List<ShiftWorkStatusModel>> shiftStatus() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    var res = await _contentRepository.shiftStatus(
      jwtToken: jwtToken.toString(),
    );
    return res.data!;
  }

  // กด approve ที่หน้า shift work
  Future<List<AdminShiftWorkModel>> desiredShift() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    var res = await _contentRepository.desiredShift(
      jwtToken: jwtToken.toString(),
    );
    return res.data!;
  }
}

final shiftDetailProvider =
    FutureProvider.autoDispose<List<ShiftWorkModel>>((ref) async {
  return await ref.read(shiftProvider).shiftWork();
});

final shiftStatusProvider =
    FutureProvider.autoDispose<List<ShiftWorkStatusModel>>((ref) async {
  return await ref.read(shiftProvider).shiftStatus();
});
final desiredShiftProvider =
    FutureProvider.autoDispose<List<AdminShiftWorkModel>>((ref) async {
  return await ref.read(shiftProvider).desiredShift();
});
