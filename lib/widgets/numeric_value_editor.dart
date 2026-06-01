import 'package:flutter/material.dart';

import '../helpers/math_helper.dart';
import '../providers/locale_text.dart';

Future<double?> showNumericValueEditor(
  BuildContext context, {
  required double value,
  required double min,
  required double max,
  required int precision,
}) async {
  final texts = LocaleText.of(context, listen: false);
  return showDialog<double>(
    context: context,
    builder: (dialogContext) => _NumericValueEditorDialog(
      initialValue: value,
      min: min,
      max: max,
      precision: precision,
      texts: texts,
    ),
  );
}

class _NumericValueEditorDialog extends StatefulWidget {
  const _NumericValueEditorDialog({
    required this.initialValue,
    required this.min,
    required this.max,
    required this.precision,
    required this.texts,
  });

  final double initialValue;
  final double min;
  final double max;
  final int precision;
  final LocaleText texts;

  @override
  State<_NumericValueEditorDialog> createState() =>
      _NumericValueEditorDialogState();
}

class _NumericValueEditorDialogState extends State<_NumericValueEditorDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller;

  double get _displayedMin => MathHelper.minimum(widget.min, widget.precision);
  double get _displayedMax => MathHelper.maximum(widget.max, widget.precision);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: MathHelper.canonical(
        widget.initialValue,
        min: widget.min,
        max: widget.max,
        precision: widget.precision,
      ).toStringAsFixed(widget.precision),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _validate(String? input) {
    final parsed = double.tryParse((input ?? '').trim().replaceAll(',', '.'));
    if (parsed == null) return widget.texts.numericValueInvalid;
    if (parsed < _displayedMin || parsed > _displayedMax) {
      return widget.texts.numericValueOutOfRange;
    }
    return null;
  }

  void _apply() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.pop(
      context,
      MathHelper.canonical(
        double.parse(_controller.text.trim().replaceAll(',', '.')),
        min: widget.min,
        max: widget.max,
        precision: widget.precision,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.texts.numericValueTitle),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          autofocus: true,
          keyboardType: TextInputType.numberWithOptions(
            decimal: widget.precision > 0,
            signed: _displayedMin < 0,
          ),
          decoration: InputDecoration(
            labelText: widget.texts.numericValueLabel,
            helperText:
                '${widget.texts.numericValueRange} '
                '${_displayedMin.toStringAsFixed(widget.precision)} - '
                '${_displayedMax.toStringAsFixed(widget.precision)}',
          ),
          validator: _validate,
          onFieldSubmitted: (_) => _apply(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(widget.texts.cancel),
        ),
        TextButton(onPressed: _apply, child: Text(widget.texts.apply)),
      ],
    );
  }
}
