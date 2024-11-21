import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/class/convert_datetime_number.dart';
import 'package:hrm_project/app/widgets/text_form_field_widget.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/dialog_widget.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/time_picker_widget.dart';
import '../overtime_provider.dart';

class OvertimeRequestScreenWidget extends HookConsumerWidget {
  const OvertimeRequestScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = TextEditingController();
    final dateShowController = TextEditingController();
    final startTimeController = TextEditingController();
    final endTimeController = TextEditingController();
    final detailController = TextEditingController();

    ConvertDateTime convert = ConvertDateTime();
    const String appBarTitle = 'Overtime Request';
    const String dateTitleTextForm = "Date";
    const String startTimeTitleTextForm = "Start Time";
    const String endTimeTitleTextForm = "End Time";
    const String detailTitleTextForm = "Detail";
    const String saveButton = "Save";
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: AppColor.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FontsStyle(
                  text: dateTitleTextForm,
                  color: AppColor.lightGreyColor,
                  weight: FontWeight.w100,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                       return "Please Enter Date";
                    }
                    return null;
                  },
                  controller: dateShowController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColor.borderSideColor),
                    ),
                    suffixIcon: InkWell(
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        size: 20,
                        color: AppColor.lightGreyColor,
                      ),
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2015),
                          lastDate: DateTime(DateTime.now().year + 2),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                            dateShowController.text = convert.convertDateddMMMMyyyy(selectedDate.toString());
                          }
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FontsStyle(
                            text: startTimeTitleTextForm,
                            color: AppColor.lightGreyColor,
                            weight: FontWeight.w100,
                          ),
                          const SizedBox(height: 5),
                          TimePickerWidget(
                            controller: startTimeController,
                            title:startTimeTitleTextForm
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text("-")],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FontsStyle(
                            text: endTimeTitleTextForm,
                            color: AppColor.lightGreyColor,
                            weight: FontWeight.w100,
                          ),
                          const SizedBox(height: 4),
                          TimePickerWidget(
                            controller: endTimeController,
                            title:endTimeTitleTextForm
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const FontsStyle(
                  text: detailTitleTextForm,
                  color: AppColor.lightGreyColor,
                  weight: FontWeight.w100,
                ),
                TextFormFieldWidget(
                  controller: detailController,
                ),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                      DialogWidget(
                        title: saveButton,
                        saveOnPressed: () {

                          Navigator.pop(context);
                          if (formKey.currentState?.validate() ?? false) {

                            final startTimeString = startTimeController.text;
                            final endTimeString = endTimeController.text;
                            final parseStartTime =  ConvertDateTime.parseTime(startTimeString);
                            final parseEndTime =  ConvertDateTime.parseTime(endTimeString);
                            final startTime = DateFormat('HH:mm:ss').format(parseStartTime!);
                            final endTime = DateFormat('HH:mm:ss').format(parseEndTime!);
                            final difference = parseEndTime.difference(parseStartTime);
                            final hours = difference.inHours;


                            ref.watch(overtimeProvider).overtimeRequest(
                                Format.statusID(StatusName.Request),
                                hours.toString(),
                                dateController.text,
                                startTime,
                                endTime,
                                detailController.text,
                                context);
                          }
                        },
                      ),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
///v1
// DateTime? _parseTime(String timeString) {
//   final now = DateTime.now();
//   try {
//     final parts = timeString.split(':');
//     if (parts.length == 2) {
//       final hours = int.parse(parts[0]);
//       final minutes = int.parse(parts[1]);
//       return DateTime(now.year, now.month, now.day, hours, minutes);
//     }
//   } catch (e) {
//     return null;
//   }
//   return null;
// }
///v2
// DateTime? _parseTime(String timeString) {
//   final now = DateTime.now();
//
//   timeString = timeString.trim().toLowerCase();
//   bool isPm = timeString.endsWith('pm');
//   bool isAm = timeString.endsWith('am');
//   timeString = timeString.replaceAll('am', '').replaceAll('pm', '').trim();
//
//   final parts = timeString.split(':');
//   if (parts.length == 2) {
//     int hours = int.parse(parts[0]);
//     final minutes = int.parse(parts[1]);
//
//     if (isPm && hours < 12) {
//       hours += 12;
//     } else if (isAm && hours == 12) {
//       hours = 0;
//     }
//     return DateTime(now.year, now.month, now.day, hours, minutes);
//   }
//
//   return null;
// }
