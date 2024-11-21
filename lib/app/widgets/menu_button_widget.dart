import 'package:flutter/material.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';

import '../../utils/style/app_color.dart';

class MenuButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const MenuButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton.outlined(
          style: IconButton.styleFrom(
              // fixedSize: Size(100, 100),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white)),
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 30,
            color: AppColor.primaryBlueColor,
          ),
        ),
        const SizedBox(height: 2,),
        FontsStyle(
          text: title,
          color: const Color(0xFF707070),
          weight: FontWeight.w100,
          size: 12,
        )
      ],
    );
  }
}
