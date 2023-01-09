import 'package:flutter/material.dart';

import '../providers/biomechanics.dart';
import 'value_picker.dart';

class PushoffSlider extends StatelessWidget {
  const PushoffSlider({
    super.key,
    required this.color,
    required this.position,
    required this.textSize,
    required this.width,
  });

  final Color color;
  final Offset position;
  final double textSize;
  final double width;

  void _updatePushoffTime(BuildContext context, double value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.pushoffTime = value;
  }

  @override
  Widget build(BuildContext context) {
    final biomechanics = Biomechanics.of(context);

    return ValuePicker.horizontal(
      min: 150,
      max: 450,
      initial: biomechanics.pushoffTime,
      position: position,
      width: width,
      color: color,
      textSize: textSize,
      unit: 'ms',
      precision: 0,
      onValueChanged: (value) => _updatePushoffTime(context, value),
    );
  }
}
