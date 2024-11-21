// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// elevation: 0,
// backgroundColor: Color(0xFFBFF3DE),
// behavior: SnackBarBehavior.floating,
// duration: Duration(milliseconds: 1000),
// content: Row(
// children: [
// Icon(
// FluentIcons.checkmark_circle_16_regular,
// color: Color(0xFF29D890),
// size: 30,
// ),
// SizedBox(
// width: 10,
// ),
// fonts_style(
// text: "Success",
// color: Color(0xFF29D890),
// weight: FontWeight.w600),
// ],
// ),
// ),
// );

import 'package:flutter/material.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';
import '../../utils/style/app_color.dart';

class SnackBarSuccessWidget extends SnackBar {
  final String message;
  SnackBarSuccessWidget({super.key, required this.message})
      : super(
          elevation: 0,
          backgroundColor: AppColor.secondarySuccessColor,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1000),
          content: Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: AppColor.primarySuccessColor,
                size: 30,
              ),
              const SizedBox(width: 8),
              FontsStyle(
                  text: message,
                  color: AppColor.primarySuccessColor,
                  weight: FontWeight.w500),
            ],
          ),
        );
}

class SnackBarFailedWidget extends SnackBar {
  final String message;
  SnackBarFailedWidget({super.key, required this.message})
      : super(
          elevation: 0,
          backgroundColor: AppColor.secondaryCancelColor,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1000),
          content: Row(
            children: [
              const Icon(
                Icons.error,
                color: AppColor.primaryCancelColor,
                size: 30,
              ),
              const SizedBox(width: 8),
              FontsStyle(
                text: message,
                color: AppColor.primaryCancelColor,
                weight: FontWeight.w500,
              )
            ],
          ),
        );
}


// class SnackBarWarningWidget extends SnackBar {
//   final String message;
//   SnackBarWarningWidget({super.key, required this.message})
//       : super(
//     elevation: 0,
//           backgroundColor: AppColor.secondaryCancelColor,
//           behavior: SnackBarBehavior.floating,
//           duration: const Duration(milliseconds: 1000),
//           content: Row(
//             children: [
//               const Icon(
//                 Icons.error,
//                 color: AppColor.primaryCancelColor,
//                 size: 30,
//               ),
//               const SizedBox(width: 10),
//               FontsStyle(
//                 text: message,
//                 color: AppColor.primaryCancelColor,
//                 weight: FontWeight.w500,
//               )
//             ],
//           ),
//         );
// }
