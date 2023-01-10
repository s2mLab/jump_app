import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/material.dart';

class ValuePicker extends StatefulWidget {
  const ValuePicker.horizontal({
    super.key,
    required this.min,
    required this.max,
    required this.initial,
    required this.position,
    this.height,
    this.width,
    required this.textSize,
    required this.unit,
    required this.precision,
    this.color = Colors.black,
    this.onValueChanged,
  }) : isHorizontal = true;

  const ValuePicker.vertical({
    super.key,
    required this.min,
    required this.max,
    required this.initial,
    required this.position,
    this.height,
    this.width,
    required this.textSize,
    required this.unit,
    required this.precision,
    this.color = Colors.black,
    this.onValueChanged,
  }) : isHorizontal = false;

  final bool isHorizontal;
  final double min;
  final double max;
  final double initial;

  final double textSize;
  final Offset position;
  final double? height;
  final double? width;
  final Color color;

  final int precision;
  final String unit;

  final Function(double)? onValueChanged;

  @override
  State<ValuePicker> createState() => _ValuePickerState();
}

class _ValuePickerState extends State<ValuePicker> {
  late double _currentValue = widget.initial;

  void _onChanged(value) {
    if (widget.onValueChanged != null) widget.onValueChanged!(value);

    _currentValue = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.width == null && widget.height == null) ||
        (widget.width != null && widget.height != null)) {
      throw '[width] or [height] must be provided';
    }
    final deviceSize = MediaQuery.of(context).size;

    return Positioned(
        left: 0,
        bottom: 0,
        child: SizedBox(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: widget.isHorizontal
                ? [
                    Positioned(
                        left: widget.position.dx,
                        right: deviceSize.width -
                            widget.width! -
                            widget.position.dx,
                        bottom: widget.position.dy,
                        top: deviceSize.height -
                            widget.position.dy -
                            widget.textSize * 2.3,
                        child: _buildText()),
                    Positioned(
                        left: widget.position.dx,
                        right: deviceSize.width -
                            widget.width! -
                            widget.position.dx,
                        bottom: widget.position.dy,
                        top: deviceSize.height -
                            widget.position.dy -
                            deviceSize.width * 0.010,
                        child: _buildSlider()),
                  ]
                : [
                    Positioned(
                      left: widget.position.dx,
                      bottom: widget.position.dy,
                      top: deviceSize.height -
                          widget.height! -
                          widget.position.dy,
                      child: _buildText(),
                    ),
                    Positioned(
                      left: widget.position.dx,
                      bottom: widget.position.dy,
                      top: deviceSize.height -
                          widget.height! -
                          widget.position.dy +
                          widget.textSize,
                      child: _buildSlider(),
                    ),
                  ],
          ),
        ));
  }

  SizedBox _buildSlider() {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: SfSliderTheme(
        data: SfSliderThemeData(
          thumbRadius: deviceSize.width * 0.015,
          overlayRadius: deviceSize.width * 0.025,
          activeTrackHeight: deviceSize.width * 0.010,
          inactiveTrackHeight: deviceSize.width * 0.008,
        ),
        child: widget.height != null
            ? SfSlider.vertical(
                min: widget.min,
                max: widget.max,
                activeColor: widget.color,
                inactiveColor: widget.color.withAlpha(50),
                value: _currentValue,
                onChanged: _onChanged,
              )
            : SfSlider(
                min: widget.min,
                max: widget.max,
                activeColor: widget.color,
                inactiveColor: widget.color.withAlpha(50),
                value: _currentValue,
                onChanged: _onChanged,
              ),
      ),
    );
  }

  Text _buildText() {
    return Text(
      '${_currentValue.toStringAsFixed(widget.precision)} ${widget.unit}',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: widget.color,
          fontWeight: FontWeight.bold,
          fontSize: widget.textSize),
    );
  }
}
