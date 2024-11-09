import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/extensions/string.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/auth/forget_password_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/widgets/auth_widgets_container.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_long_rich_text.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_rich_text.dart';
import 'package:sarahah_questions/presentation/views/widgets/labeled_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          left: false,
          right: false,
          top: false,
          child: GetBuilder<ForgetPasswordController>(
              builder: (logic) {
                return AuthWidgetsContainer(
                    // children: [AuthLoadingWidget()],
                    children: [
                      Text(TransManager.resetPassword.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center),
                      21.spaceY,
                      Icon(
                        Iconsax.security_safe,
                        size: 45.w,
                        color: Theme.of(context).primaryColor,
                      ),
                      17.spaceY,
                      AppLongRichText(
                        strings: [
                          TransManager.resetPasswordHintPart1,
                          TransManager.resetPasswordHintPart2,
                          TransManager.resetPasswordHintPart3
                        ],
                      ),
                      25.spaceY,
                      Form(
                        key: logic.emailFormKey,
                        child: LabeledTextField(
                          controller: logic.tecEmail,
                          label: TransManager.emailAddress.tr,
                          hint: TransManager.emailAddress.tr,
                          prefixIcon: const Icon(Iconsax.sms5),
                          inputType: TextInputType.emailAddress,
                          validator: (txt) =>
                              txt.isEmail ? null : TransManager.invalidEmail.tr,
                        ),
                      ),
                      28.spaceY,
                      ElevatedButton(
                          onPressed: () => logic.sendCode(),
                          child: Text(TransManager.continue_.tr)),
                      13.spaceY,
                      AppRichText(
                          first: TransManager.iHaveRememberedMyPassword,
                          last: TransManager.login,
                          onPressed: () => Get.back())
                    ]);
              })),
    );
  }
}
