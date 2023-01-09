enum AppType {
  translation,
  rotation,
}

extension AppTypeExtension on AppType {
  AppType get swap {
    switch (this) {
      case AppType.translation:
        return AppType.rotation;
      case AppType.rotation:
        return AppType.translation;
    }
  }
}
