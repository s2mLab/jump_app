import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/providers/biomechanics.dart';
import 'mixed_tooptip.dart';
import 'text_with_subscript.dart';
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
      biomechanics.finalHeight = value;
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

    final biomechanics = Biomechanics.of(context, listen: true);
    final app = AppParameters.of(context);
    final deviceSize = MediaQuery.of(context).size;
    final tooltip = type == CenterOfMassType.start
        ? app.texts.h0Tooltip
        : app.texts.hfTooltip;

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
              color: app.theme.colorParametersCenterOfMass,
              textStyle: app.theme.textStyle,
              textOffset: Offset(-deviceSize.width * 0.05, 0),
              title: type == CenterOfMassType.any
                  ? null
                  : TextWithSubscript(
                      'H',
                      type == CenterOfMassType.start ? '0' : 'F',
                      textAlign: TextAlign.end,
                      textStyle: app.theme.textStyle.copyWith(
                          color: app.theme.colorParametersCenterOfMass),
                    ),
              unit: Text('m',
                  style: app.theme.textStyle
                      .copyWith(color: app.theme.colorParametersCenterOfMass)),
              precision: 2,
              onValueChanged: type != CenterOfMassType.any
                  ? (value) => _updateHeight(context, value)
                  : null,
              tooltip: tooltip,
            ),
          if (!withPicker)
            Positioned(
              left: position.dx + deviceSize.width * 0.02,
              bottom: -position.dy,
              child: Container(
                decoration:
                    BoxDecoration(color: app.theme.colorAnswer.withAlpha(30)),
                padding: const EdgeInsets.all(2),
                child: MixedTooltip(
                  message: tooltip,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWithSubscript(
                        'H',
                        type == CenterOfMassType.start ? '0' : 'F',
                        textAlign: TextAlign.end,
                        textStyle: app.theme.textStyleAnswer,
                      ),
                      Text(
                          ' = ${biomechanics.finalHeight.toStringAsFixed(2)} m',
                          style: app.theme.textStyleAnswer),
                    ],
                  ),
                ),
              ),
            ),
          CustomPaint(
            painter: _CenterOfMassPainting(
              position,
              radius,
              floor,
              app.theme.colorParametersCenterOfMass,
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
