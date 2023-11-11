import 'package:flutter/material.dart';

class TimelinePainter extends CustomPainter {
  final Color lineColor;
  final Color backgroundColor;
  final bool firstElement;
  final bool lastElement;
  final Animation<double> controller;
  final Animation<double> height;

  TimelinePainter(
      {required this.lineColor,
      required this.backgroundColor,
      this.firstElement = false,
      this.lastElement = false,
      required this.controller})
      : height = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.45, 1.0, curve: Curves.ease),
          ),
        ),
        super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    _centerElementPaint(canvas, size);
  }

  void _centerElementPaint(Canvas canvas, Size size) {
    Paint lineStroke = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    if (firstElement && lastElement) {
      // Do nothing
    } else if (firstElement) {
      Offset offsetCenter = size.center(const Offset(0.0, -50.0));
      Offset offsetBottom = size.bottomCenter(const Offset(0.0, 0.0));
      Offset renderOffset = Offset(
          offsetBottom.dx, offsetBottom.dy * (0.5 + (controller.value / 2)));
      canvas.drawLine(offsetCenter, renderOffset, lineStroke);
    } else if (lastElement) {
      Offset offsetTopCenter = size.topCenter(const Offset(0.0, 0.0));
      Offset offsetCenter = size.center(const Offset(0.0, -16.0));
      Offset renderOffset =
          Offset(offsetCenter.dx, offsetCenter.dy * controller.value);
      canvas.drawLine(offsetTopCenter, renderOffset, lineStroke);
    } else {
      Offset offsetTopCenter = size.topCenter(const Offset(0.0, 0.0));
      Offset offsetBottom = size.bottomCenter(const Offset(0.0, 0.0));
      Offset renderOffset =
          Offset(offsetBottom.dx, offsetBottom.dy * controller.value);
      canvas.drawLine(offsetTopCenter, renderOffset, lineStroke);
    }

    Paint circleFill = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(size.center(const Offset(0.0, -22.0)), 8.0, circleFill);
  }

  @override
  bool shouldRepaint(TimelinePainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}
