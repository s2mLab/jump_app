import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    super.key,
    required this.start,
    required this.end,
    this.strokeWidth = 3,
    this.color = Colors.black,
  });

  final Offset start;
  final Offset end;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _LinePainting(start, end, strokeWidth, color));
  }
}

class _LinePainting extends CustomPainter {
  const _LinePainting(
    this.start,
    this.end,
    this.strokeWidth,
    this.color,
  );

  final Offset start;
  final Offset end;
  final double strokeWidth;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;

    canvas.drawLine(start, end, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
