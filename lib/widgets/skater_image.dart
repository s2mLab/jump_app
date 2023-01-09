import 'package:flutter/material.dart';

import '/providers/locale_text.dart';
import 'aerial_phase.dart';
import 'airborne_trajectory.dart';
import 'center_of_mass.dart';
import 'double_heads_arrow.dart';
import 'flight_apex.dart';
import 'ground_reaction_force.dart';
import 'line.dart';
import 'pushoff_slider.dart';

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
          Positioned(
              left: 0,
              right: 0,
              bottom: floor,
              child: Image.asset('assets/images/key_frames_axel.png')),
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
          GroundReactionForce(
            arrowHead: grfArrow,
            arrowHeadSize: arrowsHeadSize,
            sliderPosition: grfSliderPosition,
            sliderHeight: grfSliderHeight,
            floor: floor,
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
          Line(
              start: Offset(0, -floor), end: Offset(w, -floor), strokeWidth: 1),
          DoubleHeadsArrow(
            title: texts.pushoffPhase,
            fontSize: arrowsHeadSize * 3 / 4,
            start: Offset(pushoff, arrowsBelow),
            end: Offset(comStart.dx, arrowsBelow),
            headSize: arrowsHeadSize,
            color: const Color.fromARGB(255, 128, 8, 162),
          ),
          AerialPhase(
              arrowsHeadSize: arrowsHeadSize,
              comStart: comStart,
              arrowsBelow: arrowsBelow,
              comFinal: comFinal),
          DoubleHeadsArrow(
            title: texts.landing,
            fontSize: arrowsHeadSize * 3 / 4,
            start: Offset(comFinal.dx, arrowsBelow),
            end: Offset(land, arrowsBelow),
            headSize: arrowsHeadSize,
            color: const Color.fromARGB(255, 8, 0, 239),
          ),
          PushofSlider(
            color: const Color.fromARGB(255, 128, 8, 162),
            position: pushoffSliderPosition,
            textSize: arrowsHeadSize,
            width: pushoffSliderWidth,
          ),
        ],
      ),
    );
  }
}
