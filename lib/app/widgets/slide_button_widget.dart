import 'package:flutter/material.dart';
import 'fonts_style_widget.dart';

class SlideButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String typeCheck;

  const SlideButton({
    super.key,
    required this.onPressed,
    required this.typeCheck,
  });

  @override
  _SlideButtonState createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {
  double _dragPosition = 10;
  String swipeMessage = "Swipe To Check";

  @override
  Widget build(BuildContext context) {
    double widthDrag = 50;
    double screenWidth = MediaQuery.of(context).size.width - 48;

    /// 48 มาจาก padding 2 ฝั่งของหน้าที่ใช้ SlideButton คือ 24+24

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: screenWidth,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: FontsStyle(
              text: "$swipeMessage ${widget.typeCheck}",
              color: Colors.white,
              weight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          left: _dragPosition,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                double newPosition = _dragPosition + details.delta.dx;
                double maxPosition = screenWidth - widthDrag;
                if (newPosition < 0) {
                  newPosition = 0;
                } else if (newPosition > maxPosition) {
                  newPosition = maxPosition;
                }
                _dragPosition = newPosition;
              });
            },
            onHorizontalDragEnd: (details) {
              double maxPosition = screenWidth - widthDrag;
              if (_dragPosition >= maxPosition) {
                setState(() {
                });
                widget.onPressed();
              } else {
                setState(() {
                  _dragPosition = 0;
                });
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.arrow_forward, color: Colors.blue),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
