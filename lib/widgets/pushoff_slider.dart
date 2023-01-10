import 'package:flutter/material.dart';

import '/providers/locale_text.dart';
import '/providers/biomechanics.dart';
import 'value_picker.dart';

class PushoffSlider extends StatelessWidget {
  const PushoffSlider({
    super.key,
    required this.color,
    required this.position,
    required this.fontSize,
    required this.width,
  });

  final Color color;
  final Offset position;
  final double fontSize;
  final double width;

  void _updatePushoffTime(BuildContext context, double value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.pushoffTime = value / 1000;
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final biomechanics = Biomechanics.of(context);

    return ValuePicker.horizontal(
      min: 150,
      max: 450,
      initial: biomechanics.pushoffTime * 1000,
      position: position,
      width: width,
      color: color,
      fontSize: fontSize,
      unit: 'ms',
      precision: 0,
      onValueChanged: (value) => _updatePushoffTime(context, value),
      tooltip: texts.pushoffPhaseLengthTooltip,
    );
  }
}
