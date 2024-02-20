import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import 'double_heads_arrow.dart';
import 'pushoff_slider.dart';

class PushoffPhase extends StatelessWidget {
  const PushoffPhase({
    super.key,
    required this.pushoff,
    required this.arrowsBelow,
    required this.comStart,
    required this.pushoffSliderPosition,
    required this.pushoffSliderWidth,
  });

  final double pushoff;
  final double arrowsBelow;
  final Offset comStart;
  final Offset pushoffSliderPosition;
  final double pushoffSliderWidth;

  @override
  Widget build(BuildContext context) {
    final app = AppParameters.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        PushoffSlider(
          color: app.theme.colorParametersPushoff,
          position: pushoffSliderPosition,
          fontSize: app.theme.fontSize,
          width: pushoffSliderWidth,
        ),
        DoubleHeadsArrow(
          start: Offset(pushoff, arrowsBelow),
          end: Offset(comStart.dx, arrowsBelow),
          headSize: app.theme.arrowHeadSize,
          color: app.theme.colorPhasePushoff,
          child: Text(
            app.texts.pushoffPhase,
            textAlign: TextAlign.center,
            style: app.theme.textStylePhase
                .copyWith(color: app.theme.colorPhasePushoff),
          ),
        ),
      ],
    );
  }
}
