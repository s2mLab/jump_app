import 'dart:math';

import '/models/biomechanics_bounds.dart';

enum JumpDescription {
  axel,
  lutz,
  somersault,
}

extension JumpDescriptionExtension on JumpDescription {
  String get path {
    switch (this) {
      case (JumpDescription.axel):
        return 'assets/images/key_frames_axel3.png';
      case (JumpDescription.lutz):
        return 'assets/images/key_frames_lutz3.png';
      case (JumpDescription.somersault):
        return 'assets/images/key_frames_back_somersault3.png';
    }
  }

  String get name {
    switch (this) {
      case (JumpDescription.axel):
        return 'Axel';
      case (JumpDescription.lutz):
        return 'Lutz'; //TODO replace by toeloop
      case (JumpDescription.somersault):
        return 'Somersault';
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
            minimumInertia: 0.9,
            finalInertia: 1,
            timeToMinimumInertia: 150 / 1000,
            timeToFinalInertia: 100 / 1000,
            initialRotation: 0.15 * 2 * pi,
            initialAngularVelocity: .3 * 2 * pi,
            groundReactionForce: 1000,
            pushoffTime: 200 / 1000,
            bodyMass: 40,
          ),
          maximal: const BiomechanicsValue(
            initialHeight: 1.5,
            finalHeight: 1.5,
            initialInertia: 4,
            minimumInertia: 4,
            finalInertia: 4,
            timeToMinimumInertia: 350 / 1000,
            timeToFinalInertia: 300 / 1000,
            initialRotation: 0.35 * 2 * pi,
            initialAngularVelocity: 3 * 3 * pi,
            groundReactionForce: 2500,
            pushoffTime: 460 / 1000,
            bodyMass: 200,
          ),
          initial: const BiomechanicsValue(
            initialHeight: 1.15,
            finalHeight: 1.15,
            initialInertia: 2.1,
            minimumInertia: 1,
            finalInertia: 1.5,
            timeToMinimumInertia: 200 / 1000,
            timeToFinalInertia: 200 / 1000,
            initialRotation: 0.25 * 2 * pi,
            initialAngularVelocity: 1.5 * 2 * pi,
            groundReactionForce: 1500,
            pushoffTime: 300 / 1000,
            bodyMass: 60,
          ),
        );

      case (JumpDescription.lutz): //TODO put values for toeloop and then switch
        return BiomechanicsBounds(
          minimal: const BiomechanicsValue(
            initialHeight: 1,
            finalHeight: 1,
            initialInertia: 1,
            minimumInertia: 1,
            finalInertia: 1,
            timeToMinimumInertia: 100 / 1000,
            timeToFinalInertia: 20 / 1000,
            initialRotation: .3 * 2 * pi,
            initialAngularVelocity: 0.3 * 2 * pi,
            groundReactionForce: 1000,
            pushoffTime: 150 / 1000,
            bodyMass: 40,
          ),
          maximal: const BiomechanicsValue(
            initialHeight: 1.5,
            finalHeight: 1.5,
            initialInertia: 4,
            minimumInertia: 4,
            finalInertia: 4,
            timeToMinimumInertia: 350 / 1000,
            timeToFinalInertia: 300 / 1000,
            initialRotation: 0.7 * 2 * pi,
            initialAngularVelocity: 3 * pi * 2,
            groundReactionForce: 2000,
            pushoffTime: 400 / 1000,
            bodyMass: 200,
          ),
          initial: const BiomechanicsValue(
            initialHeight: 1.15,
            finalHeight: 1.15,
            initialInertia: 2.1,
            finalInertia: 1.5,
            minimumInertia: 1,
            timeToMinimumInertia: 250 / 1000,
            timeToFinalInertia: 60 / 1000,
            initialRotation: 0.5 * 2 * pi,
            initialAngularVelocity: 1.5 * pi * 2,
            groundReactionForce: 1500,
            pushoffTime: 300 / 1000,
            bodyMass: 57,
          ),
        );

      case (JumpDescription.somersault):
        return BiomechanicsBounds(
          minimal: const BiomechanicsValue(
            initialHeight: 1,
            finalHeight: 1,
            initialInertia: 8,
            minimumInertia: 3,
            finalInertia: 7,
            timeToMinimumInertia: 100 / 1000,
            timeToFinalInertia: 100 / 1000,
            initialRotation: 0 * 2 * pi,
            initialAngularVelocity: 0.1 * 2 * pi,
            groundReactionForce: 1000,
            pushoffTime: 150 / 1000,
            bodyMass: 40,
          ),
          maximal: const BiomechanicsValue(
            initialHeight: 1.5,
            finalHeight: 1.5,
            initialInertia: 13,
            minimumInertia: 13,
            finalInertia: 13,
            timeToMinimumInertia: 300 / 1000,
            timeToFinalInertia: 300 / 1000,
            initialRotation: 0.2 * 2 * pi,
            initialAngularVelocity: 0.8 * 2 * pi,
            groundReactionForce: 2000,
            pushoffTime: 450 / 1000,
            bodyMass: 200,
          ),
          initial: const BiomechanicsValue(
            initialHeight: 1.15,
            finalHeight: 1.15,
            initialInertia: 12,
            finalInertia: 10,
            minimumInertia: 3.5,
            timeToMinimumInertia: 200 / 1000,
            timeToFinalInertia: 200 / 1000,
            initialRotation: 0.05 * 2 * pi,
            initialAngularVelocity: 0.3 * 2 * pi,
            groundReactionForce: 1500,
            pushoffTime: 300 / 1000,
            bodyMass: 57,
          ),
        );
    }
  }
}

/*
Impulsion
Axel = 0.29-0.36s (0.44s)
Toe loop = 0.2-0.33s

Décollage —> position la plus fermé 
Axel = 0.2-0.34s
Toe loop = 0.2-0.3s

Début d’ouverture —> atterissage (premier moment où le pied touche la glace)
Axel = 0.04-0.08s
Toe loop = 0.03-0.04s
*/