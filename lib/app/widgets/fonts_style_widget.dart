import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FontsStyle extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;
  final double? size;

  const FontsStyle({
    super.key,
    required this.text,
    required this.color,
    required this.weight,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(

        style: TextStyle(
          overflow: TextOverflow.fade,
          fontFamily: 'Poppins',
          color: color,
          fontWeight: weight,
          fontSize: size,
          letterSpacing: 0.2,
          height: 1.5,
        ),
        text);
  }
}
