import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final bool? showObscureText;
  final bool? readOnly;
  final Color? textColor;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText,
    this.showObscureText,
    this.readOnly,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontFamily: 'Poppins', color: textColor),
      readOnly: readOnly ?? false,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        hintText: hintText,
        hintStyle: const TextStyle(fontFamily: 'Poppins'),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.borderSideColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.borderSideColor),
        ),
      ),
    );
  }
}

class PasswordTextFormFiedWidget extends StatefulWidget {
  final TextEditingController? controller;
  final bool? showObscureText;

  const PasswordTextFormFiedWidget({
    super.key,
    this.controller,
    this.showObscureText,
  });

  @override
  _PasswordTextFormFiedWidget createState() => _PasswordTextFormFiedWidget();
}

class _PasswordTextFormFiedWidget extends State<PasswordTextFormFiedWidget> {
  bool obscureText = true;

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontFamily: 'Poppins '),
      controller: widget.controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        suffixIcon: widget.showObscureText ?? false
            ? IconButton(
                onPressed: _toggle,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColor.borderSideColor,
                ),
              )
            : null,

        // hintText: widget.hintText,
        // hintStyle: const TextStyle(fontFamily: 'Poppins'),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   borderSide: const BorderSide(color: AppColor.borderSideColor),
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.borderSideColor),
        ),
      ),
    );
  }
}
