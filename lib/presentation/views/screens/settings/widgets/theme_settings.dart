import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/domain/entities/theme.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/widgets/settings_section_header.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/widgets/theme_item.dart';

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SettingsSectionHeader(
        title: TransManager.theme.tr,
      ),
      8.spaceY,
      ThemeItem(theme: AppTheme(mode: ThemeMode.light, name: TransManager.lightMode)),
      8.spaceY,
      ThemeItem(theme: AppTheme(mode: ThemeMode.dark, name: TransManager.darkMode)),
      8.spaceY,
      ThemeItem(theme: AppTheme(mode: ThemeMode.system, name: TransManager.systemMode)),
    ]);
  }
}
