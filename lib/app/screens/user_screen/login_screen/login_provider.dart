import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../data/local/store_data/store.box.dart';
import '../../../../data/local/store_data/system.dart';
import '../../../../data/repositories/user_repository.dart';
import '../../../../providers/app_provider.dart';

final loginProvider = Provider<LoginProvider>((ref) {
  final userProvider = ref.watch(userRepositoryProvider);
  return LoginProvider(userRepository: userProvider, ref: ref);
  }
);

class LoginProvider {
  final UserRepository _userRepository;
  final Ref _ref;

  LoginProvider({
    required UserRepository userRepository,
    required Ref ref,
  })  : _userRepository = userRepository,
        _ref = ref;

  Future login (String email, String password, BuildContext context) async {
    var res = await _userRepository.login(email: email, password: password);
    if (res.isComplete) {
      if (res.data != null ) {
        var u = Hive.box<StoreSystemData>(systemBox).getAt(0)!;
        u.accessToken = res.data!.accessToken;
        await u.save();
        var permission = res.data?.permission;
        _ref.read(appProvider).init(permission);
      }
    }
  }
}