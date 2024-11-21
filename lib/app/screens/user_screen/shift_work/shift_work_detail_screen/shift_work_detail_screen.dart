import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../models/user/shift_work/shitf_work_status/shift_work_status_model.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/card_outline_widget.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/info_card.dart';
import '../../../../widgets/shift_work_change_card_outline_widget.dart';

class ShiftWorkDetailScreen extends HookConsumerWidget {
  final ShiftWorkStatusModel item;

  const ShiftWorkDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convert = ConvertDateTime();
    const String appBarTitle = 'Shift Detail';
    const String dateTitleTextForm = "Date";
    const String timeTitleTextForm = "Time";
    const String nameTitleTextForm = "Name";
    const String positionTitleTextForm = "Position";
    const String departmentTitleTextForm = "Department";
    const String approvedByTitleTextForm = "Approved BY";

    ConvertDateTime convertTime = ConvertDateTime();
    const String shiftChangeTitle = "Shift Change";
    String formattedCurrentShiftTime = convertTime.convertTime(item.desiredShiftTime);
    String formattedDesiredShiftTime = convertTime.convertTime(item.currentShiftTime);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                InfoCard(
                  status: Format.statusName(item.statusID),
                ),
                // FontsStyle(
                //     text: shiftChangeTitle,
                //     color: AppColor.lightGreyColor,
                //     weight: FontWeight.w100),
                // ShiftWorkChangeCardOutlineWidget(
                //   shiftTime: formattedCurrentShiftTime,
                //   fullname: item.fullName,
                //   position: item.position,
                //   department: item.department,
                //   rosterId: item.desiredShift.toString()
                // ),
                // ShiftWorkChangeCardOutlineWidget(
                //     shiftTime: formattedDesiredShiftTime,
                //     fullname: item.de,
                //     position: item.position,
                //     department: item.department,
                //     rosterId: item.desiredShift.toString()
                // ),

                CardOutlineWidget(
                    title: dateTitleTextForm,
                    detail: convert.convertDateddMMMMyyyy(item.date)),
                CardOutlineWidget(
                    title: timeTitleTextForm,
                    detail: convert.convertTime(item.currentShiftTime)),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FluentIcons.arrow_swap_16_regular,
                      color: AppColor.iconInAdminColor,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: timeTitleTextForm,
                    detail: convert.convertTime(item.desiredShiftTime)),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: nameTitleTextForm, detail: item.fullName),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: positionTitleTextForm, detail: item.position),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: departmentTitleTextForm, detail: item.department),
                const SizedBox(
                  height: 8,
                ),
                CardOutlineWidget(
                    title: approvedByTitleTextForm, detail: item.approvedBY),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
