import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/content_repository.dart';
import '../../../../../data/repositories/home_repository.dart';
import '../../../../../models/user/check_in_out/check_in_out_total_model/check_in_out_total_model.dart';
import '../../../../../models/user/leave/leave_quota_model/leave_quota_model.dart';
import '../../../../../models/user/leave/leave_total_model/leave_total_model.dart';
import '../../../../../models/user/overtime/overtime_model/overtime_model.dart';

final homeProvider = Provider<HomeProvider>((ref) {
  final contentProvider = ref.watch(contentRepositoryProvider);
  final homeProvider = ref.watch(homeRepositoryProvider);
  return HomeProvider(
      contentRepository: contentProvider,
      homeRepository: homeProvider,
      ref: ref);
});

class HomeProvider {
  final ContentRepository _contentRepository;
  final HomeRepository _homeRepository;

  HomeProvider({
    required ContentRepository contentRepository,
    required HomeRepository homeRepository,
    required Ref ref,
  })  : _contentRepository = contentRepository,
        _homeRepository = homeRepository;

  Future<LeaveTotalModel> getLeaveTotal() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res =
        await _contentRepository.leaveTotal(jwtToken: jwtToken.toString());
    return res.data!;
  }

  Future<LeaveQuotaModel> getLeaveQuota() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _homeRepository.leaveQuota(jwtToken: jwtToken.toString());
    return res.data!;
  }

  Future<OvertimeModel> getOvertimeTotal() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _homeRepository.overtimeTotal(jwtToken: jwtToken.toString());
    return res.data!;
  }

  Future<CheckInOutTotalModel> getCheckInOutWorkday() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res =
        await _homeRepository.checkInOutWorkday(jwtToken: jwtToken.toString());
    return res.data!;
  }
}

final leaveTotalProvider =
    FutureProvider.autoDispose<LeaveTotalModel>((ref) async {
  return await ref.read(homeProvider).getLeaveTotal();
});

final leaveQuotaProvider = FutureProvider.autoDispose<LeaveQuotaModel>((ref) async {
  return await ref.read(homeProvider).getLeaveQuota();
});


final checkInOutWorkdayProvider =
    FutureProvider.autoDispose<CheckInOutTotalModel>((ref) async {
  return await ref.read(homeProvider).getCheckInOutWorkday();
});

final overtimeTotalProvider =
    FutureProvider.autoDispose<OvertimeModel>((ref) async {
  return await ref.read(homeProvider).getOvertimeTotal();
});
