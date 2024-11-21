import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hrm_project/models/user/update_user/update_user_model.dart';
import '../../../../../../data/local/store_data/store.box.dart';
import '../../../../../../data/local/store_data/system.dart';
import '../../../../../../data/repositories/user_repository.dart';
import '../../../../widgets/snackbar_widget.dart';
import '../admin_profile_provider.dart';

final editProfileProvider = Provider<EditProfileProvider>((ref) {
  final editProfileProvider = ref.watch(userRepositoryProvider);
  return EditProfileProvider(userRepository: editProfileProvider, ref: ref);
});

class EditProfileProvider {
  final UserRepository _userRepository;
  final Ref _ref;

  EditProfileProvider({
    required UserRepository userRepository,
    required Ref ref,
  })  : _userRepository = userRepository,
        _ref = ref;

  Future<UpdateUserModel?> updateProfile(
      String firstname,
      String lastname,
      String phone,
      String email,
      String? oldFilename,
      XFile? file,
      BuildContext context) async {
    final jwtToken = Hive.box<StoreSystemData>(systemBox).getAt(0)!.accessToken;
    await _userRepository.updateUserDetail(
      jwtToken: jwtToken.toString(),
      firstname: firstname,
      lastname: lastname,
      email: email,
      phone: phone,
      oldImg: oldFilename,
      file: file,
    );
    var refresh = _ref.refresh(profileDetailProvider);
    refresh;
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBarSuccessWidget(
        message: 'Your profile has been successfully updated',
      ));
    }
    return null;
  }
}
