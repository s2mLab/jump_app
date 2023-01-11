import 'package:flutter/material.dart';

class TextWithSuperscript extends StatelessWidget {
  const TextWithSuperscript(
    this.text1,
    this.text2, {
    super.key,
    this.textAlign,
    this.textStyle,
  });

  final String text1;
  final String text2;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: textStyle,
        children: [
          TextSpan(
            text: text1,
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: const Offset(0.0, -7.0),
              child: Text(
                text2,
                style:
                    textStyle?.copyWith(fontSize: textStyle!.fontSize! * 3 / 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
