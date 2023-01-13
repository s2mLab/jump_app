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
            initialInertia: 0,
            minimumInertia: 0,
            timeToMinimumInertia: 0,
            timeToFinalInertia: 0,
            initialRotation: 0,
            initialAngularVelocity: 0,
            groundReactionForce: 0,
            pushoffTime: 0,
          ),
          maximal: const BiomechanicsValue(
            initialHeight: 1.5,
            finalHeight: 1.5,
            initialInertia: 0,
            minimumInertia: 0,
            timeToMinimumInertia: 0,
            timeToFinalInertia: 0,
            initialRotation: 0,
            initialAngularVelocity: 0,
            groundReactionForce: 0,
            pushoffTime: 0,
          ),
          initial: const BiomechanicsValue(
            initialHeight: 1.15,
            finalHeight: 1.15,
            initialInertia: 0,
            minimumInertia: 0,
            timeToMinimumInertia: 0,
            timeToFinalInertia: 0,
            initialRotation: 0,
            initialAngularVelocity: 0,
            groundReactionForce: 0,
            pushoffTime: 0,
          ),
        );
      case (JumpDescription.lutz):
        return BiomechanicsBounds(
          minimal: const BiomechanicsValue(
            initialHeight: 1,
            finalHeight: 1,
            initialInertia: 0,
            minimumInertia: 0,
            timeToMinimumInertia: 0,
            timeToFinalInertia: 0,
            initialRotation: 0,
            initialAngularVelocity: 0,
            groundReactionForce: 0,
            pushoffTime: 0,
          ),
          maximal: const BiomechanicsValue(
            initialHeight: 1.5,
            finalHeight: 1.5,
            initialInertia: 0,
            minimumInertia: 0,
            timeToMinimumInertia: 0,
            timeToFinalInertia: 0,
            initialRotation: 0,
            initialAngularVelocity: 0,
            groundReactionForce: 0,
            pushoffTime: 0,
          ),
          initial: const BiomechanicsValue(
            initialHeight: 1.15,
            finalHeight: 1.15,
            initialInertia: 0,
            minimumInertia: 0,
            timeToMinimumInertia: 0,
            timeToFinalInertia: 0,
            initialRotation: 0,
            initialAngularVelocity: 0,
            groundReactionForce: 0,
            pushoffTime: 0,
          ),
        );
    }
  }
}
