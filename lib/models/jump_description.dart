import 'dart:math';

import '/models/biomechanics_bounds.dart';

enum JumpDescription {
  axel,
  lutz,
}

extension JumpDescriptionExtension on JumpDescription {
  String get path {
    switch (this) {
      case (JumpDescription.axel):
        return 'assets/images/key_frames_axel.png';
      case (JumpDescription.lutz):
        return 'assets/images/key_frames_lutz.png';
    }
  }

  String get name {
    switch (this) {
      case (JumpDescription.axel):
        return 'Axel';
      case (JumpDescription.lutz):
        return 'Lutz';
    }
  }

  BiomechanicsBounds get bounds {
    switch (this) {
      case (JumpDescription.axel):
        return BiomechanicsBounds(
          minimal: const BiomechanicsValue(
            initialHeight: 1,
            finalHeight: 1,
            initialInertia: 1,
            minimumInertia: 1,
            timeToMinimumInertia: 100 / 1000,
            timeToFinalInertia: 100 / 1000,
            initialRotation: 0 * pi / 180,
            initialAngularVelocity: 100 * pi / 180,
            groundReactionForce: 1000,
            pushoffTime: 150 / 1000,
          ),
          maximal: const BiomechanicsValue(
            initialHeight: 1.5,
            finalHeight: 1.5,
            initialInertia: 4,
            minimumInertia: 4,
            timeToMinimumInertia: 300 / 1000,
            timeToFinalInertia: 300 / 1000,
            initialRotation: 180 * pi / 180,
            initialAngularVelocity: 1000 * pi / 180,
            groundReactionForce: 5000,
            pushoffTime: 450 / 1000,
          ),
          initial: const BiomechanicsValue(
            initialHeight: 1.15,
            finalHeight: 1.15,
            initialInertia: 2.1,
            minimumInertia: 1,
            timeToMinimumInertia: 200 / 1000,
            timeToFinalInertia: 200 / 1000,
            initialRotation: 90 * pi / 180,
            initialAngularVelocity: 500 * pi / 180,
            groundReactionForce: 1500,
            pushoffTime: 300 / 1000,
          ),
        );
      case (JumpDescription.lutz):
        return BiomechanicsBounds(
          minimal: const BiomechanicsValue(
            initialHeight: 1,
            finalHeight: 1,
            initialInertia: 1,
            minimumInertia: 1,
            timeToMinimumInertia: 100 / 1000,
            timeToFinalInertia: 100 / 1000,
            initialRotation: 0 * pi / 180,
            initialAngularVelocity: 100 * pi / 180,
            groundReactionForce: 1000,
            pushoffTime: 150 / 1000,
          ),
          maximal: const BiomechanicsValue(
            initialHeight: 1.5,
            finalHeight: 1.5,
            initialInertia: 4,
            minimumInertia: 4,
            timeToMinimumInertia: 300 / 1000,
            timeToFinalInertia: 300 / 1000,
            initialRotation: 180 * pi / 180,
            initialAngularVelocity: 1000 * pi / 180,
            groundReactionForce: 5000,
            pushoffTime: 450 / 1000,
          ),
          initial: const BiomechanicsValue(
            initialHeight: 1.15,
            finalHeight: 1.15,
            initialInertia: 2.1,
            minimumInertia: 1,
            timeToMinimumInertia: 200 / 1000,
            timeToFinalInertia: 200 / 1000,
            initialRotation: 90 * pi / 180,
            initialAngularVelocity: 500 * pi / 180,
            groundReactionForce: 1500,
            pushoffTime: 300 / 1000,
          ),
        );
    }
  }
}
