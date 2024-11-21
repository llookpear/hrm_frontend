import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/user_screen/shift_work/shift_work_request_screen/shift_work_request_detail_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../shift_work_provider.dart';

class ShiftWorkRequestScreenWidget extends HookConsumerWidget {
  final String staffID;

  const ShiftWorkRequestScreenWidget({super.key, required this.staffID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ConvertDateTime convert = ConvertDateTime();
    var selectedDate = useState<String?>(null);
    final shiftProvider = ref.watch(shiftDetailProvider);
    final startDatecontroller = useTextEditingController();
    final showStartDateController = useTextEditingController();
    const String appBarTitle = 'Shift Work';
    const String selectDateTitleTextForm = "Select Date";
    const text = "You cannot select a weekend";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      // backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FontsStyle(
                text: selectDateTitleTextForm,
                color: AppColor.lightGreyColor,
                weight: FontWeight.w100,
                size: 14,
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: showStartDateController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: AppColor.borderSideColor
                    ),
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
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 2),
                      ).then((selectDate) {
                        if (selectDate != null &&
                            selectDate.weekday != DateTime.saturday &&
                            selectDate.weekday != DateTime.sunday) {
                          showStartDateController.text =
                              DateFormat('dd MMMM yyyy').format(selectDate);
                          startDatecontroller.text =
                              '${DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(selectDate.toUtc())}Z';
                          selectedDate.value = startDatecontroller.text;
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            elevation: 0,
                            backgroundColor: Color(0xFFFAEFEF),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 2000),
                            content: Text(
                              text,
                              style: TextStyle(
                                color: Color(0xFFC10000),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ));
                        }
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: shiftProvider.when(
                    data: (shifts) {
                      // print(shifts);
                      return Column(
                        children: shifts.where((item) =>
                                item.date == selectedDate.value &&
                                item.staffId.toString() == staffID).map((currentShift) {
                          return Column(
                            children: shifts.where((item) =>
                                    item.date == selectedDate.value &&
                                    item.staffId.toString() != staffID).map((desiredRoster) {
                              String formattedTime = convert.convertTime(desiredRoster.shiftTime);
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ShiftRequestDetailScreen(
                                              currentRoster: currentShift,
                                              desiredRoster: desiredRoster,
                                            ),
                                          ),
                                        );
                                        // print(shift.roster_id);
                                      },
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Card.outlined(
                                            // elevation: 1,
                                            color: Colors.white,
                                            surfaceTintColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(14),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FontsStyle(
                                                            text: desiredRoster.rosterId.toString(),
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
                                                                text:
                                                                    formattedTime,
                                                                color: AppColor.iconInAdminColor,
                                                                weight:
                                                                    FontWeight.w500),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              FluentIcons.people_16_regular,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            FontsStyle(
                                                                size: 16,
                                                                text: desiredRoster.fullName,
                                                                color: Colors.black,
                                                                weight:
                                                                    FontWeight.w500),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        FontsStyle(
                                                            text: desiredRoster.position,
                                                            color: AppColor.darkGreyColor,
                                                            weight: FontWeight.w500),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                        }).toList(),
                      );
                    },
                    loading: () => Center(
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                          color: AppColor.primaryYellowColor, size: 50),
                    ),
                    error: (error, stack) =>
                        Center(child: Text('Error: $error')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
