import 'package:flutter/material.dart';

import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class DividerWidget extends StatelessWidget {
  final String  textCenter;

  const DividerWidget(
      {super.key,
       required this.textCenter,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
            color: AppColor.dividerColor
        )),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: FontsStyle(
              text: textCenter, color:AppColor.dividerColor, weight: FontWeight.w100),
        ),
        const Expanded(
            child: Divider(
          color: AppColor.dividerColor
        )),
      ],
    );
  }
}
