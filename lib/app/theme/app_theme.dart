import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/theme/color_manager.dart';
import 'package:sarahah_questions/app/theme/components/button_theme.dart';
import 'package:sarahah_questions/app/theme/components/text_manager.dart';
import 'package:sarahah_questions/app/theme/components/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();
  static final AppTheme _instance = AppTheme._();
  factory AppTheme() => _instance;

  ThemeData light = ThemeData(
      useMaterial3: true,
      fontFamily: Constants().font,
      primaryColor: ColorManager().primary,
      colorScheme: ColorScheme.light(
          surface: ColorManager().background,
          onSurface: ColorManager().onBackground,
          primary: ColorManager().primary,
          secondary: ColorManager().secondary,
          outline: ColorManager().outline,
          outlineVariant: ColorManager().outlineVariant),
      elevatedButtonTheme: AppButtonTheme().elevatedButton,
      outlinedButtonTheme: AppButtonTheme().outlinedButton,
      textButtonTheme: AppButtonTheme().textButton,
      textTheme: AppTextTheme().light,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager().background,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: ColorManager().background),
        centerTitle: true,
        titleTextStyle: TextManager()
            .headlineMedium
            .copyWith(color: ColorManager().onBackground, fontWeight: FontWeight.w500)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 50,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          size: 24.w,
          color: ColorManager().primary
        ),
        unselectedIconTheme: IconThemeData(
        size: 24.w,
        color: ColorManager().outlineVariant
        )
      ),
      dividerTheme: const DividerThemeData(space: 0, thickness: 0.5),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().outline)),
        enabledBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().outline)),
        focusedBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().primary)),
        disabledBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().disabled)),
        errorBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().error)),
        outlineBorder:  BorderSide(color: ColorManager().outline),
      ),
       dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().outline)),
        enabledBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().outline)),
        focusedBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().primary)),
        disabledBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().disabled)),
        errorBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().error)),
        outlineBorder:  BorderSide(color: ColorManager().outline)
      )),
        radioTheme: RadioThemeData(
        fillColor: WidgetStatePropertyAll(ColorManager().primary)
      ),);


  ThemeData dark = ThemeData(
      useMaterial3: true,
      fontFamily: Constants().font,
      primaryColor: ColorManager().primary,
      colorScheme: ColorScheme.dark(
          primary: ColorManager().primary,
          primaryContainer: ColorManager().primary.withOpacity(0.3),
          surface: ColorManager().backgroundDark,
          onSurface: ColorManager().onBackgroundDark,
          onPrimary: ColorManager().onPrimaryDark,
          secondary: ColorManager().secondary,
          outline: ColorManager().outline,
          outlineVariant: ColorManager().outlineVariant),
      elevatedButtonTheme: AppButtonTheme().elevatedButton,
      outlinedButtonTheme: AppButtonTheme().outlinedButton,
      textButtonTheme: AppButtonTheme().textButton,
      textTheme: AppTextTheme().dark,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager().backgroundDark,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: ColorManager().backgroundDark),
          centerTitle: true,
          titleTextStyle: TextManager()
              .headlineMedium
              .copyWith(color: ColorManager().onBackgroundDark, fontWeight: FontWeight.w500)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        elevation: 50,
        selectedIconTheme: IconThemeData(
          size: 24.w,
          color: ColorManager().primary
        ),
        unselectedIconTheme: IconThemeData(
        size: 24.w
        )
      ),
      dividerTheme: const DividerThemeData(space: 0, thickness: 0.5),
       inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().outline)),
        enabledBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().outline)),
        focusedBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().primary)),
        disabledBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().disabled)),
        errorBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().error)),
        outlineBorder:  BorderSide(color: ColorManager().outline),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStatePropertyAll(ColorManager().primary)
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().outline)),
        enabledBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().outline)),
        focusedBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().primary)),
        disabledBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().disabled)),
        errorBorder: OutlineInputBorder(borderRadius: 30.radius, borderSide: BorderSide(color: ColorManager().error)),
        outlineBorder:  BorderSide(color: ColorManager().outline)
      )
      )
      );
}
