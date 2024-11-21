import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../data/local/store_data/store.box.dart';
import '../../../../data/local/store_data/system.dart';
import '../../../../data/repositories/addmin_repository.dart';
import '../../../../models/admin/overtime_model/overtime_model.dart';
import '../../../../models/enum.dart';
import '../../../../utils/format.dart';
import '../../../widgets/snackbar_widget.dart';

final allOvertimeProvider = Provider<AllLeaveProvider>((ref) {
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

  Future<List<OvertimeModel>> overtime() async {
    var res = await _adddminRepository.allOvertime();
    return res.data!;
  }

  Future approveOvertime(
      String otID, String statusID, BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _adddminRepository.approveOvertime(
      jwtToken: jwtToken.toString(),
      otID: otID,
      statusID: statusID,
    );

    if (res.isComplete) {
      final refresh = _ref.refresh(allovertimeProvider);
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

final allovertimeProvider =
    FutureProvider.autoDispose<List<OvertimeModel>>((ref) async {
  return await ref.read(allOvertimeProvider).overtime();
});
