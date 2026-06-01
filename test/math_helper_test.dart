import 'package:flutter_test/flutter_test.dart';
import 'package:jump_app/helpers/math_helper.dart';

void main() {
  group('DisplayValue', () {
    test('derives slider increments from the displayed precision', () {
      expect(MathHelper.step(0), 1);
      expect(MathHelper.step(2), 0.01);
    });

    test('rounds calculations to the precision shown on screen', () {
      expect(MathHelper.canonical(2.54842, min: 1, max: 5, precision: 2), 2.55);
      expect(
        MathHelper.canonical(200.6, min: 100, max: 400, precision: 0),
        201,
      );
    });

    test('keeps selectable endpoints inside the physical bounds', () {
      expect(MathHelper.minimum(1.6989, 2), 1.70);
      expect(MathHelper.maximum(4.2473, 2), 4.24);
      expect(
        MathHelper.canonical(4.2473, min: 1.6989, max: 4.2473, precision: 2),
        4.24,
      );
    });

    test('clamps numerical input to visible selectable bounds', () {
      expect(
        MathHelper.canonical(-5, min: -1.235, max: 1.235, precision: 2),
        -1.23,
      );
      expect(
        MathHelper.canonical(5, min: -1.235, max: 1.235, precision: 2),
        1.23,
      );
    });
  });
}
