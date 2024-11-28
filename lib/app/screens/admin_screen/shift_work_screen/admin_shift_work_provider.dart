import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../data/local/store_data/store.box.dart';
import '../../../../data/local/store_data/system.dart';
import '../../../../data/repositories/addmin_repository.dart';
import '../../../../models/admin/shift_work_model/shift_work_model.dart';
import '../../../../models/enum.dart';
import '../../../../utils/format.dart';
import '../../../widgets/snackbar_widget.dart';
import '../../user_screen/shift_work/shift_work_provider.dart';


final allShiftWorkProvider = Provider<AllShiftWorkProvider>((ref) {
  final addminProvider = ref.watch(addminRepositoryProvider);
  return AllShiftWorkProvider(addminRepository: addminProvider, ref: ref);
});

class AllShiftWorkProvider {
  final AddminRepository _adddminRepository;
  final Ref _ref;

  AllShiftWorkProvider({
    required AddminRepository addminRepository,
    required Ref ref,
  })  : _adddminRepository = addminRepository,
        _ref = ref;

  Future<List<AdminShiftWorkModel>> shiftWork() async {
      var res = await _adddminRepository.allShiftWork();
      return res.data!;
  }

  Future approveShiftWork(
      String shiftChangeID,
      String statusID,
      String currentRosterID,
      String desiredRosterID,
      BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _adddminRepository.approveShiftWork(
      jwtToken: jwtToken.toString(),
      statusID: statusID,
      requestID: shiftChangeID,
      currentRosterID: currentRosterID,
      desiredRosterID: desiredRosterID,
    );
    if (res.isComplete) {
      var refreshDesiredShift = _ref.refresh(desiredShiftProvider);
      var refreshShiftWork =_ref.refresh(shiftWorkProvider);

      refreshDesiredShift;
      refreshShiftWork;
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

// Future approveOvertime(String ot_id, String status_id, BuildContext context) async {
//   final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
//   var res = await _adddminRepository.approveOvertime(
//     jwtToken: jwtToken.toString(),
//     ot_id: ot_id,
//     status_id: status_id,
//   );
//
//   if (res.isComplete) {
//     final result = await _ref.refresh(allovertimeProvider.future);
//     result;
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         elevation: 0,
//         backgroundColor: Color(0xFFBFF3DE),
//         behavior: SnackBarBehavior.floating,
//         duration: Duration(milliseconds: 1000),
//         content: Row(
//           children: [
//             Icon( FluentIcons.checkmark_circle_16_regular ,color: Color(0xFF29D890) ,size: 30,),
//             SizedBox(width: 10,),
//             fonts_style(
//                 text: "Success",
//                 color:  Color(0xFF29D890),
//                 weight: FontWeight.w600),
//           ],
//         ),
//       ),
//     );
//   }
//   else {
//     throw Exception('Failed');
//   }
// }
}

final shiftWorkProvider = FutureProvider.autoDispose<List<AdminShiftWorkModel>>((ref) async {
  return await ref.read(allShiftWorkProvider).shiftWork();

});
