import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../models/user/shift_work/shift_work_model.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/shift_work_change_card_outline_widget.dart';
import '../shift_work_provider.dart';

class ShiftRequestDetailScreen extends HookConsumerWidget {
  final ShiftWorkModel desiredRoster;
  final ShiftWorkModel currentRoster;

  const ShiftRequestDetailScreen(
      {super.key, required this.desiredRoster, required this.currentRoster});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convertTime = ConvertDateTime();
    String formattedDesired = convertTime.convertTime(desiredRoster.shiftTime);
    String formattedCurent = convertTime.convertTime(currentRoster.shiftTime);
    const String appBarTitle = 'Change Shift Work';
    const String shiftTitle = "Your Shift Work";
    const String desiredShiftTitle = "Desired Shift Change";
    const String confirmButton = "Confirm";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:AppColor.backgroundColor,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color:AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FontsStyle(
                  text: shiftTitle,
                  color:AppColor.lightGreyColor,
                  weight: FontWeight.w100
              ),
              ShiftWorkChangeCardOutlineWidget(
                shiftTime: formattedCurent,
                fullname: currentRoster.fullName,
                position: currentRoster.position,
                department: currentRoster.department,
                rosterId: currentRoster.rosterId.toString(),
              ),
              const SizedBox(
                height: 20,
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
                height: 20,
              ),
              const FontsStyle(
                  text: desiredShiftTitle,
                  color:AppColor.lightGreyColor,
                  weight: FontWeight.w100),
              ShiftWorkChangeCardOutlineWidget(
                shiftTime: formattedDesired,
                fullname: desiredRoster.fullName,
                position: desiredRoster.position,
                department: desiredRoster.department,
                rosterId: desiredRoster.rosterId.toString(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        ElevatedButtonWidget(
                          title: confirmButton,
                          onPressed: () {
                            ref.read(shiftProvider).shiftRequest(
                                  currentRoster.rosterId.toString(),
                                  desiredRoster.rosterId.toString(),
                                  context,
                                );
                            Navigator.pop(context);
                          },
                        ),
                      ],
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
