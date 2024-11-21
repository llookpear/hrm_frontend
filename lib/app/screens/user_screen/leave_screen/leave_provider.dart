import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../data/local/store_data/store.box.dart';
import '../../../../data/local/store_data/system.dart';
import '../../../../data/repositories/content_repository.dart';
import '../../../../data/repositories/home_repository.dart';
import '../../../../models/user/leave/leaveTaken_and_quota_model/leaveTaken_and_quota_model.dart';
import '../../../../models/user/leave/leave_type_model.dart';

final leaveTypeProvider = Provider<LeaveTypeProvider>((ref) {
  final homeProvider = ref.read(homeRepositoryProvider);
  final contentRepository = ref.read(contentRepositoryProvider);
  return LeaveTypeProvider(
      homeRepository: homeProvider,
      contentRepository: contentRepository,
      ref: ref);
});

class LeaveTypeProvider {
  final ContentRepository _contentRepository;

  LeaveTypeProvider(
      {required HomeRepository homeRepository,
      required ContentRepository contentRepository,
      required Ref ref})
      : _contentRepository = contentRepository;

  Future<List<LeaveTypeModel>> leaveType() async {
    var res = await _contentRepository.msLeave();
    return res.data!;
  }

  Future<List<LeaveTakenAndQuotaModel>> leaveTakenAndQuota() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _contentRepository.leaveTakenAndQuota(jwtToken: jwtToken.toString());
    return res.data!;
  }
}

final leavetypeProvider =
    FutureProvider.autoDispose<List<LeaveTypeModel>>((ref) async {
  return await ref.read(leaveTypeProvider).leaveType();
});

final leaveTakenAndQuotaProvider =
    FutureProvider.autoDispose<List<LeaveTakenAndQuotaModel>>((ref) async {
  return await ref.read(leaveTypeProvider).leaveTakenAndQuota();
});
