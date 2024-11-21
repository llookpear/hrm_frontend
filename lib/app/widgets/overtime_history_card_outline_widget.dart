import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'chip_card_widget.dart';
import 'fonts_style_widget.dart';

class OvertimeHistoryCardOutlineWidget extends StatelessWidget {
  final String slipID;
  final String date;
  final String startTime;
  final String endTime;
  final String nameOfID;
  final String? detail;
  final String status;
  final Color bgColor;
  final Color fontColor;
  final Function() onPressed;

  const OvertimeHistoryCardOutlineWidget(
      {super.key,
      required this.slipID,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.nameOfID,
      required this.onPressed,
      required this.bgColor,
      required this.fontColor,
      required this.status,
      this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
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
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  FontsStyle(
                                      size: 16,
                                      text: nameOfID,
                                      color: AppColor.darkGreyColor,
                                      weight: FontWeight.w500),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FluentIcons.calendar_16_regular,
                                    color: AppColor.lightGreyColor,
                                  ),
                                  const SizedBox(width: 5),
                                  FontsStyle(
                                      text: date,
                                      color: AppColor.lightGreyColor,
                                      weight: FontWeight.w500),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    FluentIcons.clock_16_regular,
                                    color: AppColor.lightGreyColor,
                                  ),
                                  const SizedBox(width: 5),
                                  FontsStyle(
                                      text: '$startTime - $endTime ',
                                      color: AppColor.lightGreyColor,
                                      weight: FontWeight.w500),
                                ],
                              ),
                            ],
                          ),
                        ),
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
            ),
          ],
        )
      ],
    );
  }
}
