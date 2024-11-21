import 'package:flutter/material.dart';

import '../../utils/style/app_color.dart';

class TimePickerWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const TimePickerWidget({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context,) {
    Future<void> displayTimePicker(TextEditingController controller) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      controller.text = picked!.format(context);
    }

    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter $title";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.borderSideColor),
        ),
        suffixIcon: InkWell(
          child: const Icon(
            Icons.access_time_rounded,
            size: 20,
            color: AppColor.lightGreyColor,
          ),
          onTap: () async => displayTimePicker(controller),
        ),
      ),
    );
  }
}
