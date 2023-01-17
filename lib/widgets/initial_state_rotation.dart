import 'dart:math';

import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'text_with_subscript.dart';
import 'text_with_superscript.dart';
import 'value_picker.dart';
import 'value_picker_rotation.dart';

class PreJumpRotation extends StatelessWidget {
  const PreJumpRotation({
    super.key,
    required this.initialRotationSliderPosition,
    required this.initialRotationSliderSize,
    required this.initialVelocitySliderPosition,
    required this.initialVelocitySliderSize,
    required this.inertiaSliderPosition,
    required this.inertiaSliderSize,
  });

  final Offset initialRotationSliderPosition;
  final double initialRotationSliderSize;
  final Offset initialVelocitySliderPosition;
  final double initialVelocitySliderSize;
  final Offset inertiaSliderPosition;
  final double inertiaSliderSize;

  void _onInitialRotationChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.initialRotation = value * pi / 180;
  }

  void _onInitialVelocityChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.initialAngularVelocity = value * pi / 180;
  }

  void _onInertiaChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.initialInertia = value;
  }

  @override
  Widget build(BuildContext context) {
    final app = AppParameters.of(context);
    final biomechanics = Biomechanics.of(context, listen: true);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ValuePicker.diagonal(
          title: TextWithSubscript('I', '0',
              textStyle: app.theme.textStyle
                  .copyWith(color: app.theme.colorParametersPreJump)),
          unit: TextWithSuperscript(
            'kgm',
            '2',
            textStyle: app.theme.textStyle
                .copyWith(color: app.theme.colorParametersPreJump),
          ),
          color: app.theme.colorParametersPreJump,
          width: inertiaSliderSize,
          value: biomechanics.initialInertia,
          min: app.jumpDescription.bounds.minimal.initialInertia,
          max: app.jumpDescription.bounds.maximal.initialInertia,
          position: inertiaSliderPosition,
          precision: 2,
          textStyle: app.theme.textStyle,
          onValueChanged: (value) => _onInertiaChanged(context, value),
          tooltip: app.texts.inertiaTooltip,
          helpTitle: app.texts.inertiaHelpTitle,
          helpText: app.texts.inertiaHelp,
        ),
        ValuePickerRotation(
          title: TextWithSubscript('\u{03C9}', '0',
              textStyle: app.theme.textStyleAnswer
                  .copyWith(color: app.theme.colorParametersPreJump)),
          units: Text('°/s',
              style: app.theme.textStyle
                  .copyWith(color: app.theme.colorParametersPreJump)),
          precision: 0,
          value: biomechanics.initialAngularVelocity * 180 / pi,
          min: app.jumpDescription.bounds.minimal.initialAngularVelocity *
              180 /
              pi,
          max: app.jumpDescription.bounds.maximal.initialAngularVelocity *
              180 /
              pi,
          position: initialVelocitySliderPosition,
          size: initialVelocitySliderSize,
          textStyle: app.theme.textStyle
              .copyWith(color: app.theme.colorParametersPreJump),
          onChange: (value) => _onInitialVelocityChanged(context, value),
          color: app.theme.colorParametersPreJump,
          tooltip: app.texts.angularVelocityTooltip,
          helpTitle: app.texts.angularVelocityHelpTitle,
          helpText: app.texts.angularVelocityHelp,
        ),
        if (app.level != DetailLevel.easy)
          ValuePickerRotation(
            title: TextWithSubscript('\u{03B8}', '0',
                textStyle: app.theme.textStyle
                    .copyWith(color: app.theme.colorParametersPreJump)),
            units: Text('°',
                style: app.theme.textStyle
                    .copyWith(color: app.theme.colorParametersPreJump)),
            precision: 0,
            value: biomechanics.initialRotation * 180 / pi,
            min: app.jumpDescription.bounds.minimal.initialRotation * 180 / pi,
            max: app.jumpDescription.bounds.maximal.initialRotation * 180 / pi,
            position: initialRotationSliderPosition,
            size: initialRotationSliderSize,
            textStyle: app.theme.textStyle
                .copyWith(color: app.theme.colorParametersPreJump),
            onChange: (value) => _onInitialRotationChanged(context, value),
            color: app.theme.colorParametersPreJump,
            tooltip: app.texts.initialRotationTooltip,
            helpTitle: app.texts.initialRotationHelpTitle,
            helpText: app.texts.initialRotationHelp,
          ),
      ],
    );
  }
}
