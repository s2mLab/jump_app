import 'package:flutter/material.dart';

import 'line.dart';

class Floor extends StatelessWidget {
  const Floor({
    Key? key,
    required this.floor,
  }) : super(key: key);

  final double floor;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Line(
        start: Offset(0, -floor), end: Offset(w, -floor), strokeWidth: 1);
  }
}
