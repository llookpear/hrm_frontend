import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/widgets/time_picker_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../models/enum.dart';
import '../../../../../utils/format.dart';
import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/class/convert_datetime_number.dart';
import '../../../../widgets/dialog_widget.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/snackbar_widget.dart';
import '../../../../widgets/text_form_field_widget.dart';
import '../leave_provider.dart';
import 'leave_request_provider.dart';
import 'package:image_picker/image_picker.dart';

class LeaveRequestScreenWidget extends HookConsumerWidget {
  const LeaveRequestScreenWidget({super.key});

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    int totalDays = 0;
    for (DateTime date = from;
    date.isBefore(to) || date.isAtSameMomentAs(to);
    date = date.add(const Duration(days: 1))) {
      if (date.weekday != DateTime.saturday &&
          date.weekday != DateTime.sunday) {
        totalDays++;
      }
    }
    return totalDays;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLeaveTestDetail = ref.watch(leavetypeProvider);
    final selectedLeave = useState<String?>(null);
    final typeLeavecontroller = useTextEditingController();
    final startDatecontroller = useTextEditingController();
    final endDatecontroller = useTextEditingController();
    final startTimecontroller = useTextEditingController();
    final endTimecontroller = useTextEditingController();
    final detailController = useTextEditingController();
    final showStartDateController = useTextEditingController();
    final showEndDateController = useTextEditingController();

    final pickedImage = useState<XFile?>(null);
    final pickedFile = useState<PlatformFile?>(null);

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    const String appBarTitle = "Leave Request";
    const String typeTitleTextForm = "Type Of Leave";
    const String startDateTitleTextForm = "Start Date";
    const String endDateTitleTextForm = "End Date";
    const String startTimeTitleTextForm = "Start Time";
    const String endTimeTitleTextForm = "End Time";
    const String detailTitleTextForm = "Detail";
    const String saveButton = "Save";
    const String noSelect = "Please Select";
    const String warningSelectDate = "Please select a weekday";

