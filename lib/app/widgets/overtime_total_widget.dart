import 'package:flutter/material.dart';
import '../../utils/style/app_color.dart';
import 'fonts_style_widget.dart';

class OvertimeTotalWidget extends StatelessWidget {
  final String number;

  const OvertimeTotalWidget({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
        margin: const EdgeInsets.only(top: 10),
        color: AppColor.secondaryGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: AppColor.primaryGreenColor,
            width: 1.0,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 200,),
                const FontsStyle(
                    size: 16,
                    text: "Total",
                    color: Colors.black,
                    weight: FontWeight.bold),
                FontsStyle(
                  text: number,
                  color: AppColor.primaryGreenColor,
                  weight: FontWeight.bold,
                  size: 26,
                ),
                const FontsStyle(
                    size: 14,
                    text: "hour",
                    color: AppColor.lightGreyColor,
                    weight: FontWeight.w600),
              ],
            )
        )
    );
  }
}
