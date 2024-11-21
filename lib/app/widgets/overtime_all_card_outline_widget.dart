
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'chip_card_widget.dart';
import 'class/icons.dart';
import 'fonts_style_widget.dart';

class OvertimeAllCardOutlineWidget extends StatelessWidget {
  final String otID;
  final String status;
  final String date;
  final String title;
  final String firstname;
  final String lastname;
  final String startTime;
  final String endTime;
  final String detail;
  final Color bgColor;
  final Color fontColor;
  final Function() onPressed;

  const OvertimeAllCardOutlineWidget({
    super.key,
    required this.otID,
    required this.title,
    required this.date,
    required this.firstname,
    required this.lastname,
    required this.startTime,
    required this.endTime,
    required this.detail,
    required this.onPressed,
    required this.bgColor,
    required this.fontColor,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6,),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onPressed,
          child: Card.outlined(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontsStyle(
                          size: 18,
                          text: date,
                          color: AppColor.darkGreyColor,
                          weight: FontWeight.w600,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              size: 20,
                              FluentIcons.clock_16_regular,
                              color:  AppColor.lightGreyColor,
                            ),
                            const SizedBox(width: 8),
                            FontsStyle(
                              text: startTime,
                              color: AppColor.lightGreyColor,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                            const FontsStyle(
                              text: " - ",
                              color: AppColor.lightGreyColor,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                            FontsStyle(
                              text: endTime,
                              color:AppColor.lightGreyColor,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const SizedBox(width: 3),
                            AppIcons.userLightGrey(),
                            const SizedBox(width: 10),
                            FontsStyle(
                              text: "$title.",
                              color:AppColor.lightGreyColor,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                            FontsStyle(
                              text: firstname,
                              color: AppColor.lightGreyColor,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            FontsStyle(
                              text: lastname,
                              color: AppColor.lightGreyColor,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ChipCardWidget(
                    bgColor: bgColor,
                    fontColor: fontColor,
                    status: status,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
