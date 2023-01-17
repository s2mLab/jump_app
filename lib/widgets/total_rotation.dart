import 'dart:math';

import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'mixed_tooptip.dart';
import 'text_with_subscript.dart';

class TotalRotation extends StatelessWidget {
  const TotalRotation({Key? key, required this.position}) : super(key: key);

  final Offset position;

  @override
  Widget build(BuildContext context) {
    final biomechanics = Biomechanics.of(context, listen: true);
    final app = AppParameters.of(context);

    return app.level == DetailLevel.easy && app.type != AppType.rotation
        ? Container()
        : Positioned(
            left: position.dx,
            bottom: -position.dy,
            child: Container(
              decoration:
                  BoxDecoration(color: app.theme.colorAnswer.withAlpha(30)),
              padding: const EdgeInsets.all(2),
              child: MixedTooltip(
                message: app.texts.computedFinalRotation,
                helpTitle: app.texts.computedFinalRotationHelpTitle,
                helpText: app.texts.computedFinalRotationHelp,
                child: Row(
                  children: [
                    TextWithSubscript('\u{03B8}', 'F',
                        textStyle: app.theme.textStyleAnswer),
                    Text(
                      ' = ${(biomechanics.finalRotation * 180 / pi).toStringAsFixed(0)}°',
                      style: app.theme.textStyleAnswer,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
