import 'package:flutter/material.dart';

import 'helpers.dart';

class Arrow extends StatelessWidget {
  const Arrow({
    required this.start,
    required this.end,
    required this.headSize,
    this.color = Colors.black,
    super.key,
  });

  final Offset start;
  final Offset end;
  final double headSize;
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
          CustomPaint(painter: _ArrowsPainting(start, end, headSize, color))
        ],
      ),
    );
  }
}

class _ArrowsPainting extends CustomPainter {
  const _ArrowsPainting(this.start, this.end, this.headSize, this.color);

  final Color color;
  final Offset start;
  final Offset end;
  final double headSize;

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    canvas.drawLine(start, end, painter);
    canvas.drawPath(arrowHeadPath(start, end, headSize), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
