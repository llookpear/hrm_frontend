import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/style/app_color.dart';
import '../../../widgets/elevated_button_widget.dart';
import '../../../widgets/fonts_style_widget.dart';
import '../../../widgets/text_form_field_widget.dart';
import '../login_screen/login_screen.dart';
import 'check_email_screen.dart';
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyStatelessWidget(
        title: '',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatelessWidget extends HookConsumerWidget {
  const MyStatelessWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _formKey = GlobalKey<FormState>();

    final emailController = useTextEditingController(text: "");

    // final passwordController = useTextEditingController(text: "");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(9),
                    child:
                        const Icon(Icons.navigate_before, color: AppColor.darkGreyColor),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        FontsStyle(
                          text: "Fogot password",
                          color: AppColor.darkGreyColor,
                          weight: FontWeight.bold,
                          size: 16,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: FontsStyle(
                              text:
                                  "Please enter yor email to reset the password",
                              color: Colors.grey,
                              weight: FontWeight.w400,
                              size: 12,
                            )),

                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: FontsStyle(
                            text: 'Your Email',
                            color:AppColor.darkGreyColor,
                            weight: FontWeight.w600,
                            size: 12,
                          ),
                        ),

                        TextFormFieldWidget(controller: emailController),


                        Padding(
                          padding: const EdgeInsets.only(top:20),
                          child: Row(
                            children: [
                              ElevatedButtonWidget(
                                title: 'Reset Password',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const CheckEmailScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
