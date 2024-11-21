import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class CardOutlineWidget extends StatelessWidget {
  final String title;
  final String detail;

  const CardOutlineWidget({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
      FontsStyle(text: " $title", color: AppColor.lightGreyColor, weight: FontWeight.w100),
      Card.outlined(
        borderOnForeground: false,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color:AppColor.borderSideColor),
        ),
        child: ListTile(
          title:FontsStyle(text: detail , color: AppColor.darkGreyColor, weight: FontWeight.normal),
        ),
      ),
    ]);
  }
}
