import 'package:flutter/material.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/localization/localization_service.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/domain/entities/language.dart';
import 'package:sarahah_questions/domain/entities/theme.dart';

class SharedUtils {
  SharedUtils._();

  static final SharedUtils _instance = SharedUtils._();

  factory SharedUtils() => _instance;

  AppTheme getTheme({required String theme}) {
    late AppTheme mode;

    switch (theme) {
      case 'light':
        mode = AppTheme(
          mode: ThemeMode.light,
          name: TransManager.lightMode,
        );
        break;
      case 'dark':
        mode = AppTheme(mode: ThemeMode.dark, name: TransManager.darkMode);
        break;
      default:
        mode = AppTheme(mode: ThemeMode.system, name: TransManager.systemMode);
        break;
    }
    return mode;
  }

  AppLanguage getLocale({required String? langCode}) =>
      LocalizationService.getLanguageByCode(
          langCode ?? Constants().arabicLangCode);
}
  
