import 'dart:typed_data';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/user_screen/home_screen/profile_menu_screen/profile_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:octo_image/octo_image.dart';

import '../../../../../data/local/store_data/store.box.dart';
import '../../../../../data/local/store_data/system.dart';
import '../../../../../models/enum.dart';
import '../../../../../providers/app_provider.dart';
import '../../../../../routing/app_router.dart';
import '../../../../../routing/router.dart';
import '../../../../../utils/api_constant/api_constant.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/button_widget.dart';
import '../../../../widgets/class/icons.dart';
import '../../../../widgets/fonts_style_widget.dart';

class ProfileScreenWidget extends HookConsumerWidget {
  const ProfileScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserDetails = ref.watch(profileDetailProvider);

    const String welcomeMessage = "Welcome!";
    const String logoutMessage = "Logout from your account?";
    const String yes = "Yes";
    const String no = "No";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: asyncUserDetails.when(
            data: (data) {
              // print("image : ${data.userImage}");
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // imageBytes.value != null
                      //     ? ClipOval(
                      //         child: Image.memory(
                      //           imageBytes.value!,
                      //           width: MediaQuery.of(context).size.width * 0.13,
                      //           height: MediaQuery.of(context).size.width * 0.13,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       )
                      //     : AppIcons.userDefaultImg(),
                      // const SizedBox(
                      //   width: 16,
                      // ),

                    // ClipOval(
                    //           child: OctoImage(
                    //             errorBuilder: (_, __, ___) =>
                    //                 HelperPlaceHolder.imagePlaceHolderCircle(
                    //                     size: 24),
                    //             image: CachedNetworkImageProvider(APIConstance.getUserImage(asyncUserDetails.value!.userImage)),
                    //             width: MediaQuery.of(context).size.width * 0.13,
                    //             height: MediaQuery.of(context).size.width * 0.13,
                    //             fit: BoxFit.cover,
                    //           ),
                    // ),

                    ClipOval(
                        child: OctoImage(
                          errorBuilder: (_, __, ___) => AppIcons.userDefaultImg(),
                          image: CachedNetworkImageProvider(APIConstance.getImage(data.userImage)),
                          width: MediaQuery.of(context).size.width * 0.13,
                          height: MediaQuery.of(context).size.width * 0.13,
                          fit: BoxFit.cover,
                        ),
                    ),



                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FontsStyle(
                              text: welcomeMessage,
                              color: AppColor.darkGreyColor,
                              weight: FontWeight.w200),
                          FontsStyle(
                              text: '${data.firstname} ${data.lastname}',
                              color: AppColor.darkGreyColor,
                              weight: FontWeight.bold)
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: const Icon(
                                FluentIcons.arrow_exit_20_filled,
                                color: AppColor.lightGreyColor,
                              ),
                              onTap: () async {
                                var r = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      content: const Text(logoutMessage),
                                      title: Text(ProfileMenu.Logout.name),
                                      actions: [
                                        CupertinoButton(
                                          child: const Text(yes),
                                          onPressed: () => context.pop(true),
                                        ),
                                        CupertinoButton(
                                          child: const Text(no),
                                          onPressed: () => context.pop(false),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (r) {
                                  BotToast.showLoading();
                                  var u = Hive.box<StoreSystemData>(systemBox)
                                      .getAt(0)!;
                                  u.accessToken = null;
                                  await u.save();
                                  BotToast.closeAllLoading();
                                  ref.read(appProvider).init(null);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ButtonWidget(
                    preIcon: AppIcons.userCore(),
                    title: ProfileMenu.Profile.name,
                    onPressed: () async {
                      final ByteData bytes = await rootBundle
                          .load('assets/images/user/user_profile_default.png');
                      final Uint8List imageData = bytes.buffer.asUint8List();
                      ref.read(routerProvider).push(
                        AppRouter().editProfileScreen,
                        extra: {
                          'userDetail': asyncUserDetails.value,
                          'image': data.userImage ?? imageData,
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget(
                    preIcon: AppIcons.passwordCore(),
                    title: ProfileMenu.Password.name,
                    onPressed: () {
                      ref
                          .read(routerProvider)
                          .push(AppRouter().editPasswordScreen);
                    },
                  ),
                ],
              );
            },
            loading: () => Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: AppColor.primaryYellowColor, size: 50),
            ),
            error: (error, stack) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}

class HelperPlaceHolder {
  static Widget imagePlaceHolderCircle({double size = 44}) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Colors.grey,
      child: Icon(Icons.person, size: size / 2, color: Colors.white),
    );
  }
}
