import 'package:flutter/material.dart';

import 'line.dart';

class Floor extends StatelessWidget {
  const Floor({
    super.key,
    required this.floor,
  });

  final double floor;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Line(
        start: Offset(0, -floor), end: Offset(w, -floor), strokeWidth: 1);
  }
}
