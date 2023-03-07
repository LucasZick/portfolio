import 'package:flutter/material.dart';

class Configs with ChangeNotifier {
  bool isDark;
  String language;

  Configs({this.isDark = false, required this.language});

  set changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }

  set changeDarkMode(value) {
    isDark = value;
    notifyListeners();
  }

  void invertDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }
}
