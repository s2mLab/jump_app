import 'dart:math';

import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'mixed_tooptip.dart';
import 'text_with_subscript.dart';

class MaximalRotationVelocity extends StatelessWidget {
  const MaximalRotationVelocity({Key? key, required this.position})
      : super(key: key);

  final Offset position;

  @override
  Widget build(BuildContext context) {
    final biomechanics = Biomechanics.of(context, listen: true);
    final app = AppParameters.of(context);

    return Positioned(
      //app.level == DetailLevel.easy && app.type != AppType.rotation ? Container():
      left: position.dx,
      bottom: -position.dy,
      child: Container(
        decoration: BoxDecoration(color: app.theme.colorAnswer.withAlpha(30)),
        padding: const EdgeInsets.all(2),
        child: MixedTooltip(
          message: app.texts.computedMaximalAngularVelocity,
          helpTitle: app.texts.computedMaximalAngularVelocityHelpTitle,
          helpText: app.texts.computedMaximalAngularVelocityHelp,
          child: Row(
            children: [
              TextWithSubscript('\u{03C9}', 'max',
                  textStyle: app.theme.textStyleAnswer),
              Text(
                ': ${(biomechanics.maximumAngularVelocity * 180 / pi).toStringAsFixed(0)}°/s',
                style: app.theme.textStyleAnswer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
