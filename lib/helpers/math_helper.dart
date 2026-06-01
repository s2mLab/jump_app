import 'dart:math';

class MathHelper {
  const MathHelper._(); // Private constructor to prevent instantiation

  static double step(int precision) => pow(10, -precision).toDouble();

  static double roundToPrecision(double value, int precision) {
    final scale = pow(10, precision).toDouble();
    return (value * scale).round() / scale;
  }

  static double minimum(double value, int precision) {
    final scale = pow(10, precision).toDouble();
    return (value * scale).ceil() / scale;
  }

  static double maximum(double value, int precision) {
    final scale = pow(10, precision).toDouble();
    return (value * scale).floor() / scale;
  }

  static double canonical(
    double value, {
    required double min,
    required double max,
    required int precision,
  }) {
    final mininumValue = minimum(min, precision);
    final maximumValue = maximum(max, precision);
    final bounded = value.clamp(mininumValue, maximumValue).toDouble();
    return roundToPrecision(bounded, precision);
  }
}
