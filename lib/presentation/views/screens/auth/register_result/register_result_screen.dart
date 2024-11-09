import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/image_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';

class RegisterResultScreen extends StatelessWidget {
  const RegisterResultScreen({super.key, required this.iconPath, required this.label, required this.topic});

  final String iconPath;
  final String label;
  final String topic;

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Image.asset(ImageManager().splashBackground, fit: BoxFit.cover, width: Get.width, height: Get.height,),
            Padding(
              padding: 38.paddingH,
              child: Center(
                child: SizedBox(
                  height: 317.h,
                  child: Stack(alignment: AlignmentDirectional.topCenter, children: [
                          Column(
                            children: [
                              const Spacer(),
                              Material(
                                elevation: 5,
                                borderRadius: 30.radius,
                                color: Theme.of(context).colorScheme.surface,
                                child: SizedBox(
                                  height: 261.h,
                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 86.h, left: 22.w, right: 22.w, bottom: 30.h),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    double.infinity.spaceX,
                                                    Text(label, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).primaryColor),),
                                                    10.spaceY,
                                                    Text(topic, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 15.sp), textAlign: TextAlign.center,)
                                                  ],
                                                ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(iconPath, width: 105.w, height: 105,)
                          ]),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}