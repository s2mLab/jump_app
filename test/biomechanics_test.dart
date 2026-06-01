import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:jump_app/models/detail_level.dart';
import 'package:jump_app/models/jump_description.dart';
import 'package:jump_app/providers/biomechanics.dart';

void main() {
  group('Biomechanics display precision', () {
    test(
      'initial values use the same precision as their displayed controls',
      () {
        final biomechanics = Biomechanics(JumpDescription.axel.bounds.initial);

        expect(
          biomechanics.groundReactionForce / biomechanics.bodyWeight,
          2.55,
        );
        expect(biomechanics.pushoffTime * 1000, 300);
        expect(
          biomechanics.initialAngularVelocity / 2 / pi,
          closeTo(1.50, 1e-12),
        );
      },
    );

    test('updates preserve displayed units for every editable scalar', () {
      final biomechanics = Biomechanics(JumpDescription.axel.bounds.initial);

      biomechanics.initialHeight = 1.236;
      biomechanics.finalHeight = 1.244;
      biomechanics.initialInertia = 2.126;
      biomechanics.minimumInertia = 0.756;
      biomechanics.timeToMinimumInertia = 0.1806;
      biomechanics.timeToFinalInertia = 0.0204;
      biomechanics.initialRotation = 0.256 * 2 * pi;
      biomechanics.initialAngularVelocity = 1.236 * 2 * pi;
      biomechanics.groundReactionForce = biomechanics.bodyWeight * 2.684;
      biomechanics.pushoffTime = 0.3006;

      expect(biomechanics.initialHeight, 1.24);
      expect(biomechanics.finalHeight, 1.24);
      expect(biomechanics.initialInertia, 2.13);
      expect(biomechanics.minimumInertia, 0.76);
      expect(biomechanics.timeToMinimumInertia * 1000, 181);
      expect(biomechanics.timeToFinalInertia * 1000, 20);
      expect(biomechanics.initialRotation / 2 / pi, closeTo(0.26, 1e-12));
      expect(
        biomechanics.initialAngularVelocity / 2 / pi,
        closeTo(1.24, 1e-12),
      );
      expect(biomechanics.groundReactionForce / biomechanics.bodyWeight, 2.68);
      expect(biomechanics.pushoffTime * 1000, 301);
    });
  });

  group('Biomechanics calculations', () {
    test('force in bodyweights uses the selected athlete mass', () {
      final biomechanics = Biomechanics(JumpDescription.lutz.bounds.initial);

      biomechanics.groundReactionForce = biomechanics.bodyWeight * 2.68;

      expect(biomechanics.bodyMass, 57);
      expect(
        biomechanics.groundReactionForce,
        closeTo(2.68 * 57 * biomechanics.g, 1e-9),
      );
    });

    test('derived impulse and velocity use the canonical visible values', () {
      final biomechanics = Biomechanics(JumpDescription.axel.bounds.initial);
      final expectedImpulse = (2.55 - 1) * biomechanics.bodyWeight / 2 * 0.300;

      expect(biomechanics.impulse, closeTo(expectedImpulse, 1e-9));
      expect(
        biomechanics.initialVerticalVelocity,
        closeTo(expectedImpulse / biomechanics.bodyMass, 1e-9),
      );
    });

    test('easy mode makes the landing height follow takeoff height', () {
      final biomechanics = Biomechanics(JumpDescription.axel.bounds.initial);
      biomechanics.initialHeight = 1.27;
      biomechanics.finalHeight = 1.08;

      expect(biomechanics.finalHeight, 1.08);

      biomechanics.level = DetailLevel.easy;

      expect(biomechanics.finalHeight, 1.27);
    });

    test('editable updates notify listeners', () {
      final biomechanics = Biomechanics(JumpDescription.axel.bounds.initial);
      var notifications = 0;
      biomechanics.addListener(() => notifications++);

      biomechanics.pushoffTime = 0.334;
      biomechanics.initialInertia = 2.32;

      expect(notifications, 2);
    });
  });
}
