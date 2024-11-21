import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'chip_card_widget.dart';
import 'fonts_style_widget.dart';

class LeaveStatusCardOutlineWidget extends StatelessWidget {
  final String slipID;
  final String startDate;
  final String ? endDate;
  final String nameOfID;
  final String? detail;
  final String status;
  final Color bgColor;
  final Color fontColor;
  final Function() onPressed;

  const LeaveStatusCardOutlineWidget(
      {super.key,
      required this.slipID,
      required this.startDate,
       this.endDate,
      required this.nameOfID,
      required this.onPressed,
      required this.bgColor,
      required this.fontColor,
      required this.status,
      this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 8,),
        Expanded(
          child: InkWell(
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
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FontsStyle(
                                  size: 16,
                                  text: nameOfID,
                                  color:  AppColor.darkGreyColor,
                                  weight: FontWeight.w500),
                              const SizedBox(width: 5),
                              FontsStyle(
                                  size: 16,
                                  text: slipID,
                                  color:  AppColor.darkGreyColor,
                                  weight: FontWeight.w500),
                            ],
                          ),
                          const SizedBox(height: 2),
                          FontsStyle(
                              text: detail ?? '',
                               color: AppColor.primaryBlueColor,
                              // color: const Color(0xFF9C9C9B),
                               weight: FontWeight.normal),
                          const SizedBox(height: 3),
                          Row(
                           // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                FluentIcons.calendar_16_regular,
                                color:AppColor.lightGreyColor,
                              ),
                              const SizedBox(width: 2),
                              FontsStyle(
                                  text: '$startDate - $endDate',
                                  color: AppColor.lightGreyColor,
                                  weight: FontWeight.w500),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ChipCardWidget(bgColor: bgColor, fontColor: fontColor, status: status,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
