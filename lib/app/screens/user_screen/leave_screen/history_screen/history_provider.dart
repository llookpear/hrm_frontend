import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/content_repository.dart';
import '../../../../../models/user/leave/leave_status_model/leave_status_model.dart';

final leaveHistoryProvider = Provider<LeaveHistory>((ref) {
  final contentProvider = ref.watch(contentRepositoryProvider);
  return LeaveHistory(contentRepository: contentProvider);
});

class LeaveHistory {
  final ContentRepository _contentRepository;

  LeaveHistory({
    required ContentRepository contentRepository,
  }) : _contentRepository = contentRepository;


  Future<List<LeaveStatusModel>> leaveHistory() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)?.accessToken;
    var res = await _contentRepository.leaveHistory(jwtToken: jwtToken.toString(),);
    return res.data!;

  }
}


final LeaveHistoryProvider = FutureProvider.autoDispose<List<LeaveStatusModel>>((ref) async {
  return await ref.read(leaveHistoryProvider).leaveHistory();
});
