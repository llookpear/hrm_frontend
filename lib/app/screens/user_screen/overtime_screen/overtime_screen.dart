import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import 'package:hrm_project/app/widgets/class/icons.dart';
import 'package:hrm_project/utils/format.dart';
import '../../../../models/enum.dart';
import '../../../../routing/app_router.dart';
import '../../../../routing/router.dart';
import '../../../../utils/style/app_color.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/class/status_color.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/overtime_history_card_outline_widget.dart';
import '../../../widgets/overtime_total_widget.dart';
import '../home_screen/home_menu_screen/home_menu_provider.dart';
import 'overtime_detail_screen/overtime_detail_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'overtime_provider.dart';

class OvertimeScreenWidget extends HookConsumerWidget {
  const OvertimeScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserOvertimeQuota = ref.watch(overtimeTotalProvider);
    ConvertDateTime convert = ConvertDateTime();
    const String appBarTitle = 'Overtime';
    const String text = 'Status of overtime requests created in current year';
    const String nameOfID = 'OT :';
    final overtimeProvider = ref.watch(overtimeHistoryProvider);

    final select = StateProvider<SortBy>((ref) => SortBy.ID);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColor.backgroundColor,
        actionOnPressed: () {
          ref.read(routerProvider).push(AppRouter().overtimeRequestScreen);
        },
        actionIcons: Icons.add,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  asyncUserOvertimeQuota.when(
                    data: (overtimeTotal) {
                      return OvertimeTotalWidget(
                        number: (overtimeTotal.total).toString(),
                      );
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (error, stack) => Text('Error: $error'),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Card.filled(
                color: AppColor.secondaryBlueColor,
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
                          color: AppColor.primaryBlueColor,
                          weight: FontWeight.normal,
                        ),
                      )),
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
                    iconSize: 20,
                    iconColor: AppColor.lightGreyColor,
                    menuPadding: const EdgeInsets.all(4),
                    position: PopupMenuPosition.under,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    color: Colors.white,
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
                            ref.read(select.notifier).state = SortBy.ID;
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
                            ref.read(select.notifier).state = SortBy.Date;
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
                            ref.read(select.notifier).state = SortBy.Status;
                          }),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    return overtimeProvider.when(
                      data: (data) {
                        final selectedSort = ref.watch(select);
                        // print(selectedSort);
                        data.sort((a, b) {
                          switch (selectedSort) {
                            case SortBy.ID:
                              return a.otID.compareTo(b.otID);
                            case SortBy.Date:
                              return a.date.compareTo(b.date);
                            case SortBy.Status:
                              return a.statusID.compareTo(b.statusID);
                            default:
                              return 0;
                          }
                        });
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final ot = data[index];
                            final otDate = convert.convertDateDdMmYyyy(ot.date);
                            final startTime = convert.convertTime(ot.startTime);
                            final endTime = convert.convertTime(ot.endTime);
                            var statusColors = StatusColor.getColors(
                                Format.statusName(ot.statusID));
                            return OvertimeHistoryCardOutlineWidget(
                              slipID: '',
                              nameOfID: "$nameOfID ${ot.otID}",
                              bgColor: statusColors.pbgColor,
                              fontColor: statusColors.pfontColor,
                              status: Format.statusName(ot.statusID),
                              date: otDate,
                              startTime: startTime,
                              endTime: endTime,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OvertimeDetailScreen(item: ot),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// class Sort{
//   String ;
// }
