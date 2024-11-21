import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';

import '../../utils/style/app_color.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? btColor;
  final Color? fontColor;


  const ElevatedButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      this.btColor,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CupertinoButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(9),
            color: btColor ?? AppColor.primaryBlueColor,
            child: FontsStyle(
              size: 14,
              text: title,
              color: fontColor ?? Colors.white,
              weight: FontWeight.w600,
            )
        )
    );
  }
}
