import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/detail_level.dart';

class Biomechanics with ChangeNotifier {
  static Biomechanics of(BuildContext context, {bool listen = false}) =>
      Provider.of<Biomechanics>(context, listen: listen);

  DetailLevel _level = DetailLevel.medium;
  set level(value) => _level = value;

  double get bodyMass => 70; // kg
  double get g => -9.81;
  double get bodyWeight => bodyMass * g;

  double _initialHeight = 1.15; // m
  double get initialHeight => _initialHeight;
  set initialHeigh(value) {
    _initialHeight = value;
    notifyListeners();
  }

  double _finalHeight = 1.15; // m
  double get finalHeight =>
      _level == DetailLevel.easy ? initialHeight : _finalHeight;
  set finalHeight(value) {
    _finalHeight = value;
    notifyListeners();
  }

  double _initialInertia = 2.1; // kg.m^2
  double get initialInertia => _initialInertia;
  set initialInertia(value) {
    _initialInertia = value;
    notifyListeners();
  }

  double _minimumInertia = 1; // kg.m^2
  double get minimumInertia => _minimumInertia;
  set minimumInertia(value) {
    _minimumInertia = value;
    notifyListeners();
  }

  double _timeToMinimumInertia = 0.200; // s
  double get timeToMinimumInertia => _timeToMinimumInertia;
  set timeToMinimumInertia(value) {
    _timeToMinimumInertia = value;
    notifyListeners();
  }

  // TODO: add a slider at one point
  double _timeToFinalInertia = 0.200; // s
  double get timeToFinalInertia => _timeToFinalInertia;
  set timeToFinalInertia(value) {
    _timeToFinalInertia = value;
    notifyListeners();
  }

  double _initialRotation = 90 * pi / 180; // rad
  double get initialRotation => _initialRotation;
  set initialRotation(value) {
    _initialRotation = value;
    notifyListeners();
  }

  double _initialAngularVelocity = 500 * pi / 180; // rad
  double get initialAngularVelocity => _initialAngularVelocity;
  set initialAngularVelocity(value) {
    _initialAngularVelocity = value;
    notifyListeners();
  }

  double _groundReactionForce = 1500; // N
  double get groundReactionForce => _groundReactionForce;
  set groundReactionForce(value) {
    _groundReactionForce = value;
    notifyListeners();
  }

  double _pushoffTime = 0.3; // s
  double get pushoffTime => _pushoffTime;
  set pushoffTime(value) {
    _pushoffTime = value;
    notifyListeners();
  }

  double get impulse => (groundReactionForce + bodyWeight) / 2 * pushoffTime;

  double get initialVerticalVelocity => impulse / bodyMass;
  double get angularMomentum => initialAngularVelocity * initialInertia;
  double get maximumAngularVelocity => angularMomentum / minimumInertia;

  double get airborneRotation =>
      angularMomentum /
          ((initialInertia + minimumInertia) / 2) *
          timeToMinimumInertia +
      angularMomentum /
          minimumInertia *
          (flightTime - timeToMinimumInertia - timeToFinalInertia) +
      angularMomentum /
          ((minimumInertia + initialInertia) / 2) *
          timeToFinalInertia;
  double get finalRotation => initialRotation + airborneRotation;

  double get ascendingTime => initialVerticalVelocity / -g;
  double get descendingTime => sqrt((apex - finalHeight) / (-0.5 * g));
  double get flightTime => ascendingTime + descendingTime;

  double get apex {
    return initialHeight +
        0.5 * g * ascendingTime * ascendingTime +
        initialVerticalVelocity * ascendingTime;
  }
}
