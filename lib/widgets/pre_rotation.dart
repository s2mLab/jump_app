import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '/providers/locale_text.dart';

class PreRotation extends StatefulWidget {
  const PreRotation({
    super.key,
    required this.position,
    required this.size,
    required this.floor,
    required this.fontSize,
  });

  final Offset position;
  final double size;
  final double fontSize;
  final double floor;

  @override
  State<PreRotation> createState() => _PreRotationState();
}

class _PreRotationState extends State<PreRotation> {
  double _currentValue = 0;

  void _changeValue(valueChanging) {
    _currentValue = valueChanging.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final deviceSize = MediaQuery.of(context).size;
    final trackWidth = deviceSize.width * 0.01;
    final markerSize = deviceSize.width * 0.03;
    const color = Colors.amber;

    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
              right: deviceSize.width -
                  widget.position.dx +
                  deviceSize.width * 0.01,
              bottom: widget.position.dy + widget.floor + widget.size / 8,
              child: Text(
                texts.preRotation,
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: widget.fontSize),
              )),
          Positioned(
            left: widget.position.dx,
            bottom: widget.position.dy + widget.floor - widget.size / 2,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 0,
                    showLabels: false,
                    showTicks: false,
                    radiusFactor: 1,
                    axisLineStyle: AxisLineStyle(thickness: trackWidth),
                    minimum: 0,
                    maximum: 360,
                    onAxisTapped: _changeValue,
                    pointers: [
                      MarkerPointer(
                        markerHeight: markerSize,
                        markerWidth: markerSize,
                        color: Colors.amber,
                        markerType: MarkerType.circle,
                        value: _currentValue,
                        onValueChanging: _changeValue,
                        enableDragging: true,
                      )
                    ],
                    ranges: [
                      GaugeRange(
                        startValue: 0,
                        endValue: _currentValue,
                        color: Colors.amber,
                        startWidth: trackWidth,
                        endWidth: trackWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   left: widget.position.dx,
          //   right: deviceSize.width - widget.size - widget.position.dx,
          //   bottom: -widget.floor,
          //   //top: 0,
          //   //top: deviseSize.height - widget.size - 0.55 * deviseSize.width,
          //   // top: deviseSize.height -
          //   //     widget.position.dy -
          //   //     widget.size -
          //   //     0.13 * deviseSize.width,
          //   child:
          //   SfRadialGauge(
          //     axes: [
          //       RadialAxis(
          //         startAngle: 180,
          //         endAngle: 0,
          //         showLabels: false,
          //         showTicks: false,
          //         radiusFactor: 1,
          //         axisLineStyle: AxisLineStyle(thickness: trackWidth),
          //         minimum: 0,
          //         maximum: 360,
          //         onAxisTapped: _changeValue,
          //         pointers: [
          //           MarkerPointer(
          //             markerHeight: markerSize,
          //             markerWidth: markerSize,
          //             color: Colors.amber,
          //             markerType: MarkerType.circle,
          //             value: _currentValue,
          //             onValueChanging: _changeValue,
          //             enableDragging: true,
          //           )
          //         ],
          //         ranges: [
          //           GaugeRange(
          //             startValue: 0,
          //             endValue: _currentValue,
          //             color: Colors.amber,
          //             startWidth: trackWidth,
          //             endWidth: trackWidth,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
