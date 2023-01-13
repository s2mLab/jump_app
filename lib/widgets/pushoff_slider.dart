import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
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
    final app = AppParameters.of(context);
    final biomechanics = Biomechanics.of(context, listen: true);
    final deviceSize = MediaQuery.of(context).size;

    return ValuePicker.horizontal(
      min: app.jumpDescription.bounds.minimal.pushoffTime * 1000,
      max: app.jumpDescription.bounds.maximal.pushoffTime * 1000,
      value: biomechanics.pushoffTime * 1000,
      position: position,
      width: width,
      color: app.theme.colorParametersPushoff,
      textStyle: app.theme.textStyle,
      title: Text('T',
          style: app.theme.textStyle
              .copyWith(color: app.theme.colorParametersPushoff)),
      unit: Text('ms',
          style: app.theme.textStyle
              .copyWith(color: app.theme.colorParametersPushoff)),
      textOffset: Offset(deviceSize.width * 0.08, deviceSize.width * 0.01),
      precision: 0,
      onValueChanged: (value) => _updatePushoffTime(context, value),
      tooltip: app.texts.pushoffPhaseLengthTooltip,
    );
  }
}
