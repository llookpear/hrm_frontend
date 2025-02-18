import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'chip_card_widget.dart';
import 'class/icons.dart';
import 'fonts_style_widget.dart';

class LeaveAllCardOutlineWidget extends StatelessWidget {
  final String startDate;
  final String? endDate;
  final String totalDay;
  final String status;
  final String title;
  final String firstname;
  final String lastname;
  final String position;
  final String department;
  final String type;
  final Color bgColor;
  final Color fontColor;
  final Color typeColor;
  final Function() onPressed;

  const LeaveAllCardOutlineWidget({
    super.key,
    required this.startDate,
    this.endDate,
    required this.totalDay,
    required this.title,
    required this.firstname,
    required this.lastname,
    required this.position,
    required this.department,
    required this.type,
    required this.onPressed,
    required this.bgColor,
    required this.fontColor,
    required this.typeColor,
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
                          text: "$totalDay Day",
                          color: AppColor.lightGreyColor,
                          weight: FontWeight.w500,
                          size: 14,
                        ),
                        const SizedBox(height: 4),
                        FontsStyle(
                          size: 18,
                          text: startDate,
                          color: AppColor.darkGreyColor,
                          weight: FontWeight.w600,
                        ),
                        const SizedBox(height: 4),
                        FontsStyle(
                          text: type,
                          color: typeColor,
                          weight: FontWeight.w500,
                          size: 14,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            AppIcons.userLightGrey(),
                            const SizedBox(width: 4),
                            FontsStyle(
                              text: "$title.",
                              color:AppColor.lightGreyColor,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                            FontsStyle(
                              text: firstname,
                              color:AppColor.lightGreyColor,
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
                        FontsStyle(
                          text: position,
                          color: AppColor.lightGreyColor,
                          weight: FontWeight.w500,
                          size: 14,
                        ),
                        FontsStyle(
                          text: department,
                          color: AppColor.lightGreyColor,
                          weight: FontWeight.w500,
                          size: 14,
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
