import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';
import 'double_heads_arrow.dart';
import 'text_with_subscript.dart';

class FlightApex extends StatelessWidget {
  const FlightApex({
    super.key,
    required this.apex,
    required this.floor,
  });

  final Offset apex;
  final double floor;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final biomechanics = Biomechanics.of(context, listen: true);
    final theme = JumpAppTheme.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          left: apex.dx - deviceSize.width * 0.02,
          bottom: -(apex.dy - floor) / 2 - deviceSize.height * 0.05,
          child: Container(
            decoration: BoxDecoration(color: theme.colorAnswer.withAlpha(30)),
            padding: const EdgeInsets.all(2),
            child: Tooltip(
              message: theme.texts.computedMaximalHeight,
              child: Row(
                children: [
                  TextWithSubscript('H', 'max',
                      textStyle: theme.textStyleAnswer),
                  Text(
                    ' = ${biomechanics.apex.toStringAsFixed(2)} m',
                    style: theme.textStyleAnswer,
                  ),
                ],
              ),
            ),
          ),
        ),
        DoubleHeadsArrow(
          start: Offset(apex.dx, -floor),
          end: apex,
          headSize: theme.arrowHeadSize,
          color: theme.colorAnswer,
        ),
      ],
    );
  }
}
