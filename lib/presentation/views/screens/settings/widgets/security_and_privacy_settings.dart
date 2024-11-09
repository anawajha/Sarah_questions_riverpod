import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/widgets/settings_section_header.dart';

class SecurityAndPrivacySettings extends StatelessWidget {
  const SecurityAndPrivacySettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SettingsSectionHeader(
        title: TransManager.securityAndPrivacy.tr,
      ),
      8.spaceY,
      InkWell(
        onTap: () => Get.toNamed(Routes.changePassword),
        borderRadius: 8.radius,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 10.w, end: 10.w, top: 6.h, bottom: 6.h),
          child: Row(
            children: [
              Icon(
                Iconsax.security_safe,
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
              12.spaceX,
              Expanded(
                  child: Text(
                TransManager.changePassword.tr,
                style: Theme.of(context).textTheme.labelLarge,
              ))
            ],
          ),
        ),
      )
    ]);
  }
}
