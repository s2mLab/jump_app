import 'dart:math';

import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/locale_text.dart';

class TotalRotation extends StatelessWidget {
  const TotalRotation({
    Key? key,
    required this.position,
    required this.fontSize,
  }) : super(key: key);

  final Offset position;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final biomechanics = Biomechanics.of(context, listen: true);
    const color = Color.fromARGB(255, 31, 120, 165);
    final texts = LocaleText.of(context);

    return Positioned(
      left: position.dx,
      bottom: -position.dy,
      child: Container(
        decoration: BoxDecoration(color: color.withAlpha(30)),
        padding: const EdgeInsets.all(2),
        child: Text(
          '${texts.rotation} = ${(biomechanics.finalRotation * 180 / pi).toStringAsFixed(0)}°',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
