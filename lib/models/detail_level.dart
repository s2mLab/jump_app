import 'package:flutter/material.dart';

import '/providers/locale_text.dart';

enum DetailLevel {
  easy,
  medium,
}

extension DetailLevelExtension on DetailLevel {
  DetailLevel get next {
    switch (this) {
      case DetailLevel.easy:
        return DetailLevel.medium;
      case DetailLevel.medium:
        return DetailLevel.easy;
    }
  }

  String asText(BuildContext context) {
    final texts = LocaleText.of(context);

    switch (this) {
      case DetailLevel.easy:
        return texts.easy;
      case DetailLevel.medium:
        return texts.medium;
    }
  }
}
