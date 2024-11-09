import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/localization_service.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/widgets/language_item.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/widgets/settings_section_header.dart';

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SettingsSectionHeader(
        title: TransManager.language.tr,
      ),
      8.spaceY,
      ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) =>
              LanguageItem(language: LocalizationService.langs[index]),
          separatorBuilder: (context, index) => 8.spaceY,
          itemCount: LocalizationService.langs.length)
    ]);
  }
}
