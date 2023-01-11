import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';
import 'double_heads_arrow.dart';
import 'text_with_index.dart';

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
    const color = Color.fromARGB(255, 31, 120, 165);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          left: apex.dx - deviceSize.width * 0.02,
          bottom: -(apex.dy - floor) / 2 - deviceSize.height * 0.05,
          child: Container(
            decoration: BoxDecoration(color: color.withAlpha(30)),
            padding: const EdgeInsets.all(2),
            child: Tooltip(
              message: theme.texts.computedMaximalHeight,
              child: Row(
                children: [
                  TextWithIndex('H', 'max',
                      textStyle: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: theme.fontSize,
                      )),
                  Text(
                    ' = ${biomechanics.apex.toStringAsFixed(2)} m',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: theme.fontSize,
                    ),
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
          color: color,
        ),
      ],
    );
  }
}
