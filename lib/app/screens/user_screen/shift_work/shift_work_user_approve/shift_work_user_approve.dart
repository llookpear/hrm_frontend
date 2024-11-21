import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/appbar_widget.dart';

import '../../../../../models/admin/shift_work_model/shift_work_model.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/approve_reject_button_widget.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/shift_work_change_card_outline_widget.dart';
import '../../../admin_screen/shift_work_screen/admin_shift_work_provider.dart';

class ShiftWorkUserApproveWidget extends HookConsumerWidget {
  final AdminShiftWorkModel item;

  const ShiftWorkUserApproveWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convertTime = ConvertDateTime();
    String formattedDesiredShiftTime = convertTime.convertTime(item.desiredShiftTime);
    String formattedCurentShiftTime = convertTime.convertTime(item.requestingShiftTime);
    String formattedDate = convertTime.convertDateddMMMMyyyy(item.date);

    const String appBarTitle = "Shift Work Request";
    const String shiftTitle = "Your Shift Work";
    const String shiftChangeTitle = "Shift Change";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FontsStyle(
                      text: formattedDate,
                      size: 16,
                      color: AppColor.darkGreyColor,
                      weight: FontWeight.w500),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const FontsStyle(
                  text: shiftTitle,
                  color: AppColor.lightGreyColor,
                  weight: FontWeight.w500),
              ShiftWorkChangeCardOutlineWidget(
                shiftTime: formattedDesiredShiftTime,
                fullname: item.desiredName,
                position: item.desiredPosition,
                department: item.desiredDepartment,
                rosterId: item.desiredShift.toString(),
              ),
              const SizedBox(
                height: 14,
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
              const FontsStyle(
                  text: shiftChangeTitle,
                  color: AppColor.lightGreyColor,
                  weight: FontWeight.w100),
              ShiftWorkChangeCardOutlineWidget(
                shiftTime: formattedCurentShiftTime,
                fullname: item.requestingName,
                position: item.requestingPosition,
                department: item.requestingDepartment,
                rosterId: item.requestingShift.toString(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ApproveRejectButtonWidget(
                      onPressedReject: () async {
                        final allShiftWork = ref.read(allShiftWorkProvider);
                        await allShiftWork.approveShiftWork(
                          item.shiftChangeID.toString(),
                          Format.statusID(StatusName.Cancel).toString(),
                          item.requestingShift.toString(),
                          item.desiredShift.toString(),
                          context,
                        );
                        Navigator.of(context).pop();
                      },
                      onPressedApprove: () async {
                        final allShiftWork = ref.read(allShiftWorkProvider);
                        await allShiftWork.approveShiftWork(
                          item.shiftChangeID.toString(),
                          Format.statusID(StatusName.Request).toString(),
                          item.requestingShift.toString(),
                          item.desiredShift.toString(),
                          context,
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
