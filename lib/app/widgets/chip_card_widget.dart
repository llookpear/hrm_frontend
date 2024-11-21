
import 'package:flutter/material.dart';

class ChipCardWidget extends StatelessWidget {
  final Color bgColor;
  final Color fontColor;
  final String status;

  const ChipCardWidget({
    super.key,
    required this.bgColor,
    required this.fontColor,
    required this.status,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation : 0,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: bgColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Text(
          status,
          style: TextStyle(
            color: fontColor,
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
