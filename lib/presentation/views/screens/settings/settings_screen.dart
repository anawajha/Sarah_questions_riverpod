import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/svg_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/settings/settings_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/widgets/language_settings.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/widgets/security_and_privacy_settings.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/widgets/theme_settings.dart';
import 'package:sarahah_questions/presentation/views/widgets/image_svg.dart';
import 'package:sarahah_questions/presentation/views/widgets/secondary_app_bar.dart';
import 'package:sarahah_questions/presentation/views/widgets/transparent_logo_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: TransManager.settings.tr),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const TransparentLogoBackground(),
          GetBuilder<SettingsController>(
              builder: (logic) {
                return SafeArea(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.w, vertical: 40.h),
                    children: [
                      ImageSvg(
                        SvgManager().settings,
                        width: 156.w,
                        height: 156.w,
                        color: Theme.of(context).primaryColor,
                      ),
                      24.spaceY,
                      const SecurityAndPrivacySettings(),
                      28.spaceY,
                      const LanguageSettings(),
                      28.spaceY,
                      const ThemeSettings(),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
