import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '/providers/app_parameters.dart';
import 'mixed_tooptip.dart';

class ValuePickerRotation extends StatelessWidget {
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
    required this.value,
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
  final double value;
  final Offset position;
  final double size;
  final Offset textOffset;
  final TextStyle textStyle;
  final Function(double)? onChange;

  void _changeValue(valueChanging) {
    if (onChange != null) onChange!(valueChanging.value);
  }

  @override
  Widget build(BuildContext context) {
    final app = AppParameters.of(context);
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
                position.dx -
                deviceSize.width * 0.04 -
                textOffset.dx,
            bottom: position.dy + size / 3 + textOffset.dy,
            child: MixedTooltip(
              message: tooltip ?? '',
              helpTitle: helpTitle,
              helpText: helpText,
              child: Row(
                children: [
                  if (title != null) title!,
                  Text(
                    '${title != null ? '${app.texts.colon} ' : ''}'
                    '${value.toStringAsFixed(precision)}',
                    textAlign: TextAlign.right,
                    style: textStyle,
                  ),
                  if (units != null) units!,
                ],
              ),
            ),
          ),
          Positioned(
            left: position.dx,
            bottom: position.dy,
            child: SizedBox(
              width: size,
              height: size / 2,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    startAngle: 200,
                    endAngle: -20,
                    showLabels: false,
                    showTicks: false,
                    radiusFactor: 1,
                    axisLineStyle: AxisLineStyle(
                        thickness: trackWidth, color: color.withAlpha(50)),
                    minimum: min,
                    maximum: max,
                    onAxisTapped: _changeValue,
                    pointers: [
                      MarkerPointer(
                        markerHeight: markerSize,
                        markerWidth: markerSize,
                        color: color,
                        markerType: MarkerType.circle,
                        value: value,
                        onValueChanging: _changeValue,
                        enableDragging: true,
                      )
                    ],
                    ranges: [
                      GaugeRange(
                        startValue: 0,
                        endValue: value,
                        color: color,
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
