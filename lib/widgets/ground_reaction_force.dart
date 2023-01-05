import 'package:flutter/material.dart';

import 'arrow.dart';
import 'text_with_index.dart';
import 'value_picker.dart';

@override
List<Widget> groundReactionForce({
  required Offset arrowTip,
  required double arrowTipSize,
  required Offset sliderPosition,
  required double sliderHeight,
}) {
  return [
    Arrows(
      start: Offset(arrowTip.dx, 0),
      end: arrowTip,
      tipSize: arrowTipSize,
      color: Colors.red,
    ),
    Positioned(
      left: arrowTip.dx + arrowTipSize / 2,
      bottom: -arrowTip.dy - 2 * arrowTipSize,
      child: TextWithIndex(
        'F',
        'max',
        textStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: arrowTipSize,
        ),
      ),
    ),
    ValuePicker(
      min: 700,
      max: 5000,
      initial: 3000,
      position: sliderPosition,
      height: sliderHeight,
      color: Colors.red,
      textSize: arrowTipSize,
      unit: 'N',
      precision: 0,
    ),
  ];
}
