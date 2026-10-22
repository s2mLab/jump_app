import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/math_helper.dart';
import '../models/biomechanics_bounds.dart';
import 'app_parameters.dart';

class Biomechanics with ChangeNotifier {
  static Biomechanics of(BuildContext context, {bool listen = false}) =>
      Provider.of<Biomechanics>(context, listen: listen);

  Biomechanics(BiomechanicsValue initialValues) {
    setValues(initialValues);
  }

  void setValues(BiomechanicsValue initialValues) {
    bodyMass = initialValues.bodyMass;
    initialHeight = initialValues.initialHeight;
    finalHeight = initialValues.finalHeight;
    initialInertia = initialValues.initialInertia;
    minimumInertia = initialValues.minimumInertia;
    finalInertia = initialValues.finalInertia;
    timeToMinimumInertia = initialValues.timeToMinimumInertia;
    timeToFinalInertia = initialValues.timeToFinalInertia;
    initialRotation = initialValues.initialRotation;
    initialAngularVelocity = initialValues.initialAngularVelocity;
    groundReactionForce = initialValues.groundReactionForce;
    pushoffTime = initialValues.pushoffTime;
  }

  DetailLevel _level = DetailLevel.medium;
  set level(DetailLevel value) => _level = value;

  double get g => 9.81;

  late double _bodyMass; // kg
  double get bodyMass => _bodyMass;
  set bodyMass(double value) {
    _bodyMass = MathHelper.roundToPrecision(value, 2);
    notifyListeners();
  }

  double get bodyWeight => bodyMass * g; // N

  late double _initialHeight; // m
  double get initialHeight => _initialHeight;
  set initialHeight(double value) {
    _initialHeight = MathHelper.roundToPrecision(value, 2);
    notifyListeners();
  }

  late double _finalHeight; // m
  double get finalHeight =>
      _level == DetailLevel.easy ? initialHeight : _finalHeight;
  set finalHeight(double value) {
    _finalHeight = MathHelper.roundToPrecision(value, 2);
    notifyListeners();
  }

  late double _initialInertia; // kg.m^2
  double get initialInertia => _initialInertia;
  set initialInertia(double value) {
    _initialInertia = MathHelper.roundToPrecision(value, 2);
    notifyListeners();
  }

  late double _minimumInertia; // kg.m^2
  double get minimumInertia => _minimumInertia;
  set minimumInertia(double value) {
    _minimumInertia = MathHelper.roundToPrecision(value, 2);
    notifyListeners();
  }

  late double _finalInertia; // kg.m^2
  double get finalInertia => _finalInertia;
  set finalInertia(double value) {
    _finalInertia = MathHelper.roundToPrecision(value, 2);
    notifyListeners();
  }

  late double _timeToMinimumInertia; // s
  double get timeToMinimumInertia => _timeToMinimumInertia;
  set timeToMinimumInertia(double value) {
    _timeToMinimumInertia = MathHelper.roundToPrecision(value * 1000, 0) / 1000;
    notifyListeners();
  }

  late double _timeToFinalInertia; // s
  double get timeToFinalInertia => _timeToFinalInertia;
  set timeToFinalInertia(double value) {
    _timeToFinalInertia = MathHelper.roundToPrecision(value * 1000, 0) / 1000;
    notifyListeners();
  }

  late double _initialRotation; // rad
  double get initialRotation => _initialRotation;
  set initialRotation(double value) {
    _initialRotation = MathHelper.roundToPrecision(value / 2 / pi, 2) * 2 * pi;
    notifyListeners();
  }

  late double _initialAngularVelocity; // rad/s
  double get initialAngularVelocity => _initialAngularVelocity;
  set initialAngularVelocity(double value) {
    _initialAngularVelocity =
        MathHelper.roundToPrecision(value / 2 / pi, 2) * 2 * pi;
    notifyListeners();
  }

  late double _groundReactionForce; // N
  double get groundReactionForce => _groundReactionForce;
  set groundReactionForce(double value) {
    _groundReactionForce =
        MathHelper.roundToPrecision(value / bodyWeight, 2) * bodyWeight;
    notifyListeners();
  }

  late double _pushoffTime; // s
  double get pushoffTime => _pushoffTime;
  set pushoffTime(double value) {
    _pushoffTime = MathHelper.roundToPrecision(value * 1000, 0) / 1000;
    notifyListeners();
  }

  double get impulse => (groundReactionForce - bodyWeight) / 2 * pushoffTime;

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
          ((minimumInertia + finalInertia) / 2) *
          timeToFinalInertia;
  double get finalRotation => initialRotation + airborneRotation;

  double get ascendingTime => initialVerticalVelocity / g;
  double get descendingTime => sqrt((apex - finalHeight) / (0.5 * g));
  double get flightTime => ascendingTime + descendingTime;

  double get apex {
    return initialHeight -
        0.5 * g * ascendingTime * ascendingTime +
        initialVerticalVelocity * ascendingTime;
  }
}
