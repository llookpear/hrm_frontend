import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/content_repository.dart';
import '../../../../../models/user/leave/leave_status_model/leave_status_model.dart';

final leaveStatusProvider = Provider<LeaveStatusProvider>((ref) {
  final contentProvider = ref.watch(contentRepositoryProvider);
  return LeaveStatusProvider(contentRepository: contentProvider);
});

class LeaveStatusProvider {
  final ContentRepository _contentRepository;

  LeaveStatusProvider({
    required ContentRepository contentRepository,
  }) : _contentRepository = contentRepository;

  Future<List<LeaveStatusModel>> leaveStatus() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    var res = await _contentRepository.leaveStatus(jwtToken: jwtToken.toString(),);
    return res.data!;
  }
}

final leaveRequestStatusProvider = FutureProvider.autoDispose<List<LeaveStatusModel>>((ref) async {
  return await ref.read(leaveStatusProvider).leaveStatus();
});
