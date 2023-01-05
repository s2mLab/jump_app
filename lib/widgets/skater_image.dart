import 'package:flutter/material.dart';

import 'airborne_trajectory.dart';
import 'center_of_mass.dart';
import 'double_arrows.dart';
import 'ground_reaction_force.dart';
import 'line.dart';
import 'value_picker.dart';

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
    final w = widget.width ?? MediaQuery.of(context).size.width;

    // Precompute some widget positions on the screen
    final jumpHeigh = 0.100 * w;
    final comStart = Offset(0.265 * w, -_t0Height * w);
    final comSliderPosition = Offset(0.175 * w, 0 * w);
    final comSliderHeight = 0.20 * w;
    final comFinal = Offset(0.791 * w, -_tfHeight * w);
    final midPointCom = Offset(
        (comStart.dx + comFinal.dx) / 2, (comStart.dy + comFinal.dy) / 2);
    final grfArrow = Offset(0.280 * w, -0.270 * w);
    final grfSliderPosition = Offset(0.210 * w, 0.180 * w);
    final grfSliderHeight = 0.200 * w;
    final comSize = 0.011 * w;
    final arrowTipSize = 0.023 * w;

    return SizedBox(
      width: w,
      height: 0.4 * w,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset('assets/images/key_frames_axel.png'),
          CenterOfMass(comStart, radius: comSize),
          ValuePicker(
            min: 1,
            max: 1.5,
            initial: 1.15,
            position: comSliderPosition,
            height: comSliderHeight,
            color: const Color(0xff63aa65),
            textSize: arrowTipSize,
            unit: 'm',
            precision: 2,
          ),
          CenterOfMass(comFinal, radius: comSize),
          ...groundReactionForce(
            arrowTip: grfArrow,
            arrowTipSize: arrowTipSize,
            sliderPosition: grfSliderPosition,
            sliderHeight: grfSliderHeight,
          ),
          AirboneTrajectory(start: comStart, end: comFinal, height: jumpHeigh),
          DoubleArrows(
            start: Offset(midPointCom.dx, 0),
            end: Offset(midPointCom.dx, midPointCom.dy - jumpHeigh),
            tipSize: arrowTipSize,
            color: const Color.fromARGB(255, 31, 120, 165),
          ),
          Line(start: const Offset(0, 0), end: Offset(w, 0), strokeWidth: 1),
        ],
      ),
    );
  }
}
