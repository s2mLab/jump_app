import 'package:flutter/material.dart';
import 'value_picker.dart';

class CenterOfMass extends StatelessWidget {
  const CenterOfMass(
    this.position, {
    super.key,
    required this.radius,
    this.floor = 0,
    required this.withPicker,
    this.pickerPosition,
    this.pickerHeight,
    this.textSize,
  });

  final Offset position;
  final double radius;
  final double floor;
  final bool withPicker;
  final Offset? pickerPosition;
  final double? pickerHeight;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    if (withPicker) {
      if (pickerPosition == null || pickerHeight == null || textSize == null) {
        throw '[pickerPosition], [pickerHeight] and [textSize] must be provided '
            'if [withPicker] is set to true';
      }
    }

    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          if (withPicker)
            ValuePicker(
              min: 1,
              max: 1.5,
              initial: 1.15,
              position: pickerPosition!,
              height: pickerHeight!,
              color: const Color(0xff63aa65),
              textSize: textSize!,
              unit: 'm',
              precision: 2,
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
