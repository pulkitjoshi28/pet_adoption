import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  secondaryHeaderColor: Colors.white,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    secondary: Colors.black,
    onBackground: Colors.white,
    onError: Colors.white,
    onSecondary: Colors.white,
    background: Colors.white,
    onSurface: Colors.white,
    surface: Colors.white,
    onPrimary: Colors.white,
    error: Colors.white,
  ),
  primaryColor: Colors.blue,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
    headline6: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
);

final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  secondaryHeaderColor: Colors.black,
  primaryColor: Colors.teal,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.black,
    secondary: Colors.white,
    onBackground: Colors.black,
    onError: Colors.black,
    onSecondary: Colors.black,
    background: Colors.black,
    onSurface: Colors.black,
    surface: Colors.black,
    onPrimary: Colors.black,
    error: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
);
