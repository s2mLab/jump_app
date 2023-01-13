import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import 'aerial_phase.dart';
import 'airborne_trajectory.dart';
import 'background_image.dart';
import 'center_of_mass.dart';
import 'flight_apex.dart';
import 'flight_inertia.dart';
import 'floor.dart';
import 'ground_reaction_force.dart';
import 'header.dart';
import 'initial_velocity.dart';
import 'landing_phase.dart';
import 'maximal_rotation_velocity.dart';
import 'initial_state_rotation.dart';
import 'pushoff_phase.dart';
import 'total_rotation.dart';

class SkaterImage extends StatefulWidget {
  const SkaterImage(
    this.backgroundPath, {
    Key? key,
    this.width,
  }) : super(key: key);

  final String backgroundPath;
  final double? width;

  @override
  State<SkaterImage> createState() => _SkaterImageState();
}

class _SkaterImageState extends State<SkaterImage> {
  @override
  Widget build(BuildContext context) {
    final w = widget.width ?? MediaQuery.of(context).size.width;
    final appParameters = AppParameters.of(context);
    final isRotation = appParameters.type == AppType.rotation;
    final isTranslation = !isRotation;
    final level = appParameters.level;

    // Precompute some widget positions on the screen
    final floor = 0.11 * w;
    final jumpHeigh = 0.100 * w;

    final comStart = Offset(0.265 * w, -floor - 0.100 * w);
    final comSliderStartPosition = Offset(comStart.dx - 0.08 * w, floor);
    final comFinal = Offset(0.791 * w, -floor - 0.115 * w);
    final comSliderFinalPosition = Offset(comFinal.dx - 0.08 * w, floor);
    final comSliderHeight = 0.15 * w;
    final comMid = Offset(
        (comStart.dx + comFinal.dx) / 2, (comStart.dy + comFinal.dy) / 2);
    final comSize = 0.011 * w;
    final rotationPosition =
        Offset(comFinal.dx - 0.1 * w, comFinal.dy - 0.1 * w);
    final maximalRotationPosition =
        Offset(comMid.dx - 0.07 * w, comFinal.dy - 0.15 * w);

    final initialRotationSliderPosition = Offset(0.17 * w, 0.15 * w + floor);
    final initialRotationSliderSize = 0.20 * w;
    final initialVelocitySliderPosition = Offset(0.17 * w, 0.2 * w + floor);
    final initialVelocitySliderSize = 0.20 * w;
    final initialVelocityPosition = Offset(0.265 * w, -floor - 0.100 * w);
    final inertiaSliderPosition = Offset(0.3 * w, 0.30 * w + floor);
    final inertiaSliderSize = 0.10 * w;

    final minimumInertiaSliderPosition = Offset(0.7 * w, 0.30 * w + floor);
    final minimumInertiaSliderSize = 0.10 * w;
    final timeToMinimumInertiaSliderPosition =
        Offset(0.29 * w, 0.04 * w + floor);
    final timeToMinimumInertiaSliderSize = 0.200 * w;

    final grfArrow = Offset(0.280 * w, -floor - 0.270 * w);
    final grfSliderPosition = Offset(0.21 * w, floor + 0.18 * w);
    final grfSliderHeight = 0.200 * w;

    final pushoff = 0.05 * w;
    final pushoffSliderPosition = Offset(0.017 * w, 0.02 * w);
    final pushoffSliderWidth = 0.25 * w;
    final land = 0.95 * w;

    final arrowsBelow = -floor + 0.033 * w;

    return SizedBox(
      width: w,
      height: 0.55 * w,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          const Header(),
          BackgoundImage(floor: floor, imagePath: widget.backgroundPath),
          if (isTranslation)
            GroundReactionForce(
              arrowHead: grfArrow,
              sliderPosition: grfSliderPosition,
              sliderHeight: grfSliderHeight,
              floor: floor,
            ),
          if (isTranslation)
            InitialVelocity(position: initialVelocityPosition, norm: w * 0.1),
          if (isTranslation)
            CenterOfMass(
              comStart,
              type: CenterOfMassType.start,
              radius: comSize,
              floor: floor,
              withPicker: true,
              pickerPosition: comSliderStartPosition,
              pickerHeight: comSliderHeight,
            ),
          if (isTranslation)
            CenterOfMass(
              comFinal,
              type: CenterOfMassType.end,
              radius: comSize,
              floor: floor,
              withPicker: level != DetailLevel.easy,
              pickerPosition: comSliderFinalPosition,
              pickerHeight: comSliderHeight,
            ),
          AirboneTrajectory(start: comStart, end: comFinal, height: jumpHeigh),
          if (isRotation)
            MaximalRotationVelocity(position: maximalRotationPosition),
          FlightApex(
              apex: Offset(comMid.dx, comMid.dy - jumpHeigh), floor: floor),
          TotalRotation(position: rotationPosition),
          if (isRotation)
            FlightInertia(
              inertiaSliderPosition: minimumInertiaSliderPosition,
              inertiaSliderSize: minimumInertiaSliderSize,
              timeToInertiaSliderPosition: timeToMinimumInertiaSliderPosition,
              timeToInertiaSliderSize: timeToMinimumInertiaSliderSize,
            ),
          Floor(floor: floor),
          if (isTranslation)
            PushoffPhase(
              pushoff: pushoff,
              arrowsBelow: arrowsBelow,
              comStart: comStart,
              pushoffSliderPosition: pushoffSliderPosition,
              pushoffSliderWidth: pushoffSliderWidth,
            ),
          AerialPhase(
            comStart: comStart,
            arrowsBelow: arrowsBelow,
            comFinal: comFinal,
          ),
          if (!isTranslation && !isRotation)
            LandingPhase(
                comFinal: comFinal, arrowsBelow: arrowsBelow, land: land),
          if (isRotation)
            PreJumpRotation(
              initialRotationSliderPosition: initialRotationSliderPosition,
              initialRotationSliderSize: initialRotationSliderSize,
              initialVelocitySliderPosition: initialVelocitySliderPosition,
              initialVelocitySliderSize: initialVelocitySliderSize,
              inertiaSliderPosition: inertiaSliderPosition,
              inertiaSliderSize: inertiaSliderSize,
            ),
        ],
      ),
    );
  }
}
