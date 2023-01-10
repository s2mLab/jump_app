import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ValuePickerRotation extends StatefulWidget {
  const ValuePickerRotation({
    super.key,
    required this.position,
    required this.size,
    required this.floor,
    required this.fontSize,
    required this.min,
    required this.max,
    required this.initial,
    required this.title,
    this.onChange,
  });

  final String title;
  final double min;
  final double max;
  final double initial;
  final Offset position;
  final double size;
  final double fontSize;
  final double floor;
  final Function(double)? onChange;

  @override
  State<ValuePickerRotation> createState() => _ValuePickerRotationState();
}

class _ValuePickerRotationState extends State<ValuePickerRotation> {
  late double _currentValue = widget.initial;

  void _changeValue(valueChanging) {
    if (widget.onChange != null) widget.onChange!(valueChanging.value);

    _currentValue = valueChanging.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
            right:
                deviceSize.width - widget.position.dx - deviceSize.width * 0.04,
            bottom: widget.position.dy + widget.floor + widget.size / 4,
            child: Text(
              '${widget.title} = ${_currentValue.toStringAsFixed(0)}°',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.fontSize),
            ),
          ),
          Positioned(
            left: widget.position.dx,
            bottom: widget.position.dy + widget.floor,
            child: SizedBox(
              width: widget.size,
              height: widget.size / 2,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 0,
                    showLabels: false,
                    showTicks: false,
                    radiusFactor: 1,
                    axisLineStyle: AxisLineStyle(thickness: trackWidth),
                    minimum: widget.min,
                    maximum: widget.max,
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
        ],
      ),
    );
  }
}
