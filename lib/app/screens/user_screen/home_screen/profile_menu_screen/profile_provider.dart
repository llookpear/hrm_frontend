import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../data/repositories/user_repository.dart';
import '../../../../../models/user/user_detail/user_detail_model.dart';
final profileProvider = Provider<ProfileProvider>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return ProfileProvider(userRepository: userRepository);
});

class ProfileProvider {
  final UserRepository _userRepository;

  ProfileProvider({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<UserDetailModel> getUserDetail() async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    if (jwtToken != null) {
      final res = await _userRepository.userDetail(jwtToken: jwtToken.toString());
      return res.data! ;
    } else {
      throw Exception('Token not found');
    }
  }
}
final profileDetailProvider = FutureProvider.autoDispose<UserDetailModel>((ref) async {
  return await ref.read(profileProvider).getUserDetail();
});


