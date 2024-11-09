import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static final Constants _instance = Constants._();
  factory Constants ()=> _instance;

  final String font = 'sans_arabic_plain';
  final Size designSize = const Size(393, 913);
  final String englishLangCode = 'en';
  final String arabicLangCode = 'ar';

  final String urlUserPlaceholder = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT4uVTJhuKhJh6BHreiEga4rQLSmDATuUrtg&usqp=CAU';
}