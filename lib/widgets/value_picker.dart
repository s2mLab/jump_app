import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter/material.dart';

class ValuePicker extends StatefulWidget {
  const ValuePicker({
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
  });

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
    debugPrint(_currentValue.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.width == null && widget.height == null) ||
        (widget.width != null && widget.height != null)) {
      throw '[width] or [height] must be provided';
    }

    return Positioned(
      left: widget.position.dx,
      bottom: widget.position.dy,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Text(
              '${_currentValue.toStringAsFixed(widget.precision)} ${widget.unit}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.color,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.textSize),
            ),
          ),
          SizedBox(
            height: widget.height,
            width: widget.width,
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
        ],
      ),
    );
  }
}
