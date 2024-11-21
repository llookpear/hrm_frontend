import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import '../../../../../models/user/overtime/overtime_history_model/overtime_history_model.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/card_outline_widget.dart';
import '../../../../widgets/info_card.dart';

class OvertimeDetailScreen extends HookConsumerWidget {
  final OvertimeHistoryModel item;

  const OvertimeDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convert = ConvertDateTime();
    const String appBarTitle = 'Overtime Detail';
    const String dateTitleTextForm = "Date";
    const String timeTitleTextForm = "Time";
    const String detailTitleTextForm = "Detail";
    const String approvedByTitleTextForm = "Approved by";
    final formattedDate = convert.convertDateDdMmYyyy(item.date);
    final formattedStartTime = convert.convertTime(item.startTime);
    final formattedEndTime = convert.convertTime(item.endTime);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCard(status: Format.statusName(item.statusID)),
                const SizedBox(height: 8),
                CardOutlineWidget(
                    title: dateTitleTextForm, detail: formattedDate),
                const SizedBox(height: 8),
                CardOutlineWidget(
                    title: timeTitleTextForm,
                    detail: "$formattedStartTime - $formattedEndTime"),
                const SizedBox(height: 8),
                CardOutlineWidget(
                  title: detailTitleTextForm,
                  detail: item.detail.toString(),
                ),
                const SizedBox(height: 8),
                CardOutlineWidget(
                  title: approvedByTitleTextForm,
                  detail: item.approvedBy.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
