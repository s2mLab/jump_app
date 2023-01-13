import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'mixed_tooptip.dart';

class ValuePickerRotation extends StatefulWidget {
  const ValuePickerRotation({
    super.key,
    required this.title,
    required this.units,
    required this.precision,
    required this.position,
    required this.size,
    this.textOffset = const Offset(0, 0),
    required this.textStyle,
    required this.min,
    required this.max,
    required this.initial,
    required this.color,
    this.onChange,
    this.tooltip,
    this.helpTitle,
    this.helpText,
  });

  final Widget? title;
  final Widget? units;
  final String? tooltip;
  final String? helpTitle;
  final String? helpText;
  final int precision;
  final Color color;
  final double min;
  final double max;
  final double initial;
  final Offset position;
  final double size;
  final Offset textOffset;
  final TextStyle textStyle;
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

    return SizedBox(
      width: deviceSize.width,
      height: deviceSize.height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Positioned(
            right: deviceSize.width -
                widget.position.dx -
                deviceSize.width * 0.04 -
                widget.textOffset.dx,
            bottom: widget.position.dy + widget.size / 3 + widget.textOffset.dy,
            child: MixedTooltip(
              message: widget.tooltip ?? '',
              helpTitle: widget.helpTitle,
              helpText: widget.helpText,
              child: Row(
                children: [
                  if (widget.title != null) widget.title!,
                  Text(
                    '${widget.title != null ? ' = ' : ''}'
                    '${_currentValue.toStringAsFixed(widget.precision)}',
                    textAlign: TextAlign.right,
                    style: widget.textStyle,
                  ),
                  if (widget.units != null) widget.units!,
                ],
              ),
            ),
          ),
          Positioned(
            left: widget.position.dx,
            bottom: widget.position.dy,
            child: SizedBox(
              width: widget.size,
              height: widget.size / 2,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    startAngle: 200,
                    endAngle: -20,
                    showLabels: false,
                    showTicks: false,
                    radiusFactor: 1,
                    axisLineStyle: AxisLineStyle(
                        thickness: trackWidth,
                        color: widget.color.withAlpha(50)),
                    minimum: widget.min,
                    maximum: widget.max,
                    onAxisTapped: _changeValue,
                    pointers: [
                      MarkerPointer(
                        markerHeight: markerSize,
                        markerWidth: markerSize,
                        color: widget.color,
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
                        color: widget.color,
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
