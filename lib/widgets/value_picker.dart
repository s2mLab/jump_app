import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/material.dart';

enum _Direction { horizontal, vertical, diagonal }

class ValuePicker extends StatefulWidget {
  const ValuePicker.horizontal({
    super.key,
    this.title,
    required this.min,
    required this.max,
    required this.initial,
    required this.position,
    this.height,
    this.width,
    this.textOffset = const Offset(0, 0),
    required this.textStyle,
    required this.unit,
    required this.precision,
    this.color = Colors.black,
    this.onValueChanged,
    this.tooltip,
  }) : _direction = _Direction.horizontal;

  const ValuePicker.vertical({
    super.key,
    this.title,
    required this.min,
    required this.max,
    required this.initial,
    required this.position,
    this.height,
    this.width,
    this.textOffset = const Offset(0, 0),
    required this.textStyle,
    required this.unit,
    required this.precision,
    this.color = Colors.black,
    this.onValueChanged,
    this.tooltip,
  }) : _direction = _Direction.vertical;

  const ValuePicker.diagonal({
    super.key,
    this.title,
    required this.min,
    required this.max,
    required this.initial,
    required this.position,
    this.height,
    this.width,
    this.textOffset = const Offset(0, 0),
    required this.textStyle,
    required this.unit,
    required this.precision,
    this.color = Colors.black,
    this.onValueChanged,
    this.tooltip,
  }) : _direction = _Direction.diagonal;

  final _Direction _direction;
  final double min;
  final double max;
  final double initial;

  final TextStyle textStyle;
  final Offset textOffset;
  final Offset position;
  final double? height;
  final double? width;
  final Color color;

  final int precision;
  final String unit;
  final Widget? title;
  final String? tooltip;

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

    late final List<Widget> children;
    switch (widget._direction) {
      case (_Direction.horizontal):
        children = _buildHorizontal(deviceSize);
        break;

      case (_Direction.vertical):
        children = _buildVertical(deviceSize);
        break;

      case (_Direction.diagonal):
        children = _buildDiagonal(deviceSize);
        break;
    }

    return Positioned(
        left: 0,
        bottom: 0,
        child: SizedBox(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: children,
          ),
        ));
  }

  List<Widget> _buildHorizontal(Size deviceSize) {
    final fontSize = widget.textStyle.fontSize!;

    return [
      Positioned(
          left: widget.position.dx,
          right: deviceSize.width - widget.width! - widget.position.dx,
          bottom: widget.position.dy,
          top: deviceSize.height - widget.position.dy - fontSize * 2.3,
          child: _buildText()),
      Positioned(
          left: widget.position.dx,
          right: deviceSize.width - widget.width! - widget.position.dx,
          bottom: widget.position.dy,
          top:
              deviceSize.height - widget.position.dy - deviceSize.width * 0.010,
          child: _buildSlider()),
    ];
  }

  List<Widget> _buildVertical(Size deviceSize) {
    final fontSize = widget.textStyle.fontSize!;

    return [
      Positioned(
        left: widget.position.dx + widget.textOffset.dx,
        bottom: widget.position.dy +
            widget.height! -
            fontSize * 2 -
            widget.textOffset.dy,
        top: deviceSize.height - widget.height! - widget.position.dy,
        child: _buildText(),
      ),
      Positioned(
        left: widget.position.dx,
        bottom: widget.position.dy,
        top: deviceSize.height - widget.height! - widget.position.dy + fontSize,
        child: _buildSlider(),
      ),
    ];
  }

  List<Widget> _buildDiagonal(Size deviceSize) {
    final length = widget.width ?? widget.height!;
    final fontSize = widget.textStyle.fontSize!;

    return [
      Positioned(
        right: deviceSize.width - widget.position.dx,
        bottom: widget.position.dy + fontSize - deviceSize.width * 0.01,
        top: deviceSize.height - length / 2 - widget.position.dy,
        child: _buildText(),
      ),
      Positioned(
        left: widget.position.dx,
        bottom: widget.position.dy,
        top: deviceSize.height - length - widget.position.dy + fontSize,
        child: Transform.rotate(angle: -45, child: _buildSlider()),
      ),
    ];
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

  Widget _buildText() {
    return Tooltip(
      message: widget.tooltip ?? '',
      child: Row(
        children: [
          if (widget.title != null) widget.title!,
          Text(
            '${widget.title != null ? ' = ' : ''}'
            '${_currentValue.toStringAsFixed(widget.precision)} '
            '${widget.unit}',
            textAlign: TextAlign.center,
            style: widget.textStyle.copyWith(color: widget.color),
          ),
        ],
      ),
    );
  }
}
