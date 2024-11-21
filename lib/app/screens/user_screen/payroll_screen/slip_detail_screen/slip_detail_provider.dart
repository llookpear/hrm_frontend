import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/content_repository.dart';
import '../../../../../models/user/payroll/payslip_detail_model/payslip_detail_model.dart';

final paySlipProvider = Provider<PaySlipDetailProvider>((ref) {
  final contentProvider = ref.watch(contentRepositoryProvider);
  return PaySlipDetailProvider(contentRepository: contentProvider, ref: ref);
});

class PaySlipDetailProvider {
  final ContentRepository _contentRepository;

  PaySlipDetailProvider({
    required ContentRepository contentRepository,
    required Ref ref,
  })  : _contentRepository = contentRepository;

  Future<List<PaySlipDetailModel>> payslipDetail(String payslipID) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    var res = await _contentRepository.payslipDetail(
        jwtToken: jwtToken.toString(), payslipID: payslipID);
    return res.data!;
  }

  Future<Uint8List> requestPayslip(String payslipID) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    var res = await _contentRepository.requestPayslip(
        jwtToken: jwtToken.toString(), payslipID: payslipID);
    return res.data;
  }
}

final payslipDetailProvider = FutureProvider.family.autoDispose<List<PaySlipDetailModel>, String>((ref, payslipId) async {
  return await ref.read(paySlipProvider).payslipDetail(payslipId);
});

final requestPayslipProvider = FutureProvider.family.autoDispose<Uint8List?, String>((ref, payslipID) async {
  var value = await ref.read(paySlipProvider).requestPayslip(payslipID);
  return value;
});



// class BytesHandlers {
//   BytesHandlers();
//   static Future<ByteData> getByteDataFromPath(String assetPath) async {
//
//     late ByteData _byteData;
//
//     if (assetPath != null){
//       _byteData = await rootBundle.load(assetPath);
//     }
//     return _byteData;
//   }
//
//   static Future<Uint8List> getUint8ListFromFile(File file) async {
//     late Uint8List _uInt;
//
//     if (file != null){
//       _uInt = await file.readAsBytes();
//     }
//     return _uInt;
//   }
// }
