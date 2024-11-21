import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../data/local/store_data/store.box.dart';
import '../../../../data/local/store_data/system.dart';
import '../../../../data/repositories/content_repository.dart';
import '../../../../data/repositories/request_repository.dart';
import '../../../../models/user/overtime/overtime_history_model/overtime_history_model.dart';
import '../../../widgets/class/convert_datetime_number.dart';
import '../../../widgets/snackbar_widget.dart';

final overtimeProvider = Provider<OvertimeProvider>((ref) {
  final contentProvider = ref.watch(contentRepositoryProvider);
  final requestProvider = ref.watch(requestRepositoryProvider);
  return OvertimeProvider(
      contentRepository: contentProvider,
      requestRepository: requestProvider,
      ref: ref);
});

class OvertimeProvider {
  final ContentRepository _contentRepository;
  final RequestRepository _requestRepository;
  final Ref _ref;

  OvertimeProvider({
    required ContentRepository contentRepository,
    required RequestRepository requestRepository,
    required Ref ref,
  })  : _contentRepository = contentRepository,
        _requestRepository = requestRepository,
        _ref = ref;

  Future<List<OvertimeHistoryModel>> getOvertimeHistory() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res =
        await _contentRepository.overtimeHistory(jwtToken: jwtToken.toString());
    return res.data!;
  }

  Future<void> overtimeRequest(
      int statusID,
      String total,
      String date,
      String startTime,
      String endTime,
      String detail,
      BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _requestRepository.overtimeRequest(
      jwtToken: jwtToken.toString(),
      statusID: statusID,
      total: total,
      date: date,
      startTime: startTime,
      endTime: endTime,
      detail: detail,
      createdAt: ConvertDateTime.createdAt,
    );
    if (res.isComplete) {
      _ref.refresh(overtimeHistoryProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarSuccessWidget(
            message: 'Your overtime request has been submitted',
          ),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBarFailedWidget(
            message: 'Failed to submit your overtime request',
          ),
        );
      }
    }
  }
}

final overtimeHistoryProvider = FutureProvider.autoDispose<List<OvertimeHistoryModel>>((ref) async {
  return await ref.read(overtimeProvider).getOvertimeHistory();
});
