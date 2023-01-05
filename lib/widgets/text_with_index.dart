import 'package:flutter/material.dart';

class TextWithIndex extends StatelessWidget {
  const TextWithIndex(
    this.text1,
    this.text2, {
    super.key,
    this.textStyle,
  });

  final String text1;
  final String text2;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text1,
          style: textStyle,
        ),
        Text(
          text2,
          style: textStyle?.copyWith(fontSize: textStyle!.fontSize! * 2 / 3),
        ),
      ],
    );
  }
}
