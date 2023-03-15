import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Configs with ChangeNotifier {
  bool isDark;

  Configs({this.isDark = false});

  set changeDarkMode(value) {
    isDark = value;
    notifyListeners();
  }

  void changeLanguage(
    Locale locale,
    BuildContext context,
  ) async {
    await context.setLocale(locale);
    notifyListeners();
  }

  void invertDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }
}
