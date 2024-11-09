import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/domain/entities/theme.dart';
import 'package:sarahah_questions/presentation/controllers/settings/settings_controller.dart';

class ThemeItem extends StatelessWidget{
  const ThemeItem({
    super.key,
    required this.theme,
  });

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (logic) {
        return InkWell(
          onTap: () => logic.changeThemeMode(theme),
          borderRadius: 8.radius,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: Row(
              children: [
                Radio(
                    value: theme.mode.name,
                    groupValue: logic.lss.theme.mode.name,
                    onChanged: null),
                Expanded(
                    child: Text(
                  theme.name.tr,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 15.sp, fontWeight : (logic.lss.theme.mode.name == theme.mode.name) ? FontWeight.w500 : FontWeight.w300, color: (logic.lss.theme.mode.name == theme.mode.name) ? Theme.of(context).primaryColor : null),
                ))
              ],
            ),
          ),
        );
      }
    );
  }
}
