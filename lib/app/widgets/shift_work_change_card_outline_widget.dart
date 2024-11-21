import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class ShiftWorkChangeCardOutlineWidget extends StatelessWidget {
  final String shiftTime;
  final String fullname;
  final String position;
  final String department;
  final String rosterId;

  const ShiftWorkChangeCardOutlineWidget({
    super.key,
    required this.shiftTime,
    required this.fullname,
    required this.position,
    required this.department,
    required this.rosterId,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontsStyle(
                      text: rosterId,
                      color: AppColor.lightGreyColor,
                      weight: FontWeight.w500),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        FluentIcons.clock_16_regular,
                        color: AppColor.iconInAdminColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      FontsStyle(
                          size: 20,
                          text: shiftTime,
                          color: AppColor.iconInAdminColor,
                          weight: FontWeight.w500),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Icon(
                        FluentIcons.people_16_regular,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      FontsStyle(
                          size: 16,
                          text: fullname,
                          color: Colors.black,
                          weight: FontWeight.w500),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  FontsStyle(
                      text: position,
                      color: AppColor.darkGreyColor,
                      weight: FontWeight.w500),
                  const SizedBox(
                    height: 4,
                  ),
                  FontsStyle(
                      text: department,
                      color: AppColor.darkGreyColor,
                      weight: FontWeight.w500),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
