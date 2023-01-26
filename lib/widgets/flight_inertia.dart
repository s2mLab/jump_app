import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'double_heads_arrow.dart';
import 'text_with_subscript.dart';
import 'text_with_superscript.dart';
import 'value_picker.dart';

class FlightInertia extends StatelessWidget {
  const FlightInertia(
      {super.key,
      required this.inertiaSliderSize,
      required this.timeToInertiaSliderSize,
      required this.minInertiaSliderPosition,
      required this.timeToMinInertiaSliderPosition,
      required this.timeToFinalInertiaSliderPosition});

  final double inertiaSliderSize;
  final double timeToInertiaSliderSize;

  final Offset minInertiaSliderPosition;
  final Offset timeToMinInertiaSliderPosition;

  final Offset timeToFinalInertiaSliderPosition;

  void _onMinInertiaChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.minimumInertia = value;
  }

  void _onTimeToMinInertiaChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.timeToMinimumInertia = value / 1000;
  }

  void _onTimeToFinalInertiaChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.timeToFinalInertia = value / 1000;
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
            position: minInertiaSliderPosition,
            precision: 2,
            textStyle: app.theme.textStyle,
            onValueChanged: (value) => _onMinInertiaChanged(context, value),
            tooltip: app.texts.minimumInertiaTooltip,
            helpTitle: app.texts.minimumInertiaHelpTitle,
            helpText: app.texts.minimumInertiaHelp,
          ),
        DoubleHeadsArrow(
          start: Offset(
              timeToMinInertiaSliderPosition.dx,
              -timeToMinInertiaSliderPosition.dy -
                  app.theme.fontSize * 2 -
                  deviceSize.width * 0.01),
          end: Offset(
              timeToMinInertiaSliderPosition.dx + timeToInertiaSliderSize,
              -timeToMinInertiaSliderPosition.dy -
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
          textOffset: Offset(deviceSize.width * 0.01, deviceSize.width * 0.01),
          unit: Text('ms',
              style: app.theme.textStyle
                  .copyWith(color: app.theme.colorParametersInertia)),
          color: app.theme.colorParametersInertia,
          width: timeToInertiaSliderSize,
          value: biomechanics.timeToMinimumInertia * 1000,
          min: app.jumpDescription.bounds.minimal.timeToMinimumInertia * 1000,
          max: app.jumpDescription.bounds.maximal.timeToMinimumInertia * 1000,
          position: timeToMinInertiaSliderPosition,
          precision: 0,
          textStyle: app.theme.textStyle,
          onValueChanged: (value) => _onTimeToMinInertiaChanged(context, value),
          tooltip: app.texts.timeToMinimumInertiaTooltip,
          helpTitle: app.texts.timeToMinimumInertiaHelpTitle,
          helpText: app.texts.timeToMinimumInertiaHelp,
        ),
        if (app.level != DetailLevel.easy)
          DoubleHeadsArrow(
            start: Offset(
                timeToFinalInertiaSliderPosition.dx,
                -timeToFinalInertiaSliderPosition.dy -
                    app.theme.fontSize * 2 -
                    deviceSize.width * 0.01),
            end: Offset(
                timeToFinalInertiaSliderPosition.dx + timeToInertiaSliderSize,
                -timeToFinalInertiaSliderPosition.dy -
                    app.theme.fontSize * 2 -
                    deviceSize.width * 0.01),
            headSize: app.theme.fontSize,
            color: app.theme.colorParametersInertia,
          ),
        if (app.level != DetailLevel.easy)
          ValuePicker.horizontal(
            title: TextWithSubscript(
              'T',
              app.texts.open,
              textStyle: app.theme.textStyle
                  .copyWith(color: app.theme.colorParametersInertia),
            ),
            textOffset:
                Offset(deviceSize.width * 0.01, deviceSize.width * 0.01),
            unit: Text('ms',
                style: app.theme.textStyle
                    .copyWith(color: app.theme.colorParametersInertia)),
            color: app.theme.colorParametersInertia,
            width: timeToInertiaSliderSize,
            value: biomechanics.timeToFinalInertia * 1000,
            min: app.jumpDescription.bounds.minimal.timeToFinalInertia * 1000,
            max: app.jumpDescription.bounds.maximal.timeToFinalInertia * 1000,
            position: timeToFinalInertiaSliderPosition,
            precision: 0,
            textStyle: app.theme.textStyle,
            onValueChanged: (value) =>
                _onTimeToFinalInertiaChanged(context, value),
            tooltip: app.texts.timeToFinalInertiaTooltip,
            helpTitle: app.texts.timeToFinalInertiaHelpTitle,
            helpText: app.texts.timeToFinalInertiaHelp,
          ),
      ],
    );
  }
}
