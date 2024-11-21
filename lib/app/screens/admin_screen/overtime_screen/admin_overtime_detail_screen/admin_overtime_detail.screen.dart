import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/admin_screen/overtime_screen/admin_overtime_provider.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import '../../../../../models/admin/overtime_model/overtime_model.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/approve_reject_button_widget.dart';
import '../../../../widgets/card_outline_widget.dart';
import '../../../../widgets/info_card.dart';

class AddminOvertimeDetailScreen extends HookConsumerWidget {
  final OvertimeModel item;

  const AddminOvertimeDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String appBarTitle = "Overtime Detail";
    const String dateMessage = "Date";
    const String nameMessage = "Name";
    const String timeMessage = "Time";
    const String detailMessage = "Detail";
    ConvertDateTime convert = ConvertDateTime();
    final formattedDate = convert.convertDateddMMMMyyyy(item.date);
    final formattedStartTime = convert.convertTime(item.startTime);
    final formattedEndTime = convert.convertTime(item.endTime);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () => Navigator.pop(context),
        color: AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(status: Format.statusName(item.statusID)),
              const SizedBox(height: 20),
              CardOutlineWidget(
                title: dateMessage,
                detail: formattedDate,
              ),
              const SizedBox(height: 8),
              CardOutlineWidget(
                title: nameMessage,
                detail: "${item.title}. ${item.firstname} ${item.lastname}",
              ),
              const SizedBox(height: 8),
              CardOutlineWidget(
                title: timeMessage,
                detail: "$formattedStartTime - $formattedEndTime",
              ),
              const SizedBox(height: 8),
              CardOutlineWidget(
                title: detailMessage,
                detail: item.detail,
              ),
              if (Format.statusName(item.statusID) == StatusName.Request.name) ...[
                const Spacer(),
                ApproveRejectButtonWidget(
                  onPressedReject: () async {
                    Navigator.pop(context);
                    await ref.read(allOvertimeProvider).approveOvertime(
                      item.otID.toString(),
                      Format.statusID(StatusName.Cancel).toString(),
                      context,
                    );
                  },
                  onPressedApprove: () async {
                    Navigator.pop(context);
                    await ref.read(allOvertimeProvider).approveOvertime(
                      item.otID.toString(),
                      Format.statusID(StatusName.Confirm).toString(),
                      context,
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
