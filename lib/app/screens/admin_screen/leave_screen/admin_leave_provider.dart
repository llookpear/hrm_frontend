import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../data/local/store_data/store.box.dart';
import '../../../../data/local/store_data/system.dart';
import '../../../../data/repositories/addmin_repository.dart';
import '../../../../models/admin/leave_model/leave_model.dart';
import '../../../../models/enum.dart';
import '../../../../utils/format.dart';
import '../../../widgets/snackbar_widget.dart';

final allLeaveProvider = Provider<AllLeaveProvider>((ref) {
  final addminProvider = ref.watch(addminRepositoryProvider);
  return AllLeaveProvider(addminRepository: addminProvider, ref: ref);
});

class AllLeaveProvider {
  final AddminRepository _adddminRepository;
  final Ref _ref;

  AllLeaveProvider({
    required AddminRepository addminRepository,
    required Ref ref,
  })  : _adddminRepository = addminRepository,
        _ref = ref;

  Future<List<LeaveModel>> leave() async {
    var res = await _adddminRepository.allLeave();
    return res.data!;
  }

  Future approveLeave(
      String leaveID, String statusID, BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _adddminRepository.approveLeave(
      jwtToken: jwtToken.toString(),
      leaveID: leaveID,
      statusID: statusID,
    );
    if (res.isComplete) {
      var refresh = _ref.refresh(allleaveProvider);
      refresh;
      if (context.mounted) {
        if (Format.statusID(StatusName.Confirm).toString() == statusID) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBarSuccessWidget(message: 'The request has been approved'));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBarSuccessWidget(message: 'The request has been rejected'));
        }
      }
    } else {
      throw Exception('Failed');
    }
  }
}

final allleaveProvider =
    FutureProvider.autoDispose<List<LeaveModel>>((ref) async {
  return await ref.read(allLeaveProvider).leave();
});
