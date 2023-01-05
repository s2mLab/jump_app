import 'package:flutter/material.dart';

class CenterOfMass extends StatelessWidget {
  const CenterOfMass(
    this.position, {
    super.key,
    required this.radius,
  });

  final Offset position;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _CenterOfMassPainting(position, radius));
  }
}

class _CenterOfMassPainting extends CustomPainter {
  const _CenterOfMassPainting(this.position, this.radius);

  final Offset position;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = const Color(0xff63aa65)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    canvas.drawCircle(position, radius, painter);
    canvas.drawLine(position, Offset(position.dx, 0), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
