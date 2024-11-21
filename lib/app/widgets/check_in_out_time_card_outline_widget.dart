
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';

import '../../utils/style/app_color.dart';

class CheckInOutTimeCardOutlineWidget extends StatelessWidget {
  final String data;
  final String title;
  final SvgPicture icon;

  const CheckInOutTimeCardOutlineWidget({
    super.key,
    required this.data,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.only(top: 10),
      color:  AppColor.secondaryBlueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                FontsStyle(
                    text: title,
                    color: const Color(0xFF505050),
                    weight: FontWeight.w500),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            FontsStyle(
              text: data,
              color: const Color(0xFF2C3E50),
              weight: FontWeight.w500,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}



class CheckInOutTimeSmallCardOutlineWidget extends StatelessWidget {
  final String data;
  final SvgPicture icon;

  const CheckInOutTimeSmallCardOutlineWidget({
    super.key,
    required this.data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
       color:  Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 10,
                ),
                FontsStyle(
                  size: 16,
                    text:data,
                    color: const Color(0xFF505050),
                    weight: FontWeight.w500),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
