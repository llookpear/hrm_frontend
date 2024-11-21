import 'package:flutter/material.dart';

import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final String imgs;

  const OutlineButtonWidget(
      {super.key, required this.text, required this.onTap, required this.imgs});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(400, 45),
       side: const BorderSide(color: AppColor.borderSideColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      onPressed:
        onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgs,
            width: 25,
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: FontsStyle(
              text: text,
              color: Colors.black,
              weight: FontWeight.w500,
            ),
          )
        ],
      )

    );
  }
}
