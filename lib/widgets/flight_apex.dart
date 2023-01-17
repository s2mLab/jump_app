import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'double_heads_arrow.dart';
import 'mixed_tooptip.dart';
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
    final app = AppParameters.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          width: deviceSize.width,
          height: deviceSize.height,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Positioned(
                left: apex.dx + deviceSize.width * 0.01,
                bottom: -apex.dy - deviceSize.width * 0.06,
                child: Container(
                  decoration:
                      BoxDecoration(color: app.theme.colorAnswer.withAlpha(30)),
                  padding: const EdgeInsets.all(2),
                  child: MixedTooltip(
                    message: app.texts.computedMaximalHeight,
                    helpTitle: app.texts.computedMaximalHeightHelpTitle,
                    helpText: app.texts.computedMaximalHeightHelp,
                    child: Row(
                      children: [
                        TextWithSubscript('H', 'max',
                            textStyle: app.theme.textStyleAnswer),
                        Text(
                          ': ${biomechanics.apex.toStringAsFixed(2)} m',
                          style: app.theme.textStyleAnswer,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        DoubleHeadsArrow(
          start: Offset(apex.dx, -floor),
          end: apex,
          headSize: app.theme.arrowHeadSize,
          color: app.theme.colorAnswer,
        ),
      ],
    );
  }
}
