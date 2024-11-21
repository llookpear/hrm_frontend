import 'package:flutter/material.dart';
import 'package:hrm_project/utils/style/app_color.dart';
import '../../../models/enum.dart';

class StatusColor {
  final Color pbgColor;
  final Color pfontColor;

  StatusColor(this.pbgColor, this.pfontColor);

  static StatusColor getColors(String status) {
    Color pbgColor;
    Color pfontColor;

    if (status == StatusName.Confirm.name || status == StatusName.Success.name) {
      pbgColor = AppColor.secondarySuccessColor;
      pfontColor = AppColor.primarySuccessColor;
    }

    else if (status == StatusName.Cancel.name) {
      pbgColor = AppColor.secondaryCancelColor;
      pfontColor = AppColor.primaryCancelColor;
    }

    else if (status == StatusName.Pending.name) {
      pbgColor = AppColor.secondaryPendingColor;
      pfontColor = AppColor.primaryPendingColor;
    }

    else {
      pbgColor = AppColor.secondaryYellowColor;
      pfontColor = AppColor.primaryYellowColor;
    }

    return StatusColor(pbgColor, pfontColor);

  }

}
