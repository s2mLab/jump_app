import 'package:flutter/material.dart';

import '/providers/parameters.dart';
import 'value_picker.dart';

class PushofSlider extends StatelessWidget {
  const PushofSlider({
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
    final data = Parameters.of(context);
    data.pushoffTime = value;
  }

  @override
  Widget build(BuildContext context) {
    final data = Parameters.of(context);

    return ValuePicker(
      min: 150,
      max: 450,
      initial: data.pushoffTime,
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
