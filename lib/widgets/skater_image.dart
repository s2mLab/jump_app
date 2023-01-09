import 'package:flutter/material.dart';

import '/providers/locale_text.dart';
import 'aerial_phase.dart';
import 'airborne_trajectory.dart';
import 'background_image.dart';
import 'center_of_mass.dart';
import 'flight_apex.dart';
import 'floor.dart';
import 'ground_reaction_force.dart';
import 'landing_phase.dart';
import 'pushoff_phase.dart';

class SkaterImage extends StatefulWidget {
  const SkaterImage({
    Key? key,
    this.width,
  }) : super(key: key);

  final double? width;

  @override
  State<SkaterImage> createState() => _SkaterImageState();
}

class _SkaterImageState extends State<SkaterImage> {
  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    final w = widget.width ?? MediaQuery.of(context).size.width;

    // Precompute some widget positions on the screen
    final floor = 0.12 * w;
    final jumpHeigh = 0.100 * w;

    final comStart = Offset(0.265 * w, -floor - 0.100 * w);
    final comSliderStartPosition = Offset(comStart.dx - 0.11 * w, floor);
    final comFinal = Offset(0.791 * w, -floor - 0.115 * w);
    final comSliderFinalPosition = Offset(comFinal.dx - 0.11 * w, floor);
    final comSliderHeight = 0.15 * w;
    final comMid = Offset(
        (comStart.dx + comFinal.dx) / 2, (comStart.dy + comFinal.dy) / 2);
    final comSize = 0.011 * w;

    final grfArrow = Offset(0.280 * w, -floor - 0.270 * w);
    final grfSliderPosition = Offset(0.22 * w, floor + 0.180 * w);
    final grfSliderHeight = 0.200 * w;

    final pushoff = 0.05 * w;
    final pushoffSliderPosition = Offset(0.017 * w, 0.02 * w);
    final pushoffSliderWidth = 0.25 * w;
    final land = 0.95 * w;

    final arrowsHeadSize = 0.023 * w;
    final arrowsBelow = -floor + 0.03 * w;

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      width: w,
      height: 0.5 * w,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          BackgoundImage(
              floor: floor, imagePath: 'assets/images/key_frames_axel.png'),
          GroundReactionForce(
            arrowHead: grfArrow,
            arrowHeadSize: arrowsHeadSize,
            sliderPosition: grfSliderPosition,
            sliderHeight: grfSliderHeight,
            floor: floor,
          ),
          CenterOfMass(
            comStart,
            type: CenterOfMassType.start,
            radius: comSize,
            floor: floor,
            withPicker: true,
            pickerPosition: comSliderStartPosition,
            pickerHeight: comSliderHeight,
            textSize: arrowsHeadSize,
          ),
          CenterOfMass(
            comFinal,
            type: CenterOfMassType.end,
            radius: comSize,
            floor: floor,
            withPicker: true,
            pickerPosition: comSliderFinalPosition,
            pickerHeight: comSliderHeight,
            textSize: arrowsHeadSize,
          ),
          AirboneTrajectory(start: comStart, end: comFinal, height: jumpHeigh),
          FlightApex(
            apex: Offset(comMid.dx, comMid.dy - jumpHeigh),
            floor: floor,
            arrowsHeadSize: arrowsHeadSize,
          ),
          Floor(floor: floor),
          PushoffPhase(
            texts: texts,
            arrowsHeadSize: arrowsHeadSize,
            pushoff: pushoff,
            arrowsBelow: arrowsBelow,
            comStart: comStart,
            pushoffSliderPosition: pushoffSliderPosition,
            pushoffSliderWidth: pushoffSliderWidth,
          ),
          AerialPhase(
            arrowsHeadSize: arrowsHeadSize,
            comStart: comStart,
            arrowsBelow: arrowsBelow,
            comFinal: comFinal,
          ),
          LandingPhase(
              texts: texts,
              arrowsHeadSize: arrowsHeadSize,
              comFinal: comFinal,
              arrowsBelow: arrowsBelow,
              land: land),
        ],
      ),
    );
  }
}
