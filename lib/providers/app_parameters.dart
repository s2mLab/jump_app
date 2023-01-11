import 'package:flutter/material.dart';
import 'biomechanics.dart';
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
