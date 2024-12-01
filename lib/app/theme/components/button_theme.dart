import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/theme/color_manager.dart';
import 'package:sarahah_questions/app/theme/components/text_manager.dart';
import 'package:flutter/material.dart';

class AppButtonTheme {
AppButtonTheme._();
static final AppButtonTheme _instance = AppButtonTheme._();
factory AppButtonTheme()=> _instance;

    ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager().primary,
        foregroundColor: ColorManager().onPrimary,
        side: BorderSide.none,
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: 30.radius
        ),
        minimumSize: Size(double.infinity, 52),
        textStyle: TextManager().labelLarge.copyWith(fontWeight: FontWeight.w700, color: ColorManager().onPrimary)
      ),);

      
    OutlinedButtonThemeData get outlinedButton => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: ColorManager().primary,
        side: BorderSide(color: ColorManager().primary),
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: 30.radius
        ),
        minimumSize: Size(double.infinity, 52),
        textStyle: TextManager().labelLarge
      ),);


    TextButtonThemeData get textButton => TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: 8.radius
        ),
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        minimumSize: Size(20, 30),
        maximumSize: Size(double.infinity, 52),
        textStyle: TextManager().labelSmall.copyWith(fontSize: 11, color: ColorManager().onPrimary)
      ),);
}