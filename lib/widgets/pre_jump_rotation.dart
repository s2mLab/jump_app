import 'dart:math';

import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';
import 'value_picker_rotation.dart';
import 'value_picker.dart';

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
    final theme = JumpAppTheme.of(context);
    final biomechanics = Biomechanics.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ValuePicker.diagonal(
          title: theme.texts.inertia,
          unit: 'kgm^2',
          color: theme.colorParametersPreJump,
          width: inertiaSliderSize,
          initial: biomechanics.initialInertia,
          min: 1,
          max: 4,
          position: inertiaSliderPosition,
          precision: 1,
          textStyle: theme.textStyle,
          onValueChanged: (value) => _onInertiaChanged(context, value),
          tooltip: theme.texts.inertiaTooltip,
        ),
        ValuePickerRotation(
          title: theme.texts.angularVelocity,
          units: '°/s',
          precision: 0,
          initial: biomechanics.initialAngularVelocity * 180 / pi,
          min: 100,
          max: 1000,
          position: initialVelocitySliderPosition,
          size: initialVelocitySliderSize,
          textStyle:
              theme.textStyle.copyWith(color: theme.colorParametersPreJump),
          onChange: (value) => _onInitialVelocityChanged(context, value),
          color: theme.colorParametersPreJump,
          tooltip: theme.texts.angularVelocityTooltip,
        ),
        ValuePickerRotation(
          title: theme.texts.preRotation,
          units: '°',
          precision: 0,
          initial: biomechanics.initialRotation * 180 / pi,
          min: 0,
          max: 180,
          position: initialRotationSliderPosition,
          size: initialRotationSliderSize,
          textStyle:
              theme.textStyle.copyWith(color: theme.colorParametersPreJump),
          onChange: (value) => _onInitialRotationChanged(context, value),
          color: theme.colorParametersPreJump,
          tooltip: theme.texts.initialRotationTooltip,
        ),
      ],
    );
  }
}
