import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/models/admin/shift_work_model/shift_work_model.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/approve_reject_button_widget.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/info_card.dart';
import '../../../../widgets/shift_work_change_card_outline_widget.dart';
import '../admin_shift_work_provider.dart';

class AddminShiftWorkDetailScreen extends HookConsumerWidget {
  final AdminShiftWorkModel item;

  const AddminShiftWorkDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convert = ConvertDateTime();
    String desiredShiftTime = convert.convertTime(item.desiredShiftTime);
    String currentShiftTime = convert.convertTime(item.requestingShiftTime);
    const String appBarTitle = "Shift Change Detail";
    const String requestShiftMessage = "Requesting Shift";
    const String desiredShiftMessage = "Desired Shift";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar:AppBarWidget(
        title: appBarTitle,
        onPressed: () => Navigator.pop(context),
        color: AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              InfoCard(status: Format.statusName(item.statusID)),
              const SizedBox(
                height: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FontsStyle(
                      text: requestShiftMessage,
                      color:AppColor.lightGreyColor,
                      weight: FontWeight.w100),
                  ShiftWorkChangeCardOutlineWidget(
                    shiftTime: currentShiftTime,
                    fullname: item.requestingName,
                    position: item.requestingPosition,
                    department: item.requestingDepartment,
                    rosterId: item.requestingShift.toString(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FluentIcons.arrow_swap_16_regular,
                        // Icons.swap_horiz_outlined,
                        color: AppColor.iconInAdminColor,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const FontsStyle(
                      text: desiredShiftMessage,
                      color:AppColor.lightGreyColor,
                      weight: FontWeight.w100),

                  ShiftWorkChangeCardOutlineWidget(
                    shiftTime: desiredShiftTime,
                    fullname: item.desiredName,
                    position: item.desiredPosition,
                    department: item.desiredDepartment,
                    rosterId: item.desiredShift.toString(),
                  ),

                ],
              ),
              if (Format.statusName(item.statusID) == StatusName.Request.name)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ApproveRejectButtonWidget(
                        onPressedReject: () async {
                          Navigator.pop(context);
                          await ref.read(allShiftWorkProvider).approveShiftWork(
                                item.shiftChangeID.toString(),
                                Format.statusID(StatusName.Cancel).toString(),
                                item.requestingShift.toString(),
                                item.desiredShift.toString(),
                                context,
                              );
                        },
                        onPressedApprove: () async {
                          Navigator.pop(context);
                          await ref.read(allShiftWorkProvider).approveShiftWork(
                                item.shiftChangeID.toString(),
                                Format.statusID(StatusName.Confirm).toString(),
                                item.requestingShift.toString(),
                                item.desiredShift.toString(),
                                context,
                              );
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
