import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'double_heads_arrow.dart';
import 'mixed_tooptip.dart';
import 'text_with_subscript.dart';

class AerialPhase extends StatelessWidget {
  const AerialPhase({
    Key? key,
    required this.comStart,
    required this.arrowsBelow,
    required this.comFinal,
  }) : super(key: key);

  final Offset comStart;
  final double arrowsBelow;
  final Offset comFinal;

  @override
  Widget build(BuildContext context) {
    final biomechanics = Biomechanics.of(context, listen: true);
    final deviceSize = MediaQuery.of(context).size;
    final app = AppParameters.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          left: comStart.dx + deviceSize.width * 0.17,
          right: deviceSize.width - comFinal.dx + deviceSize.width * 0.17,
          bottom: -arrowsBelow - deviceSize.width * 0.05,
          child: Container(
            decoration:
                BoxDecoration(color: app.theme.colorAnswer.withAlpha(30)),
            padding: const EdgeInsets.all(2),
            child: MixedTooltip(
              message: app.texts.computedAerialPhaseTooltip,
              helpTitle: app.texts.computedAerialPhaseHelpTitle,
              helpText: app.texts.computedAerialPhaseHelp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWithSubscript('T', app.texts.flight,
                      textStyle: app.theme.textStyleAnswer),
                  Text(
                    ' = ${biomechanics.flightTime.toStringAsFixed(3)} s',
                    style: app.theme.textStyleAnswer,
                  ),
                ],
              ),
            ),
          ),
        ),
        DoubleHeadsArrow(
          start: Offset(comStart.dx, arrowsBelow),
          end: Offset(comFinal.dx, arrowsBelow),
          headSize: app.theme.arrowHeadSize,
          color: app.theme.colorPhaseAerial,
          child: Text(
            app.texts.aerialPhase,
            textAlign: TextAlign.center,
            style: app.theme.textStylePhase
                .copyWith(color: app.theme.colorPhaseAerial),
          ),
        )
      ],
    );
  }
}
