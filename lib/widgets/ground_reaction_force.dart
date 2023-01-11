import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';
import 'arrow.dart';
import 'text_with_index.dart';
import 'value_picker.dart';

class GroundReactionForce extends StatelessWidget {
  const GroundReactionForce({
    super.key,
    required this.arrowHead,
    required this.sliderPosition,
    required this.sliderHeight,
    this.floor = 0,
  });

  final Offset arrowHead;
  final Offset sliderPosition;
  final double sliderHeight;
  final double floor;

  void _updateGrf(BuildContext context, double value) {
    final biomechanics = Biomechanics.of(context);
    biomechanics.groundReactionForce = value;
  }

  @override
  Widget build(BuildContext context) {
    final biomechanics = Biomechanics.of(context);
    final theme = JumpAppTheme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Arrows(
            start: Offset(arrowHead.dx, -floor),
            end: arrowHead,
            headSize: theme.arrowHeadSize,
            color: theme.colorParametersGroundReactionForce,
          ),
          Positioned(
            left: arrowHead.dx + theme.arrowHeadSize / 2,
            bottom: -arrowHead.dy - 2 * theme.arrowHeadSize,
            child: Tooltip(
              message: theme.texts.fmaxTooltip,
              child: TextWithIndex(
                'F',
                'max',
                textStyle: TextStyle(
                  color: theme.colorParametersGroundReactionForce,
                  fontWeight: FontWeight.bold,
                  fontSize: theme.arrowHeadSize,
                ),
              ),
            ),
          ),
          ValuePicker.vertical(
            min: 1000,
            max: 5000,
            initial: biomechanics.groundReactionForce,
            position: sliderPosition,
            height: sliderHeight,
            color: theme.colorParametersGroundReactionForce,
            fontSize: theme.arrowHeadSize,
            unit: 'N',
            precision: 0,
            onValueChanged: (value) => _updateGrf(context, value),
            tooltip: theme.texts.fmaxTooltip,
          ),
        ],
      ),
    );
  }
}
