import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      fontSize: 36.sp);

  TextStyle get displayMedium => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,  
      fontSize: 32.sp);

  TextStyle get displaySmall =>TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700, 
      fontSize: 28.sp);


  TextStyle get headlineLarge => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,   
      fontSize: 24.sp);

  TextStyle get headlineMedium => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,   
      fontSize: 20.sp);

 TextStyle get headlineSmall => TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w700,
      fontSize: 18.sp);


  TextStyle get titleLarge =>TextStyle(
      color: ColorManager().onBackground,
      fontFamily: Constants().font,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp);

  TextStyle get titleMedium => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w600,
      fontFamily: Constants().font,
      fontSize: 14.sp);

  TextStyle get titleSmall => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w600,
      fontFamily: Constants().font,
      fontSize: 12.sp);


  TextStyle get labelLarge => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w500,
      fontFamily: Constants().font,
      fontSize: 16.sp);

  TextStyle get labelMedium => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w500,
      fontFamily: Constants().font,
      fontSize: 14.sp);

  TextStyle get labelSmall => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w500,
      fontFamily: Constants().font,
      fontSize: 12.sp);


  TextStyle get bodyLarge =>TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w400,
      fontFamily: Constants().font,
      fontSize: 16.sp);

  TextStyle get bodyMedium => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w400,
      fontFamily: Constants().font,
      fontSize: 14.sp);

  TextStyle get bodySmall => TextStyle(
      color: ColorManager().onBackground,
      fontWeight: FontWeight.w400,
      fontFamily: Constants().font,
      fontSize: 12.sp);
}