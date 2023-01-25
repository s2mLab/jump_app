class BiomechanicsValue {
  const BiomechanicsValue({
    required this.initialHeight,
    required this.finalHeight,
    required this.initialInertia,
    required this.minimumInertia,
    required this.finalInertia,
    required this.timeToMinimumInertia,
    required this.timeToFinalInertia,
    required this.initialRotation,
    required this.initialAngularVelocity,
    required this.groundReactionForce,
    required this.pushoffTime,
    required this.bodyWeight,
  });

  final double initialHeight; // m
  final double finalHeight; // m

  final double initialInertia; // kg.m^2
  final double minimumInertia; // kg.m^2
  final double finalInertia; // kg.m^2

  final double timeToMinimumInertia; // s
  final double timeToFinalInertia; // s
  final double initialRotation; // rad
  final double initialAngularVelocity; // rad/s

  final double groundReactionForce; // N
  final double pushoffTime; // s

  final double bodyWeight; // N
}

class BiomechanicsBounds {
  BiomechanicsBounds({
    required this.minimal,
    required this.maximal,
    required this.initial,
  });

  final BiomechanicsValue minimal;
  final BiomechanicsValue maximal;
  final BiomechanicsValue initial;
}