    final List typeOfLeave = [];
    asyncLeaveTestDetail.when(
      data: (data) {
        typeOfLeave.addAll(data);
      },
      loading: () =>
          Center(
            child: LoadingAnimationWidget.horizontalRotatingDots(
                color: AppColor.primaryYellowColor, size: 50),
          ),
      error: (error, stack) => Text('Error: $error'),
    );

    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBarWidget(
            title: appBarTitle,
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColor.backgroundColor),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FontsStyle(
                  text: typeTitleTextForm,
                  color: AppColor.lightGreyColor,
                  weight: FontWeight.w100,
                ),
                const SizedBox(height: 4),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        value: selectedLeave.value,
                        onChanged: (newValue) {
                          selectedLeave.value = newValue;
                          typeLeavecontroller.text = newValue.toString();
                        },
                        items: typeOfLeave.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.msleave_id.toString(),
                            child: FontsStyle(
                              text: item.type,
                              color: Colors.black,
                              weight: FontWeight.normal,
                            ),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Type Of Leave";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const FontsStyle(
                        text: startDateTitleTextForm,
                        color: AppColor.lightGreyColor,
                        weight: FontWeight.w500,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // return "Please enter start date";
                            return "Please Enter Start Date";
                          }
                          return null;
                        },
                        controller: showStartDateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColor.borderSideColor),
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
                                lastDate: DateTime(DateTime
                                    .now()
                                    .year + 2),
                              ).then((selectedDate) {
                                if (selectedDate != null &&
                                    selectedDate.weekday != DateTime.saturday &&
                                    selectedDate.weekday != DateTime.sunday) {
                                  startDate = selectedDate;
                                  startDatecontroller.text =
                                      DateFormat('yyyy-MM-dd').format(
                                          selectedDate);
                                  showStartDateController.text =
                                      DateFormat('dd MMMM yyyy').format(
                                          selectedDate);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBarFailedWidget(
                                    message: warningSelectDate,
                                  ));
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const FontsStyle(
                        text: endDateTitleTextForm,
                        color: AppColor.lightGreyColor,
                        weight: FontWeight.w100,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // return "Please enter end date";
                            return "Please Enter End Date";
                          }
                          return null;
                        },
                        controller: showEndDateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: AppColor.borderSideColor),
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
                                lastDate: DateTime(DateTime
                                    .now()
                                    .year + 2),
                              ).then((selectedDate) {
                                if (selectedDate != null &&
                                    selectedDate.weekday != DateTime.saturday &&
                                    selectedDate.weekday != DateTime.sunday &&
                                    (selectedDate.isAtSameMomentAs(startDate) ||
                                        selectedDate.isAfter(startDate))) {
                                  endDate = selectedDate;
                                  endDatecontroller.text =
                                      DateFormat('yyyy-MM-dd').format(
                                          selectedDate);
                                  showEndDateController.text =
                                      DateFormat('dd MMMM yyyy').format(
                                          selectedDate);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBarFailedWidget(
                                        message: warningSelectDate,
                                      ));
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
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
                                TimePickerWidget(
                                    controller: startTimecontroller,
                                    title: startTimeTitleTextForm
                                ),


                              ],

                            ),
                          ),

                          const SizedBox(
                            width: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.darkGreyColor,
                                  ),
                                )
                              ],
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
                                TimePickerWidget(
                                    controller: endTimecontroller,
                                    title: endTimeTitleTextForm
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const FontsStyle(
                        text: detailTitleTextForm,
                        color: AppColor.lightGreyColor,
                        weight: FontWeight.w100,
                      ),
                      TextFormFieldWidget(controller: detailController),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),


                const SizedBox(
                  height: 20,
                ),


                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(5, 5),
                        backgroundColor: AppColor.primaryBlueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          isDismissible: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return Wrap(
                              children: <Widget>[
                                ListTile(
                                  splashColor: Colors.transparent,
                                  leading: const Icon(
                                    Icons.image,
                                    color: AppColor.lightGreyColor,
                                  ),
                                  title: const FontsStyle(
                                    text: "Select Image",
                                    color: AppColor.darkGreyColor,
                                    weight: FontWeight.normal,
                                    size: 14,
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    final image = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (image != null) {
                                      pickedImage.value = image;
                                    }
                                  },
                                ),
                                ListTile(
                                  splashColor: Colors.transparent,
                                  leading: const Icon(
                                    Icons.attach_file_sharp,
                                    color: AppColor.lightGreyColor,
                                  ),
                                  title: const FontsStyle(
                                    text: "Select File",
                                    color: AppColor.darkGreyColor,
                                    weight: FontWeight.normal,
                                    size: 14,
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                      allowMultiple: false,
                                      type: FileType.any,
                                    );
                                    if (result != null) {
                                      PlatformFile file = result.files.first;
                                      pickedFile.value = file;
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 80,
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(
                        FluentIcons.document_add_20_regular,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    pickedImage.value != null
                        ? Stack(clipBehavior: Clip.none, children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          File(pickedImage.value!.path),
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: -20,
                        right: -15,
                        child: IconButton(
                          icon: const Icon(
                            size: 24,
                            Icons.cancel,
                            color: AppColor.primaryCancelColor,
                          ),
                          onPressed: () {
                            pickedImage.value = null;
                          },
                        ),
                      ),
                    ])
                        : pickedFile.value != null
                        ? Stack(clipBehavior: Clip.none, children: [
                      Card(
                        elevation: 0.5,
                        shadowColor: Colors.white,
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: FontsStyle(
                              text: pickedFile.value!.name,
                              color: AppColor.darkGreyColor,
                              weight: FontWeight.normal),
                        ),
                      ),
                      Positioned(
                        top: -20,
                        right: -20,
                        child: IconButton(
                          icon: const Icon(
                            size: 24,
                            Icons.cancel,
                            color: AppColor.primaryCancelColor,
                          ),
                          onPressed: () {
                            pickedFile.value = null;
                          },
                        ),
                      ),
                    ])
                        : const FontsStyle(
                        text: noSelect,
                        color: AppColor.darkGreyColor,
                        weight: FontWeight.normal),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DialogWidget(
                        title: saveButton,
                        saveOnPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final startTimeString = startTimecontroller.text;
                            final endTimeString = endTimecontroller.text;
                            final parseStartTime = ConvertDateTime.parseTime(
                                startTimeString);
                            final parseEndTime = ConvertDateTime.parseTime(
                                endTimeString);
                            final startTime = DateFormat('HH:mm:ss').format(
                                parseStartTime!);
                            final endTime = DateFormat('HH:mm:ss').format(
                                parseEndTime!);
                            if (pickedFile.value != null) {
                              ref.watch(leaveRequestProvider).leaveRequestFile(
                                typeLeavecontroller.text,
                                Format.statusID(StatusName.Request),
                                startDatecontroller.text,
                                endDatecontroller.text,
                                startTime,
                                endTime,
                                daysBetween(startDate, endDate),
                                detailController.text,
                                pickedFile.value,
                                context,
                              );
                            } else if (pickedImage.value != null) {
                              ref.watch(leaveRequestProvider).leaveRequestImage(
                                typeLeavecontroller.text,
                                Format.statusID(StatusName.Request),
                                startDatecontroller.text,
                                endDatecontroller.text,
                                startTime,
                                endTime,
                                daysBetween(startDate, endDate),
                                detailController.text,
                                pickedImage.value,
                                context,
                              );
                            }
                            else {
                              ref.watch(leaveRequestProvider).leaveRequest(
                                typeLeavecontroller.text,
                                Format.statusID(StatusName.Request),
                                startDatecontroller.text,
                                endDatecontroller.text,
                                startTime,
                                endTime,
                                daysBetween(startDate, endDate),
                                detailController.text,
                                context,
                              );
                            }
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// DateTime? _parseTime(String timeString) {
//   final now = DateTime.now();
//
//     timeString = timeString.trim().toLowerCase();
//     bool isPm = timeString.endsWith('pm');
//     bool isAm = timeString.endsWith('am');
//     timeString = timeString.replaceAll('am', '').replaceAll('pm', '').trim();
//
//     final parts = timeString.split(':');
//     if (parts.length == 2) {
//       int hours = int.parse(parts[0]);
//       final minutes = int.parse(parts[1]);
//
//       if (isPm && hours < 12) {
//         hours += 12;
//       } else if (isAm && hours == 12) {
//         hours = 0;
//       }
//       return DateTime(now.year, now.month, now.day, hours, minutes);
//     }
//
//   return null;
// }

