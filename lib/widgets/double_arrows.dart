import 'package:flutter/material.dart';

import 'helpers.dart';

class DoubleArrows extends StatelessWidget {
  const DoubleArrows({
    super.key,
    required this.start,
    required this.end,
    required this.tipSize,
    this.strokeWidth = 3,
    this.color = Colors.black,
  });

  final Offset start;
  final Offset end;
  final double tipSize;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter:
            _DoubleArrowsPainting(start, end, tipSize, strokeWidth, color));
  }
}

class _DoubleArrowsPainting extends CustomPainter {
  const _DoubleArrowsPainting(
    this.start,
    this.end,
    this.headSize,
    this.strokeWidth,
    this.color,
  );

  final Offset start;
  final Offset end;
  final double headSize;
  final double strokeWidth;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth;

    canvas.drawLine(start, end, painter);
    canvas.drawPath(arrowTipPath(start, end, headSize), painter);
    canvas.drawPath(arrowTipPath(end, start, headSize), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
