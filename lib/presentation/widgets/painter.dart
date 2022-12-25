import 'package:flutter/material.dart';
import 'package:woodul/presentation/styles/colors.dart';

class MyPainter extends CustomPainter {
  final bool down;
  MyPainter({
    required this.down,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = white;
    for (int i = 0; i < 10; i++) {
      if (i * 80 < size.width) {
        canvas.drawRRect(
            RRect.fromRectAndCorners(
                Rect.fromCenter(
                    center: Offset(
                        down ? i * 80.0 : 40 + (i * 80.0), size.height / 2),
                    width: 40,
                    height: size.height),
                topLeft: const Radius.circular(30),
                topRight: const Radius.circular(30)),
            paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
