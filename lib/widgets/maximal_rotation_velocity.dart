import 'dart:math';

import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';

class MaximalRotationVelocity extends StatelessWidget {
  const MaximalRotationVelocity({Key? key, required this.position})
      : super(key: key);

  final Offset position;

  @override
  Widget build(BuildContext context) {
    final biomechanics = Biomechanics.of(context, listen: true);
    final appParameters = AppParameters.of(context);
    final theme = JumpAppTheme.of(context);

    return appParameters.level == DetailLevel.easy &&
            appParameters.type != AppType.rotation
        ? Container()
        : Positioned(
            left: position.dx,
            bottom: -position.dy,
            child: Container(
              decoration: BoxDecoration(color: theme.colorAnswer.withAlpha(30)),
              padding: const EdgeInsets.all(2),
              child: Text(
                '${theme.texts.maxRotationVelocity} = ${(biomechanics.finalRotation * 180 / pi).toStringAsFixed(0)}°/s',
                style: theme.textStyleAnswer,
              ),
            ),
          );
  }
}
