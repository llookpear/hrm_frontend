import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/content_repository.dart';
import '../../../../../models/user/payroll/salary_certificate_model/salary_certificate_model.dart';

final certificateStatusProvider = Provider<CertificateStatusProvider>((ref) {
  final contentProvider = ref.watch(contentRepositoryProvider);
  return CertificateStatusProvider(contentRepository: contentProvider);
});

class CertificateStatusProvider {
  final ContentRepository _contentRepository;

  CertificateStatusProvider({
    required ContentRepository contentRepository,
  }) : _contentRepository = contentRepository;

  Future<List<CertificateModel>> certificateStatus() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    var res = await _contentRepository.certificateStatus(jwtToken: jwtToken.toString());
    return res.data!;
  }
}

final certificateProvider = FutureProvider.autoDispose<List<CertificateModel>>((ref) async {
  return await ref.read(certificateStatusProvider).certificateStatus();
});
