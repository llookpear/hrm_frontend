
import 'package:flutter/material.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';

import '../../utils/style/app_color.dart';

class CheckInOutTimeWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const CheckInOutTimeWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: Colors.white,
      child: SizedBox(
        width: 140,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFF9BD5FF),
            ),
            const SizedBox(width: 4),
            FontsStyle(
                text: title, color: AppColor.darkGreyColor, weight: FontWeight.w100)
          ],
        ),
      ),
    );
  }
}
