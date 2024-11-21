import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hrm_project/app/widgets/fonts_style_widget.dart';

import 'elevated_button_widget.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final Function() saveOnPressed;

  const DialogWidget({
    super.key,
    required this.title,
    required this.saveOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButtonWidget(
          onPressed: () async {
             showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: const FontsStyle(text: 'save your request', color: Colors.black, weight: FontWeight.normal),
                  title: const FontsStyle(text: 'Save', color: Colors.black, weight: FontWeight.normal),
                  actions: [
                    CupertinoButton(
                      onPressed: saveOnPressed,
                      child: const FontsStyle(text: 'Yes', color: Colors.black ,weight: FontWeight.normal),
                    ),
                    CupertinoButton(
                      child: const FontsStyle(text: 'No', color: Colors.black, weight: FontWeight.normal),
                      onPressed: () => context.pop(false),
                    ),
                  ],
                );
              },
            );
          },
          title: title,
        ),
      ],
    );
  }
}
