import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'chip_card_widget.dart';
import 'fonts_style_widget.dart';

class SalaryCertificateCardWidget extends StatelessWidget {
  final String id;
  final String dateStamp;
  final String nameOfID;
  final String status;
  // final String month;
  final Color bgColor;
  final Color fontColor;
  // final Function() onPressed;

  const SalaryCertificateCardWidget(
      {super.key,
      required this.id,
      // required this.month,
      required this.nameOfID,
      required this.bgColor,
      required this.fontColor,
      required this.status,
      required this.dateStamp,
        // required this.onPressed
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // FontsStyle(
        //   text: month,
        //   color: AppColor.lightGreyColor,
        //   weight: FontWeight.w100,
        // ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                // onTap: onPressed,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
               // onTap: onPressed,
                child: Card.outlined(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: FontsStyle(
                                        size: 16,
                                        text: nameOfID,
                                        color:  AppColor.darkGreyColor,
                                        weight: FontWeight.w500),
                                  ),

                                  ChipCardWidget(
                                    bgColor: bgColor,
                                    fontColor: fontColor,
                                    status: status,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              FontsStyle(
                                  text: "ID : $id",
                                  color: AppColor.lightGreyColor,
                                  weight: FontWeight.w500),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    size: 20,
                                    FluentIcons.calendar_16_regular,
                                    color:AppColor.lightGreyColor,
                                  ),
                                  const SizedBox(width: 10),
                                  FontsStyle(
                                      text: dateStamp,
                                      color: AppColor.lightGreyColor,
                                      weight: FontWeight.w500),
                                ],
                              ),
                            ],
                          ),
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
