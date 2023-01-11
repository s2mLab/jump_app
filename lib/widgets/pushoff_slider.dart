import 'package:flutter/material.dart';

import '/providers/jump_app_theme.dart';
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
    final theme = JumpAppTheme.of(context);
    final biomechanics = Biomechanics.of(context);
    final deviceSize = MediaQuery.of(context).size;

    return ValuePicker.horizontal(
      min: 150,
      max: 450,
      initial: biomechanics.pushoffTime * 1000,
      position: position,
      width: width,
      color: theme.colorParametersPushoff,
      textStyle: theme.textStyle,
      title: Text('T',
          style: theme.textStyle.copyWith(color: theme.colorParametersPushoff)),
      unit: Text('ms',
          style: theme.textStyle.copyWith(color: theme.colorParametersPushoff)),
      textOffset: Offset(deviceSize.width * 0.08, deviceSize.width * 0.01),
      precision: 0,
      onValueChanged: (value) => _updatePushoffTime(context, value),
      tooltip: theme.texts.pushoffPhaseLengthTooltip,
    );
  }
}
