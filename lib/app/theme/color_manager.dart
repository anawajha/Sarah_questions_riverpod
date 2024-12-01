import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instance = ColorManager._internal();

  ColorManager._internal();
  factory ColorManager() => _instance;

// light
  final Color primary = const Color(0xFF006687);
  final Color onPrimary = const Color(0xFFFFFFFF);
  final Color background = const Color(0xFFFFFFFF);
  final Color onBackground = const Color(0xFF133240);
  final Color secondary = const Color(0xFF0DA99C);
  final Color success = const Color(0xFF00B923);
  final Color error = const Color(0xFFC31B1B);
  final Color outline = const Color(0xFFEFEFF4);
  final Color disabled = const Color(0xFFE3E3E3);
  final Color outlineVariant = const Color(0xFFC8C7CC);

//dark
  final Color backgroundDark = const Color.fromARGB(255, 26, 38, 44);
  // final Color backgroundDark = const Color(0xFF133240);
  final Color onPrimaryDark = const Color(0xFFE8F7FE);
  final Color onBackgroundDark = const Color(0xFFE8F7FE);
}
