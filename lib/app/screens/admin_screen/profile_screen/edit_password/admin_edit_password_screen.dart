import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../utils/style/app_color.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/fonts_style_widget.dart';
import '../../../../widgets/snackbar_widget.dart';
import '../../../../widgets/text_form_field_widget.dart';
import 'admin_edit_password_provider.dart';

class EditAdminPasswordScreenWidget extends HookConsumerWidget {
  const EditAdminPasswordScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPasswordController = TextEditingController(text: "");
    final confirmPasswordController = TextEditingController(text: "");
    const String appBarTitle = "Password";
    const String newPasswordTitleTextForm = "New password";
    const String confirmPasswordTitleTextForm = "Confirm Password";
    const String updateButton = "Update Password";
    const String warningMessage = "Passwords do not match. Please try again";
    const String warningInputPassword = "Please enter your password completely";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
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
              const FontsStyle(
                  text: newPasswordTitleTextForm,
                  color: AppColor.lightGreyColor,
                  weight: FontWeight.w100),
              PasswordTextFormFiedWidget(
                  showObscureText: true, controller: newPasswordController),
              const SizedBox(
                height: 8,
              ),
              const FontsStyle(
                  text: confirmPasswordTitleTextForm,
                  color: AppColor.lightGreyColor,
                  weight: FontWeight.w100),
              PasswordTextFormFiedWidget(
                  showObscureText: true, controller: confirmPasswordController),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      ElevatedButtonWidget(
                        title: updateButton,
                        onPressed: () {
                          bool pass = newPasswordController.text.isNotEmpty &&
                              confirmPasswordController.text.isNotEmpty;
                          if (newPasswordController.text == confirmPasswordController.text && pass) {
                            ref.read(editPasswordProvider).updatePassword(confirmPasswordController.text, context);

                          } else if (newPasswordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBarFailedWidget(message: warningInputPassword)
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBarFailedWidget(message: warningMessage)
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
