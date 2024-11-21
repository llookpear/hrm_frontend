import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'class/icons.dart';
import 'fonts_style_widget.dart';

class InfoCardRequestStatus extends StatelessWidget {
  const InfoCardRequestStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: AppColor.secondaryYellowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FluentIcons.clock_16_regular,
              color:AppColor.primaryYellowColor,
            ),
            SizedBox(width: 8),
            FontsStyle(
              text: 'Please wait for manager’s approve',
              color: AppColor.primaryYellowColor,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCardConfirmStatus extends StatelessWidget {
  const InfoCardConfirmStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color:AppColor.secondarySuccessColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
             FluentIcons.checkmark_circle_16_regular,
              color:  AppColor.primarySuccessColor,
            ),
            SizedBox(width: 8),
            FontsStyle(
              text: 'Request has been successfully',
              color: AppColor.primarySuccessColor,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCardPendingStatus extends StatelessWidget {
  const InfoCardPendingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color:AppColor.secondaryPendingColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FluentIcons.clock_16_regular,
              color: AppColor.primaryPendingColor
            ),
            SizedBox(width: 8),
            FontsStyle(
              text: 'Please wait for desired user approve',
              color: AppColor.primaryPendingColor,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCardCancelStatus extends StatelessWidget {
  const InfoCardCancelStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: AppColor.secondaryCancelColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FluentIcons.dismiss_circle_16_regular,
              color: AppColor.primaryCancelColor,
            ),
            SizedBox(width: 8,),
            FontsStyle(
              text: 'Request has been denied',
              color: AppColor.primaryCancelColor,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCardWarningCheck extends StatelessWidget {
  final String data ;
  const InfoCardWarningCheck({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: AppColor.secondaryCancelColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FluentIcons.warning_16_regular,
              color: AppColor.primaryCancelColor,
              size: 30,
            ),
            const SizedBox(width: 8),
            FontsStyle(
              size: 12,
              text: 'Your location is out of range.\n Do you want to check $data ?',
              color: AppColor.primaryCancelColor,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
class InfoCardCanCheck extends StatelessWidget {
  final String data ;
  const InfoCardCanCheck({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: AppColor.secondaryGreenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FluentIcons.checkmark_circle_16_regular,
              color:  AppColor.primarySuccessColor,
            ),
            const SizedBox(width: 8),
            FontsStyle(
              size: 12,
              text: 'You may proceed to check $data',
              color:  AppColor.primarySuccessColor,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessCheckInOutCard extends StatelessWidget {
  const SuccessCheckInOutCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: AppColor.secondaryGreenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            AppIcons.checkSquareCore(),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              child: FontsStyle(
                text: 'You have successfully completed check in and check out for today',
                color: AppColor.primaryGreenColor,
                weight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String status;
  const InfoCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 'Pending':
        return const InfoCardPendingStatus();
      case 'Request':
        return const InfoCardRequestStatus();
      case 'Confirm':
        return const InfoCardConfirmStatus();
      case 'Cancel':
        return const InfoCardCancelStatus();
      default:
        return const InfoCardRequestStatus();
    }
  }
}


