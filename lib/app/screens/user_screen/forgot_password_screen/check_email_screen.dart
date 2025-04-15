import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


// class CheckEmailScreen extends StatelessWidget {
//   const CheckEmailScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: const MyStatelessWidget(
//         title: '',
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class CheckEmailScreen extends HookConsumerWidget {
  const CheckEmailScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _formKey = GlobalKey<FormState>();

    // final emailController = useTextEditingController(text: "");

    // final passwordController = useTextEditingController(text: "");
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Text("check email "),
      ),
    );
  }
}
