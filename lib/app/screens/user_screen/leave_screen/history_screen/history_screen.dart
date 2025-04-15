import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/class/icons.dart';
import '../../../../widgets/class/status_color.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/leave_status_card_outline_widget.dart';
import '../leave_detail_screen/leave_detail_screen.dart';
import 'history_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HistoryScreenWidget extends HookConsumerWidget {
  const HistoryScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String title = 'Leave ID :';
    const String appBarTitle = 'History ';
    const String text = "Status of leave requests created in the current year";
    ConvertDateTime convert = ConvertDateTime();
    final selectSort = StateProvider<SortBy>((ref) => SortBy.ID);
    final leaveRequestProvider = ref.watch(LeaveHistoryProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card.filled(
                color: AppColor.secondaryPurpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Expanded(
                          child: Center(
                              child: FontsStyle(
                        size: 12,
                        text: text,
                        color: AppColor.primaryPurpleColor,
                        weight: FontWeight.normal,
                      ))),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
              Expanded(
                child: Consumer(
                    builder: (context, ref, child) {
                  return leaveRequestProvider.when(
                    data: (data) {
                      final selectedSort = ref.watch(selectSort);
                      data.sort((a, b) {
                        switch (selectedSort) {
                          case SortBy.ID:
                            return a.leaveID.compareTo(b.leaveID);
                          case SortBy.Date:
                            return a.startDate.compareTo(b.startDate);
                          case SortBy.Status:
                            return a.statusID.compareTo(b.statusID);
                          default:
                            return 0;
                        }
                      });
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final leaveData = data[index];
                          final formattedStartDate =
                              convert.convertDateDdMmYyyy(leaveData.startDate);
                          final formattedEndDate =
                              convert.convertDateDdMmYyyy(leaveData.endDate);
                          var statusColors = StatusColor.getColors(
                              Format.statusName(leaveData.statusID));
                          return LeaveStatusCardOutlineWidget(
                            nameOfID: title,
                            slipID: leaveData.leaveID.toString(),
                            startDate: formattedStartDate,
                            endDate: formattedEndDate,
                            detail: Format.leaveName(leaveData.type),
                            status: Format.statusName(leaveData.statusID),
                            bgColor: statusColors.pbgColor,
                            fontColor: statusColors.pfontColor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LeaveDetailScreen(item: leaveData),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    loading: () => Center(
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                          color: AppColor.primaryYellowColor, size: 50),
                    ),
                    error: (error, stackTrace) => Text('Error: $error'),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
