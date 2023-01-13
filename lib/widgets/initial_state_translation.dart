import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';
import 'arrow.dart';
import 'text_with_subscript.dart';

class InitialVelocity extends StatelessWidget {
  const InitialVelocity({
    super.key,
    required this.position,
    required this.norm,
  });

  final Offset position;
  final double norm;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final biomechanics = Biomechanics.of(context, listen: true);
    final theme = JumpAppTheme.of(context);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          right: deviceSize.width - position.dx + deviceSize.width * 0.02,
          bottom: -position.dy - norm + deviceSize.height * 0.3,
          child: Container(
            decoration: BoxDecoration(color: theme.colorAnswer.withAlpha(30)),
            padding: const EdgeInsets.all(2),
            child: Tooltip(
              message: theme.texts.computedMaximalHeight,
              child: Row(
                children: [
                  TextWithSubscript('V', '0', textStyle: theme.textStyleAnswer),
                  Text(
                    ' = ${biomechanics.initialVerticalVelocity.toStringAsFixed(2)} m/s',
                    style: theme.textStyleAnswer,
                  ),
                ],
              ),
            ),
          ),
        ),
        Arrow(
          start: Offset(position.dx, position.dy),
          end: Offset(position.dx, position.dy - norm),
          headSize: theme.arrowHeadSize,
          color: theme.colorAnswer,
        ),
      ],
    );
  }
}
