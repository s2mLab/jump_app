import 'package:flutter/material.dart';
import 'package:jump_app/widgets/double_heads_arrow.dart';

import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';
import 'value_picker.dart';

class FlightInertia extends StatelessWidget {
  const FlightInertia({
    super.key,
    required this.inertiaSliderPosition,
    required this.inertiaSliderSize,
    required this.timeToInertiaSliderPosition,
    required this.timeToInertiaSliderSize,
  });

  final Offset inertiaSliderPosition;
  final double inertiaSliderSize;
  final Offset timeToInertiaSliderPosition;
  final double timeToInertiaSliderSize;

  void _onInertiaChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.minimumInertia = value;
  }

  void _onTimeToInertiaChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.timeToMinimumInertia = value / 1000;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final theme = JumpAppTheme.of(context);
    final biomechanics = Biomechanics.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ValuePicker.diagonal(
          title: Text(theme.texts.minimumInertia),
          unit: 'kgm^2',
          color: theme.colorParametersInertia,
          width: inertiaSliderSize,
          initial: biomechanics.minimumInertia,
          min: 1,
          max: 4,
          position: inertiaSliderPosition,
          precision: 1,
          textStyle: theme.textStyle,
          onValueChanged: (value) => _onInertiaChanged(context, value),
          tooltip: theme.texts.minimumInertiaTooltip,
        ),
        DoubleHeadsArrow(
          start: Offset(
              timeToInertiaSliderPosition.dx,
              -timeToInertiaSliderPosition.dy -
                  theme.fontSize * 2 -
                  deviceSize.width * 0.01),
          end: Offset(
              timeToInertiaSliderPosition.dx + timeToInertiaSliderSize,
              -timeToInertiaSliderPosition.dy -
                  theme.fontSize * 2 -
                  deviceSize.width * 0.01),
          headSize: theme.fontSize,
          color: theme.colorParametersInertia,
        ),
        ValuePicker.horizontal(
          title: Text(theme.texts.timeToMinimumInertia),
          unit: 'ms',
          color: theme.colorParametersInertia,
          width: timeToInertiaSliderSize,
          initial: biomechanics.timeToMinimumInertia * 1000,
          min: 100,
          max: 300,
          position: timeToInertiaSliderPosition,
          precision: 0,
          textStyle: theme.textStyle,
          onValueChanged: (value) => _onTimeToInertiaChanged(context, value),
          tooltip: theme.texts.timeToMinimumInertiaTooltip,
        )
      ],
    );
  }
}
