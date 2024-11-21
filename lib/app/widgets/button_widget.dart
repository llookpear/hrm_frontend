import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/style/app_color.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final SvgPicture? preIcon;
  final IconData? sufiIcon;
  final Function() onPressed;

  const ButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      this.preIcon,
      this.sufiIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    preIcon!,
                    const SizedBox(width: 14),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.darkGreyColor,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                Icon(
                  sufiIcon,
                  color: AppColor.darkGreyColor,
                  size: 16,
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
