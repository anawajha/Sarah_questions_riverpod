import 'package:sarahah_questions/app/theme/color_manager.dart';
import 'package:sarahah_questions/app/theme/components/text_manager.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  static final AppTextTheme _instance = AppTextTheme._();
  factory AppTextTheme() => _instance;

  TextTheme get light => TextTheme(
    displayLarge: TextManager().displayLarge,
    displayMedium: TextManager().displayMedium,
    displaySmall: TextManager().displaySmall,
    headlineLarge: TextManager().headlineLarge,
    headlineMedium: TextManager().headlineMedium,
    headlineSmall: TextManager().headlineSmall,
    titleLarge: TextManager().titleLarge,
    titleMedium: TextManager().titleMedium,
    titleSmall: TextManager().titleSmall,
    labelLarge: TextManager().labelLarge,
    labelMedium: TextManager().labelMedium,
    labelSmall: TextManager().labelSmall,
    bodyLarge: TextManager().bodyLarge,
    bodyMedium: TextManager().bodyMedium,
    bodySmall: TextManager().bodySmall,
  );


    TextTheme get dark => TextTheme(
    displayLarge: TextManager().displayLarge.copyWith(color: ColorManager().onBackgroundDark),
    displayMedium: TextManager().displayMedium.copyWith(color: ColorManager().onBackgroundDark),
    displaySmall: TextManager().displaySmall.copyWith(color: ColorManager().onBackgroundDark),
    headlineLarge: TextManager().headlineLarge.copyWith(color: ColorManager().onBackgroundDark),
    headlineMedium: TextManager().headlineMedium.copyWith(color: ColorManager().onBackgroundDark),
    headlineSmall: TextManager().headlineSmall.copyWith(color: ColorManager().onBackgroundDark),
    titleLarge: TextManager().titleLarge.copyWith(color: ColorManager().onBackgroundDark),
    titleMedium: TextManager().titleMedium.copyWith(color: ColorManager().onBackgroundDark),
    titleSmall: TextManager().titleSmall.copyWith(color: ColorManager().onBackgroundDark),
    labelLarge: TextManager().labelLarge.copyWith(color: ColorManager().onBackgroundDark),
    labelMedium: TextManager().labelMedium.copyWith(color: ColorManager().onBackgroundDark),
    labelSmall: TextManager().labelSmall.copyWith(color: ColorManager().onBackgroundDark),
    bodyLarge: TextManager().bodyLarge.copyWith(color: ColorManager().onBackgroundDark),
    bodyMedium: TextManager().bodyMedium.copyWith(color: ColorManager().onBackgroundDark),
    bodySmall: TextManager().bodySmall.copyWith(color: ColorManager().onBackgroundDark),
  );
}