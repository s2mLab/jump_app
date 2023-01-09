import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/locale_text.dart';
import 'double_heads_arrow.dart';
import 'text_with_index.dart';

class AerialPhase extends StatelessWidget {
  const AerialPhase({
    Key? key,
    required this.arrowsHeadSize,
    required this.comStart,
    required this.arrowsBelow,
    required this.comFinal,
  }) : super(key: key);

  final double arrowsHeadSize;
  final Offset comStart;
  final double arrowsBelow;
  final Offset comFinal;

  @override
  Widget build(BuildContext context) {
    final biomechanics = Biomechanics.of(context, listen: true);
    const color = Color.fromARGB(255, 31, 120, 165);
    final deviceSize = MediaQuery.of(context).size;
    final texts = LocaleText.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          left: comStart.dx + deviceSize.width * 0.17,
          right: deviceSize.width - comFinal.dx + deviceSize.width * 0.17,
          bottom: -arrowsBelow - deviceSize.width * 0.05,
          child: Container(
            decoration: BoxDecoration(color: color.withAlpha(30)),
            padding: const EdgeInsets.all(2),
            child: Tooltip(
              message: texts.computedAerialPhaseTooltip,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWithIndex('T', texts.flight,
                      textStyle: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: arrowsHeadSize,
                      )),
                  Text(
                    ' = ${biomechanics.flightTime.toStringAsFixed(2)} s',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: arrowsHeadSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        DoubleHeadsArrow(
          start: Offset(comStart.dx, arrowsBelow),
          end: Offset(comFinal.dx, arrowsBelow),
          headSize: arrowsHeadSize,
          color: color,
          child: Tooltip(
            message: texts.aerialPhaseTooltip,
            child: Text(
              texts.aerialPhase,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: arrowsHeadSize * 3 / 4),
            ),
          ),
        )
      ],
    );
  }
}
