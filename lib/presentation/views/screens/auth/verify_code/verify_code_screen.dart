import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/config/svg_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/auth/forget_password_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/verify_code/widgets/app_code_text_field.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/widgets/auth_widgets_container.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_long_rich_text.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_rich_text.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            left: false,
            right: false,
            top: false,
            child: GetBuilder<ForgetPasswordController>(
              builder: (logic) {
                return AuthWidgetsContainer(children: [
                  Text(TransManager.verifyIdentity.tr,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.center),
                  21.spaceY,
                  Icon(
                    Iconsax.security_safe,
                    size: 45.w,
                    color: Theme.of(context).primaryColor,
                  ),
                  19.spaceY,
                  AppLongRichText(
                    strings: [
                      TransManager.verifyIdentityHintPart1,
                      TransManager.verifyIdentityHintPart2,
                      TransManager.verifyIdentityHintPart3
                    ]
                  ),
                  30.spaceY,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Focus(
                        child: SizedBox(
                          height: 70.h,
                          child: Row(
                            children: [
                              AppCodeTextField(
                                controller: logic.tecCode1,
                                isFirst: true
                              ),
                              14.spaceX,
                              AppCodeTextField(
                                controller: logic.tecCode2
                              ),
                              14.spaceX,
                              AppCodeTextField(
                                controller: logic.tecCode3
                              ),
                              14.spaceX,
                              AppCodeTextField(
                                controller: logic.tecCode4
                              ),
                              14.spaceX,
                              AppCodeTextField(
                                controller: logic.tecCode5
                              ),
                              14.spaceX,
                              AppCodeTextField(
                                controller: logic.tecCode6,
                                isLast: true,
                                onFinish: ()=> logic.checkCode()
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(TransManager.resendCode.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          fontSize: 11.sp,
                                          color: Theme.of(context).primaryColor))),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                logic.resendCounter ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 11.sp,
                                        color: Theme.of(context).primaryColor),
                              ),
                              1.spaceX,
                              SvgPicture.asset(
                                SvgManager().timer,
                                width: 14.w,
                                height: 14.w,
                              )
                            ],
                          )
                        ],
                      ),
                      44.spaceY,
                      AppRichText(
                          first: TransManager.iHaveRememberedMyPassword,
                          last: TransManager.login,
                          onPressed: ()=> Get.close(2)),
                    ],
                  )
                ]);
              }
            )));
  }
}
