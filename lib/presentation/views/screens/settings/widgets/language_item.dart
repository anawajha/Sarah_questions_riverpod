import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/domain/entities/language.dart';
import 'package:sarahah_questions/presentation/controllers/settings/settings_controller.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.language,
  });

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (logic) {
        return InkWell(
          onTap: () => logic.changeLanguage(language),
          borderRadius: 8.radius,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: Row(
              children: [
                Radio(
                    value: language.locale.languageCode,
                    groupValue: logic.lss.language.locale.languageCode,
                    onChanged: null),
                Expanded(
                    child: Text(
                  language.name.tr,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 15.sp, fontWeight: (logic.lss.language.locale.languageCode == language.locale.languageCode) ? FontWeight.w500 : FontWeight.w300, color: (logic.lss.language.locale.languageCode == language.locale.languageCode) ? Theme.of(context).primaryColor : null),
                ))
              ],
            ),
          ),
        );
      }
    );
  }
}
