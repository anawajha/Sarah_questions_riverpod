import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/domain/entities/language.dart';

import 'ar.dart';
import 'en.dart';

class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': En.singleton.keys,
        'ar': Ar.singleton.keys,
      };

  static final List<AppLanguage> langs = [
    AppLanguage(locale : const Locale('ar'), name : TransManager.arabic),
    AppLanguage(locale : const Locale('en'), name : TransManager.english),
  ];

  static AppLanguage getLanguageByCode(String code) => langs.firstWhere((lang) => lang.locale.languageCode == code);

  static List<Locale> get allLocales => langs.map((e) => e.locale).toList();
}
