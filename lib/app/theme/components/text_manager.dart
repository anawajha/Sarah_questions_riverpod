import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/theme/color_manager.dart';
import 'package:flutter/material.dart';

class TextManager{
  static final TextManager _instance = TextManager._();
  TextManager._();
  factory TextManager()=> _instance;

  TextStyle get displayLarge => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,   
      fontSize: 36);

  TextStyle get displayMedium => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,  
      fontSize: 32);

  TextStyle get displaySmall =>TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700, 
      fontSize: 28);


  TextStyle get headlineLarge => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,   
      fontSize: 24);

  TextStyle get headlineMedium => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,   
      fontSize: 20);

 TextStyle get headlineSmall => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,
      fontSize: 18);


  TextStyle get titleLarge =>TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w600,
      fontSize: 16);

  TextStyle get titleMedium => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w600,
      fontFamily: Constants().font,
      fontSize: 14);

  TextStyle get titleSmall => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w600,
      fontFamily: Constants().font,
      fontSize: 12);


  TextStyle get labelLarge => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w500,
      fontFamily: Constants().font,
      fontSize: 16);

  TextStyle get labelMedium => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w500,
      fontFamily: Constants().font,
      fontSize: 14);

  TextStyle get labelSmall => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w500,
      fontFamily: Constants().font,
      fontSize: 12);


  TextStyle get bodyLarge =>TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w400,
      fontFamily: Constants().font,
      fontSize: 16);

  TextStyle get bodyMedium => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w400,
      fontFamily: Constants().font,
      fontSize: 14);

  TextStyle get bodySmall => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w400,
      fontFamily: Constants().font,
      fontSize: 12);
}