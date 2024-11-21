// import 'package:fluentui_system_icons/fluentui_system_icons.dart';
// import 'package:flutter/material.dart';
// import 'chip_card_widget.dart';
// import 'fonts_style_widget.dart';
//
// class ShiftAllCardOutlineWidget extends StatelessWidget {
//   final String requestingName;
//   final String date;
//   final String desiredName;
//   final String currentName;
//   final String desiredTime;
//   final String currentTime;
//   final String status;
//   final Color bgColor;
//   final Color fontColor;
//   final Function() onPressed;
//
//   const ShiftAllCardOutlineWidget({
//     super.key,
//     required this.requestingName,
//     required this.date,
//     required this.desiredName,
//     required this.currentName,
//     required this.desiredTime,
//     required this.currentTime,
//     required this.onPressed,
//     required this.bgColor,
//     required this.fontColor,
//     required this.status,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: InkWell(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onTap: onPressed,
//                 child: Card.outlined(
//                   elevation: 1,
//                   color: Colors.white,
//                   surfaceTintColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: fonts_style(
//                                         size: 16,
//                                         text: date,
//                                         color: const Color(0xFF4F4F4F),
//                                         weight: FontWeight.w500),
//                                   ),
//                                   ChipCardWidget(
//                                     bgColor: bgColor,
//                                     fontColor: fontColor,
//                                     status: status,
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     size: 20,
//                                     FluentIcons.clock_16_regular,
//                                     color: Color(0xFF9C9C9B),
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   fonts_style(
//                                       text: currentTime,
//                                       color: const Color(0xFF9C9C9B),
//                                       weight: FontWeight.w500),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   const fonts_style(
//                                       text: "-",
//                                       color: Color(0xFF9C9C9B),
//                                       weight: FontWeight.w500),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   const Icon(
//                                     size: 20,
//                                     FluentIcons.clock_16_regular,
//                                     color: Color(0xFF9C9C9B),
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   fonts_style(
//                                       text: desiredTime,
//                                       color: const Color(0xFF9C9C9B),
//                                       weight: FontWeight.w500),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   const Icon(
//                                     size: 20,
//                                     FluentIcons.person_16_regular,
//                                     color: Color(0xFF9C9C9B),
//                                   ),
//                                   const SizedBox(
//                                     width: 5,
//                                   ),
//                                   fonts_style(
//                                       size: 14,
//                                       text: currentName,
//                                       color: const Color(0xFF9C9C9B),
//                                       weight: FontWeight.w500),
//                                   const fonts_style(
//                                       text: " - ",
//                                       color: Color(0xFF9C9C9B),
//                                       weight: FontWeight.w500),
//                                   Expanded(
//                                     child: Text(
//                                       desiredName,
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                         color: Color(0xFF9C9C9B),
//                                         overflow: TextOverflow.fade,
//                                       ),
//                                       maxLines: 1,
//                                       softWrap: false,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'chip_card_widget.dart';
import 'fonts_style_widget.dart';

class AdminShiftAllCardOutlineWidget extends StatelessWidget {
  final String requestingName;
  final String date;
  final String desiredName;
  final String currentName;
  final String desiredTime;
  final String currentTime;
  final String status;
  final Color bgColor;
  final Color fontColor;
  final Function() onPressed;

  const AdminShiftAllCardOutlineWidget({
    super.key,
    required this.requestingName,
    required this.date,
    required this.desiredName,
    required this.currentName,
    required this.desiredTime,
    required this.currentTime,
    required this.onPressed,
    required this.bgColor,
    required this.fontColor,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 6,
        ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FontsStyle(
                        size: 18,
                        text: date,
                        color: AppColor.darkGreyColor,
                        weight: FontWeight.w600,
                      ),
                      ChipCardWidget(
                        bgColor: bgColor,
                        fontColor: fontColor,
                        status: status,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        size: 20,
                        FluentIcons.clock_16_regular,
                        color: AppColor.lightGreyColor,
                      ),
                      const SizedBox(width: 4),
                      FontsStyle(
                        text: currentTime,
                        color: AppColor.lightGreyColor,
                        weight: FontWeight.w500,
                        size: 14,
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.swap_horiz,
                        color: AppColor.iconInAdminColor,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        size: 20,
                        FluentIcons.clock_16_regular,
                        color: AppColor.lightGreyColor,
                      ),
                      const SizedBox(width: 4),
                      FontsStyle(
                        text: desiredTime,
                        color: AppColor.lightGreyColor,
                        weight: FontWeight.w500,
                        size: 14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      FontsStyle(
                        size: 14,
                        text: currentName,
                        color: AppColor.lightGreyColor,
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(width: 4),
                      const FontsStyle(
                        text: " - ",
                        color: AppColor.lightGreyColor,
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: FontsStyle(
                          size: 14,
                          text: desiredName,
                          color: AppColor.lightGreyColor,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
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
