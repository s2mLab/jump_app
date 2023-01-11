import 'package:flutter/material.dart';

import '/providers/jump_app_theme.dart';
import 'double_heads_arrow.dart';
import 'pushoff_slider.dart';

class PushoffPhase extends StatelessWidget {
  const PushoffPhase({
    Key? key,
    required this.pushoff,
    required this.arrowsBelow,
    required this.comStart,
    required this.pushoffSliderPosition,
    required this.pushoffSliderWidth,
  }) : super(key: key);

  final double pushoff;
  final double arrowsBelow;
  final Offset comStart;
  final Offset pushoffSliderPosition;
  final double pushoffSliderWidth;

  @override
  Widget build(BuildContext context) {
    final theme = JumpAppTheme.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        PushoffSlider(
          color: theme.colorParametersPushoff,
          position: pushoffSliderPosition,
          fontSize: theme.fontSize,
          width: pushoffSliderWidth,
        ),
        DoubleHeadsArrow(
          start: Offset(pushoff, arrowsBelow),
          end: Offset(comStart.dx, arrowsBelow),
          headSize: theme.arrowHeadSize,
          color: theme.colorPhasePushoff,
          child: Text(
            theme.texts.pushoffPhase,
            textAlign: TextAlign.center,
            style:
                theme.textStylePhase.copyWith(color: theme.colorPhasePushoff),
          ),
        ),
      ],
    );
  }
}
