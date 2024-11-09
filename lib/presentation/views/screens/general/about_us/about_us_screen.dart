import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/svg_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/views/widgets/image_svg.dart';
import 'package:sarahah_questions/presentation/views/widgets/secondary_app_bar.dart';
import 'package:sarahah_questions/presentation/views/widgets/transparent_logo_background.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: TransManager.aboutUs.tr),
      body: Stack(
        children: [
          const TransparentLogoBackground(),
          SafeArea(child: ListView(
            padding: EdgeInsets.only(top: 40.h, bottom: 24.h, left: 24.w, right: 24.w),
            children: [
              ImageSvg(SvgManager().logo, height: 60.h, color: Theme.of(context).primaryColor),
              40.spaceY,
              Text('هذا نص تجريبي لاختبار شكل و حجم النصوص و طريقة عرضها في هذا المكان و حجم و لون الخط حيث يتم التحكم في هذا النص وامكانية تغييرة في اي وقت عن طريق ادارة الموقع . يتم اضافة هذا النص كنص تجريبي للمعاينة فقط وهو لا يعبر عن أي موضوع محدد انما لتحديد الشكل العام للقسم او الصفحة أو الموقع. هذا نص تجريبي لاختبار شكل و حجم النصوص و طريقة عرضها في هذا المكان و حجم و لون الخط حيث يتم التحكم في هذا النص وامكانية تغييرة في اي وقت عن طريق ادارة الموقع . يتم اضافة هذا النص كنص تجريبي للمعاينة فقط وهو لا يعبر عن أي موضوع محدد انما لتحديد الشكل العام للقسم او الصفحة أو الموقع.', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 15.sp, height: 1.9))
            ],
          ))
        ],
      ),
    );
  }
}