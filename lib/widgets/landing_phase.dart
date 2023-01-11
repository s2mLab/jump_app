import 'package:flutter/material.dart';

import '/providers/jump_app_theme.dart';
import 'double_heads_arrow.dart';

class LandingPhase extends StatelessWidget {
  const LandingPhase({
    Key? key,
    required this.comFinal,
    required this.arrowsBelow,
    required this.land,
  }) : super(key: key);

  final Offset comFinal;
  final double arrowsBelow;
  final double land;

  @override
  Widget build(BuildContext context) {
    final theme = JumpAppTheme.of(context);

    return DoubleHeadsArrow(
      start: Offset(comFinal.dx, arrowsBelow),
      end: Offset(land, arrowsBelow),
      headSize: theme.arrowHeadSize,
      color: theme.colorPhaseLanding,
      child: Text(
        theme.texts.landing,
        textAlign: TextAlign.center,
        style: theme.textStylePhase.copyWith(color: theme.colorPhaseLanding),
      ),
    );
  }
}
