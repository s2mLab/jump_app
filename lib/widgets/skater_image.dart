import 'package:flutter/material.dart';
import '/providers/locale_text.dart';

import 'airborne_trajectory.dart';
import 'center_of_mass.dart';
import 'double_heads_arrow.dart';
import 'ground_reaction_force.dart';
import 'line.dart';

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
  double _t0Height = 0.100;
  double _tfHeight = 0.115;

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    final w = widget.width ?? MediaQuery.of(context).size.width;

    // Precompute some widget positions on the screen
    final floor = 0.12 * w;
    final jumpHeigh = 0.100 * w;

    final comStart = Offset(0.265 * w, -floor - _t0Height * w);
    final comSliderPosition = Offset(0.175 * w, floor);
    final comSliderHeight = 0.20 * w;
    final comFinal = Offset(0.791 * w, -floor - _tfHeight * w);
    final comMid = Offset(
        (comStart.dx + comFinal.dx) / 2, (comStart.dy + comFinal.dy) / 2);
    final comSize = 0.011 * w;

    final grfArrow = Offset(0.280 * w, -floor - 0.270 * w);
    final grfSliderPosition = Offset(0.210 * w, floor + 0.180 * w);
    final grfSliderHeight = 0.200 * w;

    final pushOff = 0.05 * w;
    final land = 0.95 * w;

    final arrowsHeadSize = 0.023 * w;
    final arrowsBelow = -floor + 0.07 * w;

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
            radius: comSize,
            floor: floor,
            withPicker: true,
            pickerPosition: comSliderPosition,
            pickerHeight: comSliderHeight,
            textSize: arrowsHeadSize,
          ),
          CenterOfMass(
            comFinal,
            radius: comSize,
            floor: floor,
            withPicker: false,
          ),
          GroundReactionForce(
            arrowHead: grfArrow,
            arrowHeadSize: arrowsHeadSize,
            sliderPosition: grfSliderPosition,
            sliderHeight: grfSliderHeight,
            floor: floor,
          ),
          AirboneTrajectory(start: comStart, end: comFinal, height: jumpHeigh),
          DoubleHeadsArrow(
            start: Offset(comMid.dx, -floor),
            end: Offset(comMid.dx, comMid.dy - jumpHeigh),
            headSize: arrowsHeadSize,
            color: const Color.fromARGB(255, 31, 120, 165),
          ),
          Line(
              start: Offset(0, -floor), end: Offset(w, -floor), strokeWidth: 1),
          DoubleHeadsArrow(
            title: texts.pushoffPhase,
            fontSize: arrowsHeadSize,
            start: Offset(pushOff, arrowsBelow),
            end: Offset(comStart.dx, arrowsBelow),
            headSize: arrowsHeadSize,
            color: const Color.fromARGB(255, 128, 8, 162),
          ),
          DoubleHeadsArrow(
            title: texts.aerialPhase,
            start: Offset(comStart.dx, arrowsBelow),
            end: Offset(comFinal.dx, arrowsBelow),
            headSize: arrowsHeadSize,
            color: const Color.fromARGB(255, 31, 120, 165),
          ),
          DoubleHeadsArrow(
            title: texts.aerialPhase,
            start: Offset(comFinal.dx, arrowsBelow),
            end: Offset(land, arrowsBelow),
            headSize: arrowsHeadSize,
            color: const Color.fromARGB(255, 8, 0, 239),
          ),
        ],
      ),
    );
  }
}
