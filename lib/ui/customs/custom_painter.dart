import 'package:flutter/material.dart';

class MyCustomPaint extends CustomPainter {
  final bool isDisabled;
  final double height;

  MyCustomPaint({this.isDisabled = false, this.height});
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = isDisabled == true ? Color(0xFFdddddd) : Color(0xFF679882)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var offSide = height - 25;

    // 120

    canvas.drawLine(Offset(0, -offSide), Offset(0, 0), paintLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
