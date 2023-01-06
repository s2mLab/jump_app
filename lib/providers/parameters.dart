import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Parameters with ChangeNotifier {
  static Parameters of(BuildContext context, {bool listen = false}) =>
      Provider.of<Parameters>(context, listen: listen);

  double get bodyMass => 70;
  double get g => -9.81;
  double get bodyWeight => bodyMass * g;

  double _initialHeight = 1.15;
  double get initialHeight => _initialHeight;
  set initialHeigh(value) {
    _initialHeight = value;
    notifyListeners();
  }

  double _finalHeight = 1.15;
  double get finalHeight => _finalHeight;
  set finalHeigh(value) {
    _finalHeight = value;
    notifyListeners();
  }

  double _groundReactionForce = 3000;
  double get groundReactionForce => _groundReactionForce;
  set groundReactionForce(value) {
    _groundReactionForce = value;
    notifyListeners();
  }

  double _pushoffTime = 300;
  double get pushoffTime => _pushoffTime;
  set pushoffTime(value) {
    _pushoffTime = value;
    notifyListeners();
  }

  double get impulse =>
      (groundReactionForce + bodyWeight) / 2 * (pushoffTime / 1000);

  double get initialVerticalVelocity => impulse / bodyMass;

  double get apexTime => initialVerticalVelocity / -g;

  double get apex {
    return _initialHeight +
        0.5 * g * apexTime * apexTime +
        initialVerticalVelocity * apexTime;
  }
}
