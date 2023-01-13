import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/app_type.dart';
import '/models/detail_level.dart';
import '/models/jump_app_theme.dart';
import '/models/jump_description.dart';
import 'biomechanics.dart';
import 'locale_text.dart';

export '/models/app_type.dart';
export '/models/detail_level.dart';
export '/models/jump_description.dart';

class AppParameters with ChangeNotifier {
  /// This is the entry point to use any of the Theme as all the values need to
  /// be updated using the of(context)
  static AppParameters of(BuildContext context, {bool listen = true}) {
    final instance = Provider.of<AppParameters>(context, listen: listen);
    instance.theme.windowWidth = MediaQuery.of(context).size.width;
    instance.texts = LocaleText.of(context, listen: listen);
    return instance;
  }

  JumpAppTheme theme = JumpAppTheme();
  late LocaleText texts;

  JumpDescription _jumpDescription = JumpDescription.axel;
  JumpDescription get jumpDescription => _jumpDescription;
  void setJumpDescription(BuildContext context, value) {
    _jumpDescription = value;
    Biomechanics.of(context).setValues(jumpDescription.bounds.initial);
    notifyListeners();
  }

  DetailLevel _level = DetailLevel.medium;
  DetailLevel get level => _level;
  void setLevel(BuildContext context, value) {
    _level = value;
    Biomechanics.of(context).level = value;
    notifyListeners();
  }

  AppType _appType = AppType.translation;
  AppType get type => _appType;
  set type(value) {
    _appType = value;
    notifyListeners();
  }
}
