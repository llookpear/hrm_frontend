import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../../../data/local/store_data/store.box.dart';
import '../../../../../../data/local/store_data/system.dart';
import '../../../../../../data/repositories/user_repository.dart';
import '../../../../../widgets/snackbar_widget.dart';

final editPasswordProvider = Provider<EditPasswordProvider>((ref) {
  final editPasswordProvider = ref.watch(userRepositoryProvider);
  return EditPasswordProvider(userRepository: editPasswordProvider);
});

class EditPasswordProvider {
  final UserRepository _userRepository;


  EditPasswordProvider({
    required UserRepository userRepository,

  })  : _userRepository = userRepository;

  Future<void> updatePassword(String newPassword, BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    var res = await _userRepository.updatePassword(
      jwtToken: jwtToken.toString(),
      newPassword: newPassword
    );
    if (res.isComplete) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBarSuccessWidget(message: 'Password changed successfully',));
      }
    } 
  }
}
