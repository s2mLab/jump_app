import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'arrow.dart';
import 'text_with_subscript.dart';
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
    final biomechanics = Biomechanics.of(context, listen: true);
    final app = AppParameters.of(context);
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Arrow(
            start: Offset(arrowHead.dx, -floor),
            end: arrowHead,
            headSize: app.theme.arrowHeadSize,
            color: app.theme.colorParametersGroundReactionForce,
          ),
          ValuePicker.vertical(
            min: app.jumpDescription.bounds.minimal.groundReactionForce,
            max: app.jumpDescription.bounds.maximal.groundReactionForce,
            value: biomechanics.groundReactionForce,
            position: sliderPosition,
            height: sliderHeight,
            color: app.theme.colorParametersGroundReactionForce,
            textStyle: app.theme.textStyle,
            textOffset: Offset(-deviceSize.width * 0.03, 0),
            title: TextWithSubscript(
              'F',
              'max',
              textStyle: app.theme.textStyle.copyWith(
                  color: app.theme.colorParametersGroundReactionForce),
            ),
            unit: Text('N',
                style: app.theme.textStyle.copyWith(
                    color: app.theme.colorParametersGroundReactionForce)),
            precision: 0,
            onValueChanged: (value) => _updateGrf(context, value),
            tooltip: app.texts.fmaxTooltip,
            helpTitle: app.texts.fmaxHelpTitle,
            helpText: app.texts.fmaxHelp,
          ),
        ],
      ),
    );
  }
}
