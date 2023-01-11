import 'package:flutter/material.dart';
import 'locale_text.dart';
import 'package:provider/provider.dart';

class JumpAppTheme with ChangeNotifier {
  /// This is the entry point to use any of the Theme as all the values need to
  /// be updated using the of(context)
  static JumpAppTheme of(BuildContext context, {bool listen = true}) {
    final instance = Provider.of<JumpAppTheme>(context, listen: listen);
    instance._currentDeviceWidth = MediaQuery.of(context).size.width;
    instance._currentLocale = LocaleText.of(context);
    return instance;
  }

  late double _currentDeviceWidth;

  // Icons
  double get iconSizeHeader => 0.04 * _currentDeviceWidth;

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
  Color colorPhaseLanding = const Color.fromARGB(255, 8, 0, 239);
  Color colorPhasePushoff = const Color.fromARGB(255, 128, 8, 162);

  // Painting
  double get arrowHeadSize => 0.023 * _currentDeviceWidth;

  // Text
  late LocaleText _currentLocale;
  LocaleText get texts => _currentLocale;
  double get fontSize => 0.023 * _currentDeviceWidth;
  double get fontSizePhaseName => 3 / 4 * fontSize;
  double get fontSizeHeader => 0.02 * _currentDeviceWidth;
  double get fontSizeLanguageSelection => 0.025 * _currentDeviceWidth;
}
