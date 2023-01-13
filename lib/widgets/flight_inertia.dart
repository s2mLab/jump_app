import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'double_heads_arrow.dart';
import 'text_with_subscript.dart';
import 'text_with_superscript.dart';
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
    final app = AppParameters.of(context);
    final deviceSize = MediaQuery.of(context).size;
    final biomechanics = Biomechanics.of(context, listen: true);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        if (app.level != DetailLevel.easy)
          ValuePicker.diagonal(
            title: TextWithSubscript('I', 'min',
                textStyle: app.theme.textStyle
                    .copyWith(color: app.theme.colorParametersInertia)),
            textOffset:
                Offset(deviceSize.width * 0.02, deviceSize.width * 0.015),
            unit: TextWithSuperscript(
              'kgm',
              '2',
              textStyle: app.theme.textStyle
                  .copyWith(color: app.theme.colorParametersInertia),
            ),
            color: app.theme.colorParametersInertia,
            width: inertiaSliderSize,
            value: biomechanics.minimumInertia,
            min: app.jumpDescription.bounds.minimal.minimumInertia,
            max: app.jumpDescription.bounds.maximal.minimumInertia,
            position: inertiaSliderPosition,
            precision: 1,
            textStyle: app.theme.textStyle,
            onValueChanged: (value) => _onInertiaChanged(context, value),
            tooltip: app.texts.minimumInertiaTooltip,
          ),
        DoubleHeadsArrow(
          start: Offset(
              timeToInertiaSliderPosition.dx,
              -timeToInertiaSliderPosition.dy -
                  app.theme.fontSize * 2 -
                  deviceSize.width * 0.01),
          end: Offset(
              timeToInertiaSliderPosition.dx + timeToInertiaSliderSize,
              -timeToInertiaSliderPosition.dy -
                  app.theme.fontSize * 2 -
                  deviceSize.width * 0.01),
          headSize: app.theme.fontSize,
          color: app.theme.colorParametersInertia,
        ),
        ValuePicker.horizontal(
          title: TextWithSubscript(
            'T',
            'min',
            textStyle: app.theme.textStyle
                .copyWith(color: app.theme.colorParametersInertia),
          ),
          textOffset: Offset(deviceSize.width * 0.032, deviceSize.width * 0.01),
          unit: Text('ms',
              style: app.theme.textStyle
                  .copyWith(color: app.theme.colorParametersInertia)),
          color: app.theme.colorParametersInertia,
          width: timeToInertiaSliderSize,
          value: biomechanics.timeToMinimumInertia * 1000,
          min: app.jumpDescription.bounds.minimal.timeToMinimumInertia * 1000,
          max: app.jumpDescription.bounds.maximal.timeToMinimumInertia * 1000,
          position: timeToInertiaSliderPosition,
          precision: 0,
          textStyle: app.theme.textStyle,
          onValueChanged: (value) => _onTimeToInertiaChanged(context, value),
          tooltip: app.texts.timeToMinimumInertiaTooltip,
        )
      ],
    );
  }
}
