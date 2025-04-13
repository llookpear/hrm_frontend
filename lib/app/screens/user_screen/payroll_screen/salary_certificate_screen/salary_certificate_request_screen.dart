import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hrm_project/app/screens/user_screen/payroll_screen/salary_certificate_screen/salary_certificate_provider.dart';

import '../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/dialog_widget.dart';
import '../../../../widgets/fonts_style_widget.dart';

class SalaryCertificateRequestScreenWidget extends HookConsumerWidget {
  const SalaryCertificateRequestScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateController = TextEditingController(text: "");
    final date = TextEditingController(text: "");
    const String appBarTitle = "Certificate Request";
    const String dateTitleTextForm = "Date";
    const String saveButton = 'Save';
    final keyForm = useMemoized(GlobalKey<FormState>.new);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: appBarTitle,
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            const FontsStyle(
              text: dateTitleTextForm,
              color: AppColor.lightGreyColor,
              weight: FontWeight.w100,
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: Form(
                key: keyForm,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Date";
                    }
                    return null;
                  },
                  controller: date,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: AppColor.borderSideColor),
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
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            date.text = DateFormat('dd MMMM yyyy').format(selectedDate);
                            dateController.text = selectedDate.toString();
                          }
                          // else {
                          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          //       elevation: 0,
                          //       backgroundColor: AppColor.secondaryCancelColor,
                          //       behavior: SnackBarBehavior.floating,
                          //       duration: Duration(milliseconds: 2000),
                          //       content: Text(
                          //       warningText,
                          //       style: TextStyle(
                          //         color: AppColor.primaryCancelColor,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //   ));
                          // }
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogWidget(
                  title: saveButton,
                  saveOnPressed: () {
                    Navigator.pop(context);
                    if (keyForm.currentState?.validate() ?? false) {
                      ref.watch(salaryCertificateProvider).salaryCertificate(dateController.text, context);
                    }
                  },
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
