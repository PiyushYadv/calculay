import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  bool isOn = false;
  void setTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
