import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class ElevatedIconButtonWidget extends StatelessWidget {
  final String title;
  final SvgPicture icon;
  final Color buttonColor;
  final Color buttonBorderSideColor;
  final Function() onPressed;

  const ElevatedIconButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon,
      required this.buttonColor,
      required this.buttonBorderSideColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: buttonBorderSideColor),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 20,
          ),
          FontsStyle(
            text: title,
            color: AppColor.darkGreyColor,
            weight: FontWeight.w200,
          ),
        ],
      ),
    );
  }
}

class ElevatedIconButtonSmallWidget extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const ElevatedIconButtonSmallWidget({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: const Icon(
        FluentIcons.document_16_regular,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
