import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:flutter/material.dart';

import 'mixed_tooptip.dart';

enum _Direction { horizontal, vertical, diagonal }

class ValuePicker extends StatelessWidget {
  const ValuePicker.horizontal({
    super.key,
    this.title,
    required this.min,
    required this.max,
    required this.value,
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
    this.helpTitle,
    this.helpText,
  }) : _direction = _Direction.horizontal;

  const ValuePicker.vertical({
    super.key,
    this.title,
    required this.min,
    required this.max,
    required this.value,
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
    this.helpTitle,
    this.helpText,
  }) : _direction = _Direction.vertical;

  const ValuePicker.diagonal({
    super.key,
    this.title,
    required this.min,
    required this.max,
    required this.value,
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
    this.helpTitle,
    this.helpText,
  }) : _direction = _Direction.diagonal;

  final _Direction _direction;
  final double min;
  final double max;
  final double value;

  final TextStyle textStyle;
  final Offset textOffset;
  final Offset position;
  final double? height;
  final double? width;
  final Color color;

  final int precision;
  final Widget? unit;
  final Widget? title;
  final String? tooltip;
  final String? helpTitle;
  final String? helpText;

  final Function(double)? onValueChanged;

  void _onChanged(value) {
    if (onValueChanged != null) onValueChanged!(value);
  }

  @override
  Widget build(BuildContext context) {
    if ((width == null && height == null) ||
        (width != null && height != null)) {
      throw '[width] or [height] must be provided';
    }

    final deviceSize = MediaQuery.of(context).size;

    late final List<Widget> children;
    switch (_direction) {
      case (_Direction.horizontal):
        children = _buildHorizontal(context, deviceSize);
        break;

      case (_Direction.vertical):
        children = _buildVertical(context, deviceSize);
        break;

      case (_Direction.diagonal):
        children = _buildDiagonal(context, deviceSize);
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

  List<Widget> _buildHorizontal(BuildContext context, Size deviceSize) {
    final fontSize = textStyle.fontSize!;

    return [
      Positioned(
          left: position.dx + textOffset.dx,
          right: deviceSize.width - width! - position.dx - textOffset.dx,
          bottom: position.dy + textOffset.dy,
          top: deviceSize.height - position.dy - fontSize * 2.3 - textOffset.dy,
          child: _buildText()),
      Positioned(
          left: position.dx,
          right: deviceSize.width - width! - position.dx,
          bottom: position.dy,
          top: deviceSize.height - position.dy - deviceSize.width * 0.010,
          child: _buildSlider(context)),
    ];
  }

  List<Widget> _buildVertical(BuildContext context, Size deviceSize) {
    final fontSize = textStyle.fontSize!;

    return [
      Positioned(
        left: position.dx + textOffset.dx,
        bottom: position.dy + height! - fontSize * 2 - textOffset.dy,
        top: deviceSize.height - height! - position.dy,
        child: _buildText(),
      ),
      Positioned(
        left: position.dx,
        bottom: position.dy,
        top: deviceSize.height - height! - position.dy + fontSize,
        child: _buildSlider(context),
      ),
    ];
  }

  List<Widget> _buildDiagonal(BuildContext context, Size deviceSize) {
    final length = width ?? height!;
    final fontSize = textStyle.fontSize!;

    return [
      Positioned(
        right: deviceSize.width - position.dx - textOffset.dx,
        bottom:
            position.dy + fontSize - deviceSize.width * 0.01 + textOffset.dy,
        top: deviceSize.height - length / 2 - position.dy - textOffset.dy,
        child: _buildText(),
      ),
      Positioned(
        left: position.dx,
        bottom: position.dy,
        top: deviceSize.height - length - position.dy + fontSize,
        child: Transform.rotate(angle: -45, child: _buildSlider(context)),
      ),
    ];
  }

  SizedBox _buildSlider(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      height: height,
      width: width,
      child: SfSliderTheme(
        data: SfSliderThemeData(
          thumbRadius: deviceSize.width * 0.015,
          overlayRadius: deviceSize.width * 0.025,
          activeTrackHeight: deviceSize.width * 0.010,
          inactiveTrackHeight: deviceSize.width * 0.008,
        ),
        child: height != null
            ? SfSlider.vertical(
                min: min,
                max: max,
                activeColor: color,
                inactiveColor: color.withAlpha(50),
                value: value,
                onChanged: _onChanged,
              )
            : SfSlider(
                min: min,
                max: max,
                activeColor: color,
                inactiveColor: color.withAlpha(50),
                value: value,
                onChanged: _onChanged,
              ),
      ),
    );
  }

  Widget _buildText() {
    return MixedTooltip(
      message: tooltip ?? '',
      helpTitle: helpTitle,
      helpText: helpText,
      child: Row(
        children: [
          if (title != null) title!,
          Text(
            '${title != null ? ': ' : ''}'
            '${value.toStringAsFixed(precision)} ',
            textAlign: TextAlign.center,
            style: textStyle.copyWith(color: color),
          ),
          if (unit != null) unit!,
        ],
      ),
    );
  }
}
