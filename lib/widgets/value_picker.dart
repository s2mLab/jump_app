import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter/material.dart';

class ValuePicker extends StatefulWidget {
  const ValuePicker({
    super.key,
    required this.min,
    required this.max,
    required this.initial,
    required this.position,
    required this.height,
    required this.textSize,
    required this.unit,
    required this.precision,
    this.color = Colors.black,
  });

  final double min;
  final double max;
  final double initial;

  final double textSize;
  final Offset position;
  final double height;
  final Color color;

  final int precision;
  final String unit;

  @override
  State<ValuePicker> createState() => _ValuePickerState();
}

class _ValuePickerState extends State<ValuePicker> {
  late double _currentValue = widget.initial;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx,
      bottom: widget.position.dy,
      child: Stack(
        children: [
          Text(
            '${_currentValue.toStringAsFixed(widget.precision)} ${widget.unit}',
            style: TextStyle(
                color: widget.color,
                fontWeight: FontWeight.bold,
                fontSize: widget.textSize),
          ),
          SizedBox(
            height: widget.height,
            child: SfSlider.vertical(
              min: widget.min,
              max: widget.max,
              activeColor: widget.color,
              inactiveColor: widget.color.withAlpha(50),
              value: _currentValue,
              onChanged: (value) {
                _currentValue = value;
                debugPrint(_currentValue.toString());
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
