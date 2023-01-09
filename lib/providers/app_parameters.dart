import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/app_type.dart';
import '/models/detail_level.dart';

export '/models/app_type.dart';
export '/models/detail_level.dart';

class AppParameters with ChangeNotifier {
  static AppParameters of(BuildContext context, {bool listen = true}) =>
      Provider.of<AppParameters>(context, listen: listen);

  DetailLevel _level = DetailLevel.medium;
  DetailLevel get level => _level;
  set level(value) {
    _level = value;
    notifyListeners();
  }

  AppType _appType = AppType.translation;
  AppType get type => _appType;
  set type(value) {
    _appType = value;
    notifyListeners();
  }
}
