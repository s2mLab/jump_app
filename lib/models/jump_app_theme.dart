import 'package:flutter/material.dart';

class JumpAppTheme {
  /// This value must to get meaning full App dimensions
  double windowWidth = 0;

  // Icons
  double get iconSizeHeader => 0.04 * windowWidth;

  // Colors
  Color colorAirborneTrajectory = Colors.black;
  Color colorAnswer = const Color.fromARGB(255, 31, 120, 165);
  Color colorHeaderPrimary = Colors.black;
  Color colorHeaderSecondary = Colors.white;
  Color colorParametersCenterOfMass = const Color(0xff63aa65);
  Color colorParametersInertia = Colors.purple;
  Color colorParametersGroundReactionForce = Colors.red;
  Color colorParametersPreJump = Colors.brown;
  Color colorParametersPushoff = const Color.fromARGB(255, 128, 8, 162);
  Color colorPhaseAerial = const Color.fromARGB(255, 31, 120, 165);
  Color colorPhaseLanding = const Color.fromARGB(255, 8, 0, 239);
  Color colorPhasePushoff = const Color.fromARGB(255, 128, 8, 162);

  // Painting
  double get arrowHeadSize => 0.03 * windowWidth;

  // Text
  double get fontSize => 0.02 * windowWidth;
  double get fontSizePhaseName => 3 / 4 * fontSize;
  double get fontSizeHeader => 0.02 * windowWidth;
  double get fontSizeLanguageSelection => 0.02 * windowWidth;
  TextStyle get textStyle => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
      );
  TextStyle get textStyleAnswer => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
        color: colorAnswer,
      );
  TextStyle get textStylePhase => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: fontSizePhaseName,
      );
  TextStyle get textStyleHeader => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: fontSizeHeader,
        color: colorHeaderPrimary,
      );
  TextStyle get textStyleDrawerTitle => TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: colorHeaderPrimary,
      );
  TextStyle get textStyleDrawerTile => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: colorHeaderPrimary,
      );
}
