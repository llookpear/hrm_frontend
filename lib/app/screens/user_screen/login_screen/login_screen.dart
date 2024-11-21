import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../utils/style/app_color.dart';
import '../../../widgets/divider_widget.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/outline_button_widget.dart';
import '../../../widgets/text_form_field_widget.dart';
import 'login_provider.dart';

class LoginScreen extends HookConsumerWidget {
  //final String permission;
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController(text: "");
    final passwordController = TextEditingController(text: "");

    // bool is24HoursFormat = MediaQuery.of(context).alwaysUse24HourFormat;
    // print(is24HoursFormat);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo/logo.png', width: 150, height: 150),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FontsStyle(
                            text: 'Email',
                            color: AppColor.lightGreyColor,
                            weight: FontWeight.w100),
                      ],
                    ),
                    TextFormFieldWidget(controller: emailController),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FontsStyle(
                            text: 'Password',
                            color: AppColor.lightGreyColor,
                            weight: FontWeight.w100),
                      ],
                    ),
                    PasswordTextFormFiedWidget(
                        showObscureText: true,
                        controller: passwordController),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        ElevatedButtonWidget(
                          title: 'Sign in',
                          onPressed: () {
                            ref.read(loginProvider).login(
                                  emailController.text,
                                  passwordController.text,
                                  context,
                                );
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: DividerWidget(textCenter: 'OR'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: OutlineButtonWidget(
                        text: 'Login with Apple',
                        onTap: () {},
                        imgs: 'assets/images/icon/apple.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: OutlineButtonWidget(
                        text: 'Login with Google',
                        onTap: () {},
                        imgs: 'assets/images/icon/google.png',
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
