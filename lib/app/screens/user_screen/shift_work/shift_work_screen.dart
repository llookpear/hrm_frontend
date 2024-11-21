import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/user_screen/shift_work/shift_work_detail_screen/shift_work_detail_screen.dart';
import 'package:hrm_project/app/screens/user_screen/shift_work/shift_work_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../models/enum.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/router.dart';
import '../../../../utils/format.dart';
import '../../../../utils/style/app_color.dart';
import '../../../widgets/class/convert_datetime_number.dart';
import '../../../widgets/class/icons.dart';
import '../../../widgets/class/status_color.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/shift_work_card_outline_widget.dart';

class ShiftWorkScreenWidget extends HookConsumerWidget {
  final String staffID;

  const ShiftWorkScreenWidget({super.key, required this.staffID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shiftProvider = ref.watch(shiftStatusProvider);
    final shiftRequests = ref.watch(desiredShiftProvider);
    final badgeValue = shiftRequests.value?.length;
    ConvertDateTime convert = ConvertDateTime();
    // const String appBarTitle = 'Shift Work';
    // const String requestTitle = "Request";
    const String statusTitle = "Status";
    const String nameOfID = "Shift : ";
    final selectSort = StateProvider<SortBy>((ref) => SortBy.ID);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      // appBar: AppBarWidget(
      //   title: appBarTitle,
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   color: Colors.white,
      //   actionIcons: Icons.add,
      //
      //   actionOnPressed: () {
      //     ref.read(routerProvider).push(AppRouter().shiftworkRequestScreen, extra: staffID.toString());
      //   },
      // ),
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
          text: "Shift Work",
          color: AppColor.darkGreyColor,
          weight: FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(routerProvider).push(
                        AppRouter().shiftworkRequestScreen,
                        extra: staffID.toString());
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                  color: AppColor.darkGreyColor,
                ),
                Badge(
                  backgroundColor: AppColor.primaryCancelColor,
                  label: FontsStyle(
                    text: "$badgeValue",
                    color: Colors.white,
                    weight: FontWeight.bold,
                    size: 12,
                  ),
                  offset: const Offset(-1, 3),
                  child: IconButton(
                    onPressed: () {
                      ref
                          .read(routerProvider)
                          .push(AppRouter().shiftWorkNotificationsScreen);
                    },
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                    ),
                    color: AppColor.darkGreyColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              //       text: requestTitle,
              //       color: AppColor.darkGreyColor,
              //       weight: FontWeight.w600,
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 4),
              // shiftRequests.when(
              //   data: (shift) {
              //     return Expanded(
              //       flex: 1,
              //       child: ListView.builder(
              //         itemCount: shift.length,
              //         itemBuilder: (context, index) {
              //           final data = shift[index];
              //           return InkWell(
              //             splashColor: Colors.transparent,
              //             highlightColor: Colors.transparent,
              //             onTap: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) =>
              //                       ShiftWorkUserApproveWidget(
              //                     item: data,
              //                   ),
              //                 ),
              //               );
              //             },
              //             child: Card.outlined(
              //               color: AppColor.primaryLightBlueColor,
              //               surfaceTintColor: AppColor.primaryLightBlueColor,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(4),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(14),
              //                 child: Row(
              //                   children: [
              //                     Expanded(
              //                         flex: 2,
              //                         child: Card.outlined(
              //                           color: AppColor.secondaryLightBlueColor,
              //                           surfaceTintColor:
              //                               AppColor.secondaryLightBlueColor,
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius:
              //                                 BorderRadius.circular(10),
              //                           ),
              //                           child: Column(
              //                             children: [
              //                               const Text(" "),
              //                               FontsStyle(
              //                                   text: convert.convertTime(
              //                                       data.desiredShiftTime),
              //                                   color:
              //                                       AppColor.iconInAdminColor,
              //                                   weight: FontWeight.w600),
              //                               const Text(" "),
              //                             ],
              //                           ),
              //                         )),
              //                     const SizedBox(
              //                       width: 20,
              //                     ),
              //                     Expanded(
              //                       flex: 3,
              //                       child: Column(
              //                         crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                         children: [
              //                           FontsStyle(
              //                               size: 16,
              //                               text: convert.convertDateddMMMMyyyy(
              //                                   data.date),
              //                               color: Colors.black,
              //                               weight: FontWeight.w500),
              //                           FontsStyle(
              //                               text: data.requestingName,
              //                               color: AppColor.darkGreyColor,
              //                               weight: FontWeight.w500),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           );
              //         },
              //       ),
              //     );
              //   },
              //   loading: () => Center(
              //     child: LoadingAnimationWidget.horizontalRotatingDots(
              //         color: AppColor.primaryYellowColor, size: 50),
              //   ),
              //   error: (error, stackTrace) => Text('Error: $error'),
              // ),
              Row(
                children: [
                  const Expanded(
                    child: FontsStyle(
                      size: 18,
                      text: statusTitle,
                      color: AppColor.darkGreyColor,
                      weight: FontWeight.w600,
                    ),
                  ),
                  const FontsStyle(
                    text: "Sort by",
                    color: AppColor.darkGreyColor,
                    weight: FontWeight.normal,
                    size: 12,
                  ),
                  PopupMenuButton<SortBy>(
                    icon: AppIcons.sort(),
                    menuPadding: const EdgeInsets.all(4),
                    position: PopupMenuPosition.under,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    color: Colors.white,
                    iconColor: AppColor.darkGreyColor,
                    clipBehavior: Clip.none,
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<SortBy>>[
                      PopupMenuItem<SortBy>(
                          value: SortBy.ID,
                          child: FontsStyle(
                            text: SortBy.ID.name,
                            color: AppColor.darkGreyColor,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                          onTap: () {
                            ref.read(selectSort.notifier).state = SortBy.ID;
                          }),
                      PopupMenuItem<SortBy>(
                          value: SortBy.Date,
                          child: FontsStyle(
                            text: SortBy.Date.name,
                            color: AppColor.darkGreyColor,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                          onTap: () {
                            ref.read(selectSort.notifier).state = SortBy.Date;
                          }),
                      PopupMenuItem<SortBy>(
                          value: SortBy.Status,
                          child: FontsStyle(
                            text: SortBy.Status.name,
                            color: AppColor.darkGreyColor,
                            weight: FontWeight.normal,
                            size: 12,
                          ),
                          onTap: () {
                            ref.read(selectSort.notifier).state = SortBy.Status;
                          }),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Consumer(builder: (context, ref, child) {
                return shiftProvider.when(
                  data: (shift) {
                    final selectedSort = ref.watch(selectSort);
                    shift.sort((a, b) {
                      switch (selectedSort) {
                        case SortBy.ID:
                          return a.shiftChangeID.compareTo(b.shiftChangeID);
                        case SortBy.Date:
                          return a.date.compareTo(b.date);
                        case SortBy.Status:
                          return a.statusID.compareTo(b.statusID);
                        default:
                          return 0;
                      }
                    });
                    return Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: shift.length,
                        itemBuilder: (context, index) {
                          final data = shift[index];
                          String formattedDate =
                              convert.convertDateddMMMMyyyy(data.date);
                          var statusColors = StatusColor.getColors(
                              Format.statusName(data.statusID));
                          return ShiftWorkCardOutlineWidget(
                            date: formattedDate,
                            startTime:
                                convert.convertTime(data.currentShiftTime),
                            nameOfID: '$nameOfID${data.shiftChangeID}',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShiftWorkDetailScreen(item: data),
                                ),
                              );
                            },
                            bgColor: statusColors.pbgColor,
                            fontColor: statusColors.pfontColor,
                            status: Format.statusName(data.statusID),
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
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
