import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';
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
    final theme = JumpAppTheme.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          left: comStart.dx + deviceSize.width * 0.17,
          right: deviceSize.width - comFinal.dx + deviceSize.width * 0.17,
          bottom: -arrowsBelow - deviceSize.width * 0.05,
          child: Container(
            decoration: BoxDecoration(color: theme.colorAnswer.withAlpha(30)),
            padding: const EdgeInsets.all(2),
            child: MixedTooltip(
              message: theme.texts.computedAerialPhaseTooltip,
              helpTitle: theme.texts.flightTimeHelpTitle,
              helpText: theme.texts.flightTimePhaseHelp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWithSubscript('T', theme.texts.flight,
                      textStyle: theme.textStyleAnswer),
                  Text(
                    ' = ${biomechanics.flightTime.toStringAsFixed(3)} s',
                    style: theme.textStyleAnswer,
                  ),
                ],
              ),
            ),
          ),
        ),
        DoubleHeadsArrow(
          start: Offset(comStart.dx, arrowsBelow),
          end: Offset(comFinal.dx, arrowsBelow),
          headSize: theme.arrowHeadSize,
          color: theme.colorPhaseAerial,
          child: Text(
            theme.texts.aerialPhase,
            textAlign: TextAlign.center,
            style: theme.textStylePhase.copyWith(color: theme.colorPhaseAerial),
          ),
        )
      ],
    );
  }
}
