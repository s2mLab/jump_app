import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

import '/providers/jump_app_theme.dart';

class AirboneTrajectory extends StatelessWidget {
  const AirboneTrajectory({
    super.key,
    required this.start,
    required this.end,
    required this.height,
  });

  final Offset start;
  final Offset end;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = JumpAppTheme.of(context);

    return CustomPaint(
        painter: _AirboneTrajectoryPainting(
            start, end, height, theme.colorAirborneTrajectory));
  }
}

class _AirboneTrajectoryPainting extends CustomPainter {
  const _AirboneTrajectoryPainting(
      this.start, this.end, this.height, this.color);

  final Offset start;
  final Offset end;
  final double height;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    // With quad bezier curve, the desired height is twice the control point
    // This could be changed with actual quadratic path at some point though
    // (this will probably be necessary when initial and final height won't
    // be the same)
    Path path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(
        (start.dx + end.dx) / 2,
        (start.dy + end.dy) / 2 - 2 * height,
        end.dx,
        end.dy,
      );

    final painter = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = 3;

    canvas.drawPath(
        dashPath(path, dashArray: CircularIntervalList([15, 10])), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
