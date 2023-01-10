import 'dart:math';

import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/locale_text.dart';
import 'value_picker_rotation.dart';

class PreJumpRotation extends StatelessWidget {
  const PreJumpRotation({
    super.key,
    required this.initialRotationSliderPosition,
    required this.initialRotationSliderSize,
    required this.floor,
    required this.fontSize,
    required this.initialVelocitySliderPosition,
    required this.initialVelocitySliderSize,
  });

  final Offset initialRotationSliderPosition;
  final double initialRotationSliderSize;
  final Offset initialVelocitySliderPosition;
  final double initialVelocitySliderSize;
  final double floor;
  final double fontSize;

  void _onInitialRotationChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.initialRotation = value * pi / 180;
  }

  void _onInitialVelocityChanged(BuildContext context, value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.initialAngularVelocity = value * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final biomechanics = Biomechanics.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ValuePickerRotation(
          title: texts.angularVelocity,
          initial: biomechanics.initialAngularVelocity * 180 / pi,
          min: 100,
          max: 1000,
          position: initialVelocitySliderPosition,
          size: initialVelocitySliderSize,
          floor: floor,
          fontSize: fontSize,
          onChange: (value) => _onInitialVelocityChanged(context, value),
        ),
        ValuePickerRotation(
          title: texts.preRotation,
          initial: biomechanics.initialRotation * 180 / pi,
          min: 0,
          max: 180,
          position: initialRotationSliderPosition,
          size: initialRotationSliderSize,
          floor: floor,
          fontSize: fontSize,
          onChange: (value) => _onInitialRotationChanged(context, value),
        ),
      ],
    );
  }
}
