import 'package:flutter/material.dart';

import 'helpers.dart';

class DoubleHeadsArrow extends StatelessWidget {
  const DoubleHeadsArrow({
    this.title,
    super.key,
    required this.start,
    required this.end,
    required this.headSize,
    this.strokeWidth = 3,
    this.fontSize,
    this.color = Colors.black,
  });

  final String? title;
  final Offset start;
  final Offset end;
  final double headSize;
  final double strokeWidth;
  final double? fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          if (title != null)
            Positioned(
              left: start.dx,
              right: deviceSize.width - end.dx,
              bottom: -(start.dy + end.dy) / 2 + deviceSize.height * 0.01,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: fontSize),
                ),
              ),
            ),
          CustomPaint(
              painter: _DoubleHeadsArrowPainting(
                  start, end, headSize, strokeWidth, color)),
        ],
      ),
    );
  }
}

class _DoubleHeadsArrowPainting extends CustomPainter {
  const _DoubleHeadsArrowPainting(
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
    canvas.drawPath(arrowHeadPath(start, end, headSize), painter);
    canvas.drawPath(arrowHeadPath(end, start, headSize), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
