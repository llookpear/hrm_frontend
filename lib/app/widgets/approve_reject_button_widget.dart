import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'elevated_button_widget.dart';

class ApproveRejectButtonWidget extends StatelessWidget {
  final Function() onPressedReject;
  final Function() onPressedApprove;

  const ApproveRejectButtonWidget({
    super.key,
    required this.onPressedReject,
    required this.onPressedApprove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButtonWidget(
          btColor: const Color(0xFFEFEFEF),
          fontColor: const Color(0xFF979797),
          title: 'Reject',
          onPressed: onPressedReject,
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButtonWidget(
          btColor: AppColor.secondarySuccessColor,
          fontColor:  AppColor.primarySuccessColor,
          title: 'Approve',
          onPressed: onPressedApprove,
        ),
      ],
    );
  }
}
