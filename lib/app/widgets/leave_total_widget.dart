import 'package:flutter/material.dart';
import 'fonts_style_widget.dart';

class LeaveTotalWidget extends StatelessWidget {
  final String title;
  final String number;
  final Color primaryColor;
  final Color secondColor;

  const LeaveTotalWidget({
    super.key,
    required this.title,
    required this.primaryColor,
    required this.secondColor,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.only(top: 10),
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: secondColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FontsStyle(text: title, color: Colors.black, weight: FontWeight.w500),
                FontsStyle(
                  text: number,
                  color: secondColor,
                  weight: FontWeight.bold,
                  size: 26,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
