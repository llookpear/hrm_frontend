import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../data/local/store_data/store.box.dart';
import '../../../../data/local/store_data/system.dart';
import '../../../../data/repositories/content_repository.dart';
import '../../../../models/user/payroll/payslip_model/payslip_model.dart';

final payRollProvider = Provider<PayRollProvider>((ref) {
  final contentProvider = ref.watch(contentRepositoryProvider);
  return PayRollProvider(contentRepository: contentProvider, ref: ref);
});

class PayRollProvider {
  final ContentRepository _contentRepository;

  PayRollProvider({
    required ContentRepository contentRepository,
    required Ref ref,
  })  : _contentRepository = contentRepository;

  Future<List<PaySlipModel>> payroll() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    var res = await _contentRepository.payroll(jwtToken: jwtToken.toString());
    return res.data!;
  }
}

final payrollProvider = FutureProvider.autoDispose<List<PaySlipModel>>((ref) async {
  return await ref.read(payRollProvider).payroll();
});
