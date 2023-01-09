import 'package:flutter/material.dart';

import '/providers/locale_text.dart';
import 'double_heads_arrow.dart';

class LandingPhase extends StatelessWidget {
  const LandingPhase({
    Key? key,
    required this.texts,
    required this.arrowsHeadSize,
    required this.comFinal,
    required this.arrowsBelow,
    required this.land,
  }) : super(key: key);

  final LocaleText texts;
  final double arrowsHeadSize;
  final Offset comFinal;
  final double arrowsBelow;
  final double land;

  @override
  Widget build(BuildContext context) {
    return DoubleHeadsArrow(
      title: texts.landing,
      fontSize: arrowsHeadSize * 3 / 4,
      start: Offset(comFinal.dx, arrowsBelow),
      end: Offset(land, arrowsBelow),
      headSize: arrowsHeadSize,
      color: const Color.fromARGB(255, 8, 0, 239),
    );
  }
}
