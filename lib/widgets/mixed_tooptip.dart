import 'dart:io';

import 'package:flutter/material.dart';

import 'helpers.dart';

class MixedTooltip extends StatelessWidget {
  const MixedTooltip({
    super.key,
    required this.child,
    required this.message,
    this.helpTitle,
    this.helpText,
  });

  final Widget child;
  final String message;

  final String? helpTitle;
  final String? helpText;

  @override
  Widget build(BuildContext context) {
    final isPhone = Platform.isAndroid || Platform.isIOS;
    helperCallback() => showHelp(context, title: helpTitle, content: helpText);

    return Tooltip(
      message: message,
      child: helpTitle != null || helpText != null
          ? GestureDetector(
              onTap: isPhone ? null : helperCallback,
              onLongPress: isPhone ? helperCallback : null,
              child: child,
            )
          : child,
    );
  }
}
