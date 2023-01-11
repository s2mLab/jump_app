import 'package:flutter/material.dart';

import '/providers/biomechanics.dart';
import '/providers/jump_app_theme.dart';
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
  });

  final CenterOfMassType type;
  final Offset position;
  final double radius;
  final double floor;
  final bool withPicker;
  final Offset? pickerPosition;
  final double? pickerHeight;

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
      if (pickerPosition == null || pickerHeight == null) {
        throw '[pickerPosition] and [pickerHeight] must be provided '
            'if [withPicker] is set to true';
      }

      if (type == CenterOfMassType.any) {
        throw '[withPicker] necessitate a [type]';
      }
    }

    final biomechanics = Biomechanics.of(context);
    final theme = JumpAppTheme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    final tooltip = type == CenterOfMassType.start
        ? theme.texts.h0Tooltip
        : theme.texts.hfTooltip;

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
              color: theme.colorParametersCenterOfMass,
              fontSize: theme.fontSize,
              unit: 'm',
              precision: 2,
              onValueChanged: type != CenterOfMassType.any
                  ? (value) => _updateHeight(context, value)
                  : null,
              tooltip: tooltip,
            ),
          if (!withPicker)
            Container(
              decoration: BoxDecoration(
                  color: theme.colorParametersCenterOfMass.withAlpha(30)),
              padding: const EdgeInsets.all(2),
              child: Tooltip(
                message: theme.texts.computedMaximalHeight,
                child: Row(
                  children: [
                    TextWithIndex('H', 'max',
                        textStyle: TextStyle(
                          color: theme.colorParametersCenterOfMass,
                          fontWeight: FontWeight.bold,
                          fontSize: theme.fontSize,
                        )),
                    Text(
                      ' = ${biomechanics.apex.toStringAsFixed(2)} m',
                      style: TextStyle(
                        color: theme.colorParametersCenterOfMass,
                        fontWeight: FontWeight.bold,
                        fontSize: theme.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (type != CenterOfMassType.any)
            Positioned(
              left: position.dx - deviceSize.width * 0.04,
              bottom: -(position.dy - floor) / 2,
              child: Tooltip(
                  message: tooltip,
                  child: TextWithIndex(
                    'H',
                    type == CenterOfMassType.start ? '0' : 'F',
                    textAlign: TextAlign.end,
                    textStyle: TextStyle(
                      color: theme.colorParametersCenterOfMass,
                      fontWeight: FontWeight.bold,
                      fontSize: theme.fontSize,
                    ),
                  )),
            ),
          CustomPaint(
            painter: _CenterOfMassPainting(
              position,
              radius,
              floor,
              theme.colorParametersCenterOfMass,
            ),
          ),
        ],
      ),
    );
  }
}

class _CenterOfMassPainting extends CustomPainter {
  const _CenterOfMassPainting(
    this.position,
    this.radius,
    this.floor,
    this.color,
  );

  final Offset position;
  final double radius;
  final double floor;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    canvas.drawCircle(position, radius, painter);
    canvas.drawLine(position, Offset(position.dx, -floor), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
