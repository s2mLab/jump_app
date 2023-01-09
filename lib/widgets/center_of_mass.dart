import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/locale_text.dart';
import 'text_with_index.dart';
import 'value_picker.dart';

enum CenterOfMassType {
  any,
  start,
  end,
}

class CenterOfMass extends StatelessWidget {
  const CenterOfMass(
    this.position, {
    required this.type,
    super.key,
    required this.radius,
    this.floor = 0,
    required this.withPicker,
    this.pickerPosition,
    this.pickerHeight,
    this.textSize,
  });

  final CenterOfMassType type;
  final Offset position;
  final double radius;
  final double floor;
  final bool withPicker;
  final Offset? pickerPosition;
  final double? pickerHeight;
  final double? textSize;

  void _updateHeight(BuildContext context, double value) {
    final biomechanics = Biomechanics.of(context);
    if (type == CenterOfMassType.start) {
      biomechanics.initialHeigh = value;
    } else if (type == CenterOfMassType.end) {
      biomechanics.finalHeigh = value;
    } else {
      throw 'Wrong update height type';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (withPicker) {
      if (pickerPosition == null || pickerHeight == null || textSize == null) {
        throw '[pickerPosition], [pickerHeight] and [textSize] must be provided '
            'if [withPicker] is set to true';
      }

      if (type == CenterOfMassType.any) {
        throw '[withPicker] necessitate a [type]';
      }
    }
    if (type != CenterOfMassType.any && textSize == null) {
      throw '[textSize] must be provided if [title] is not null';
    }

    final biomechanics = Biomechanics.of(context);
    final deviceSize = MediaQuery.of(context).size;
    final texts = LocaleText.of(context);

    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          if (withPicker)
            ValuePicker.vertical(
              min: 1,
              max: 1.5,
              initial: type == CenterOfMassType.start
                  ? biomechanics.initialHeight
                  : biomechanics.finalHeight,
              position: pickerPosition!,
              height: pickerHeight!,
              color: const Color(0xff63aa65),
              textSize: textSize!,
              unit: 'm',
              precision: 2,
              onValueChanged: type != CenterOfMassType.any
                  ? (value) => _updateHeight(context, value)
                  : null,
            ),
          if (type != CenterOfMassType.any)
            Positioned(
              left: position.dx - deviceSize.width * 0.04,
              bottom: -(position.dy - floor) / 2,
              child: Tooltip(
                  message: type == CenterOfMassType.start
                      ? texts.h0Tooltip
                      : texts.hfTooltip,
                  child: TextWithIndex(
                    'H',
                    type == CenterOfMassType.start ? '0' : 'F',
                    textAlign: TextAlign.end,
                    textStyle: TextStyle(
                      color: const Color(0xff63aa65),
                      fontWeight: FontWeight.bold,
                      fontSize: textSize!,
                    ),
                  )),
            ),
          CustomPaint(painter: _CenterOfMassPainting(position, radius, floor)),
        ],
      ),
    );
  }
}

class _CenterOfMassPainting extends CustomPainter {
  const _CenterOfMassPainting(this.position, this.radius, this.floor);

  final Offset position;
  final double radius;
  final double floor;

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = const Color(0xff63aa65)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    canvas.drawCircle(position, radius, painter);
    canvas.drawLine(position, Offset(position.dx, -floor), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
