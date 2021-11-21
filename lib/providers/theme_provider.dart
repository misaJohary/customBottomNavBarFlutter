import 'dart:math';

import 'package:flutter/material.dart';

final Color primaryCyan = Color.fromRGBO(13, 210, 217, 1.0);
final Color accentCyan = Colors.cyanAccent;
// final Color lightCyan = Colors.cyan.withOpacity(0.3);

ThemeData cyanTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFEFF3F6),
  primaryColor: primaryCyan,
  accentColor: accentCyan,
  appBarTheme: AppBarTheme(
    color: primaryCyan,
  ),
);

final Color primaryPink = Colors.pink;
final Color accentPink = Colors.pinkAccent;

ThemeData pinkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFEFF3F6),
  primaryColor: primaryPink,
  accentColor: accentPink,
  appBarTheme: AppBarTheme(
    color: primaryPink,
  ),
);

final Color primaryOrange = Colors.orange;
final Color accentOrange = Colors.orangeAccent;

ThemeData orangeTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFEFF3F6),
  primaryColor: primaryOrange,
  accentColor: accentOrange,
  appBarTheme: AppBarTheme(
    color: primaryOrange,
  ),
);

final Color primaryGrey = Colors.grey;
final Color accentGrey = Colors.blueGrey;

ThemeData greyTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFEFF3F6),
  primaryColor: primaryGrey,
  accentColor: accentGrey,
  appBarTheme: AppBarTheme(
    color: primaryGrey,
  ),
);

final Color primaryPurple = Colors.purple;
final Color accentPurple = Colors.purpleAccent;

ThemeData purpleTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFEFF3F6),
  primaryColor: primaryPurple,
  accentColor: accentPurple,
  appBarTheme: AppBarTheme(
    color: primaryPurple,
  ),
);

List<ThemeData> _themes = [
  cyanTheme,
  pinkTheme,
  orangeTheme,
  greyTheme,
  purpleTheme,
];

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = cyanTheme;

  ThemeNotifier(this._themeData);

  List<ThemeData> _themes = [
    cyanTheme,
    pinkTheme,
    orangeTheme,
    greyTheme,
    purpleTheme,
  ];

  getTheme() => _themeData;

  // getThemes() => [..._themes];

  setThemes(int index) async {
    _themeData = _themes[index];
    notifyListeners();
  }

  setTheme(ThemeData theme) async {
    _themeData = theme;
    notifyListeners();
  }
  setRandomThemes() async {
    Random random = new Random();
    _themeData = _themes[random.nextInt(5)];
    notifyListeners();
  }

  // ThemeNotifier(this._themeData);

  // setTheme(ThemeData themeData) async {
  //   _themeData = themeData;
  //   notifyListeners();
  // }
}
