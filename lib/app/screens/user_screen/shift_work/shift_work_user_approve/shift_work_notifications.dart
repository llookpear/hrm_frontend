import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/user_screen/shift_work/shift_work_user_approve/shift_work_user_approve.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../providers/app_provider.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../shift_work_provider.dart';

class ShiftWorkNotificationsScreenWidget extends HookConsumerWidget {
  const ShiftWorkNotificationsScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftRequests = ref.watch(desiredShiftProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        leadingWidth: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.darkGreyColor,
          ),
        ),
        title: const FontsStyle(
          size: 20,
          text: "Shift Work Request",
          color: AppColor.darkGreyColor,
          weight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // const Row(
            //   children: [
            //     Icon(
            //       Icons.notifications_active_sharp,
            //       color: AppColor.darkGreyColor,
            //     ),
            //     SizedBox(width: 8),
            //     FontsStyle(
            //       size: 18,
            //       text: "Request",
            //       color: AppColor.darkGreyColor,
            //       weight: FontWeight.w600,
            //     ),
            //   ],
            // ),
            const SizedBox(height: 4),
            shiftRequests.when(
              data: (shift) {
                return Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: shift.length,
                    itemBuilder: (context, index) {
                      final data = shift[index];
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShiftWorkUserApproveWidget(
                                item: data,
                              ),
                            ),
                          );
                        },
                        child: Card.outlined(
                          // color: AppColor.primaryLightBlueColor,
                          color: Colors.white,
                          surfaceTintColor: AppColor.primaryLightBlueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Card.outlined(
                                      // color: AppColor.secondaryLightBlueColor,
                                      color: AppColor.primaryLightBlueColor,
                                      surfaceTintColor:
                                          AppColor.secondaryLightBlueColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: FontsStyle(
                                                text: convert.convertTime(
                                                    data.desiredShiftTime),
                                                color:
                                                    AppColor.iconInAdminColor,
                                                weight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FontsStyle(
                                          size: 16,
                                          text: convert
                                              .convertDateddMMMMyyyy(data.date),
                                          color: Colors.black,
                                          weight: FontWeight.w500),
                                      FontsStyle(
                                          text: data.requestingName,
                                          color: AppColor.darkGreyColor,
                                          weight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              loading: () => Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: AppColor.primaryYellowColor, size: 50),
              ),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
          ],
        ),
      )),
    );
  }
}
