import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
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
    final app = AppParameters.of(context);

    return DoubleHeadsArrow(
      start: Offset(comFinal.dx, arrowsBelow),
      end: Offset(land, arrowsBelow),
      headSize: app.theme.arrowHeadSize,
      color: app.theme.colorPhaseLanding,
      child: Text(
        app.texts.landing,
        textAlign: TextAlign.center,
        style: app.theme.textStylePhase
            .copyWith(color: app.theme.colorPhaseLanding),
      ),
    );
  }
}
