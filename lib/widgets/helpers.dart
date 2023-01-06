import 'dart:math';

import 'package:flutter/material.dart';

Path arrowHeadPath(Offset p1, Offset p2, double headSize) {
  final dX = p2.dx - p1.dx;
  final dY = p2.dy - p1.dy;
  final angle = atan2(dY, dX);
  const arrowAngle = 20 * pi / 180;
  final path = Path();
  path.moveTo(p2.dx - headSize * cos(angle - arrowAngle),
      p2.dy - headSize * sin(angle - arrowAngle));
  path.lineTo(p2.dx, p2.dy);
  path.lineTo(p2.dx - headSize * cos(angle + arrowAngle),
      p2.dy - headSize * sin(angle + arrowAngle));
  path.close();
  return path;
}
