import 'package:flutter/material.dart';
import 'package:jump_app/widgets/double_heads_arrow.dart';

import '/providers/biomechanics.dart';
import '/providers/locale_text.dart';
import 'value_picker.dart';

class FlightInertia extends StatelessWidget {
  const FlightInertia({
    super.key,
    required this.inertiaSliderPosition,
    required this.inertiaSliderSize,
    required this.fontSize,
    required this.timeToInertiaSliderPosition,
    required this.timeToInertiaSliderSize,
  });

  final Offset inertiaSliderPosition;
  final double inertiaSliderSize;
  final Offset timeToInertiaSliderPosition;
  final double timeToInertiaSliderSize;
  final double fontSize;

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
    final texts = LocaleText.of(context);
    final biomechanics = Biomechanics.of(context);
    const color = Colors.purple;

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ValuePicker.diagonal(
          title: texts.minimumInertia,
          unit: 'kgm^2',
          color: color,
          width: inertiaSliderSize,
          initial: biomechanics.minimumInertia,
          min: 1,
          max: 4,
          position: inertiaSliderPosition,
          precision: 1,
          fontSize: fontSize,
          onValueChanged: (value) => _onInertiaChanged(context, value),
          tooltip: texts.minimumInertiaTooltip,
        ),
        DoubleHeadsArrow(
          start: Offset(
              timeToInertiaSliderPosition.dx,
              -timeToInertiaSliderPosition.dy -
                  fontSize * 2 -
                  deviceSize.width * 0.01),
          end: Offset(
              timeToInertiaSliderPosition.dx + timeToInertiaSliderSize,
              -timeToInertiaSliderPosition.dy -
                  fontSize * 2 -
                  deviceSize.width * 0.01),
          headSize: fontSize,
          color: color,
        ),
        ValuePicker.horizontal(
          title: texts.timeToMinimumInertia,
          unit: 'ms',
          color: color,
          width: timeToInertiaSliderSize,
          initial: biomechanics.timeToMinimumInertia * 1000,
          min: 100,
          max: 300,
          position: timeToInertiaSliderPosition,
          precision: 0,
          fontSize: fontSize,
          onValueChanged: (value) => _onTimeToInertiaChanged(context, value),
          tooltip: texts.timeToMinimumInertiaTooltip,
        )
      ],
    );
  }
}
