import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleText with ChangeNotifier {
  LocaleText({required this.language});

  void setLanguage(language) {
    this.language = language;
    notifyListeners();
  }

  String language;

  static LocaleText of(BuildContext context, {bool listen = true}) {
    return Provider.of<LocaleText>(context, listen: listen);
  }

  String get template => {'en': 'Template', 'fr': 'Canevas'}[language]!;

  String get pushoffPhase =>
      {'en': 'Pushoff phase', 'fr': 'Phase de propulsion'}[language]!;
  String get aerialPhase =>
      {'en': 'Aerial phase', 'fr': 'Phase aérienne'}[language]!;
  String get landing => {'en': 'Landing', 'fr': 'Atterrissage'}[language]!;
  String get flight => {'en': 'Flight', 'fr': 'Vol'}[language]!;
}
