import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'helpers.dart';

class MixedTooltip extends StatelessWidget {
  const MixedTooltip({
    super.key,
    required this.child,
    required this.message,
    this.helpTitle,
    this.helpText,
    this.onEditTap,
  });

  final Widget child;
  final String message;

  final String? helpTitle;
  final String? helpText;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    final isPhone = !kIsWeb && (Platform.isAndroid || Platform.isIOS);
    final hasHelp = helpTitle != null || helpText != null;
    helperCallback() => showHelp(context, title: helpTitle, content: helpText);

    return Tooltip(
      triggerMode: onEditTap != null
          ? TooltipTriggerMode.manual
          : TooltipTriggerMode.tap,
      message: message,
      child: hasHelp || onEditTap != null
          ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap:
                    onEditTap ?? (!isPhone && hasHelp ? helperCallback : null),
                onLongPress: hasHelp && (onEditTap != null || isPhone)
                    ? helperCallback
                    : null,
                child: child,
              ),
            )
          : child,
    );
  }
}
