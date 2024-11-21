import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class PayRollCardOutlineWidget extends StatelessWidget {
  final String slipID;
  final String date;
  final String month;
  final String nameOfID;
  final Function() onPressed;

  const PayRollCardOutlineWidget(
      {super.key,
      required this.slipID,
      required this.date,
      required this.month,
      required this.nameOfID,
      required this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FontsStyle(
          text: month,
          color:  AppColor.lightGreyColor,
          weight: FontWeight.w100,
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
                      children: [
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
                                  const SizedBox(width: 10),

                                  FontsStyle(
                                      size: 16,
                                      text: slipID,
                                      color: AppColor.darkGreyColor,
                                      weight: FontWeight.w500),
                                ],
                              ),

                              const SizedBox(height: 4,),

                              Row(
                                children: [
                                  const Icon(
                                    FluentIcons.calendar_16_regular,
                                    color: AppColor.lightGreyColor,
                                  ),
                                  const SizedBox(width: 10),
                                  FontsStyle(
                                      text: date,
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

// ElevatedButton(
//   style: ElevatedButton.styleFrom(
//     fixedSize: Size(400, 45),
//     backgroundColor: Color(0xFF0095FF),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(9),
//     ),
//   ),
//   onPressed: (){},
//   child: const Text(
//       style:  TextStyle(
//           color: Colors.white,
//           fontFamily: 'Poppins',
//           fontWeight: FontWeight.bold),
//       "title"
//   ),
// ),
