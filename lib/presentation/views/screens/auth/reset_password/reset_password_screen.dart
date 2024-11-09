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

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: GetBuilder<ForgetPasswordController>(builder: (logic) {
            return Form(
              key: logic.newPasswordFormKey,
              child: AuthWidgetsContainer(
                // children : [
                //   ResetPasswordSuccessMessage()
                // ]
                children: [
                Text(TransManager.createNewPassword.tr,
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
                AppLongRichText(strings: [
                  TransManager.createNewPasswordHintPart1,
                  TransManager.createNewPasswordHintPart2,
                  TransManager.createNewPasswordHintPart3
                ]),
                40.spaceY,
                LabeledTextField(
                  controller: logic.tecNewPassword,
                  label: TransManager.newPassword.tr,
                  hint: TransManager.newPassword.tr,
                  prefixIcon: const Icon(Iconsax.lock5),
                  suffixIcon: IconButton(
                      onPressed: () => logic.changePasswordVisibility(),
                      icon: Icon(logic.visiblePassword
                          ? Iconsax.eye_slash5
                          : Iconsax.eye4)),
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  obscureText: logic.visiblePassword,
                  validator: (txt)=> txt.isPassword ? null : TransManager.weakPassword.tr,
                ),
                20.spaceY,
                LabeledTextField(
                  controller: logic.tecConfirmNewPassword,
                  label: TransManager.confirmNewPassword.tr,
                  hint: TransManager.confirmNewPassword.tr,
                  prefixIcon: const Icon(Iconsax.lock5),
                  suffixIcon: IconButton(
                      onPressed: () => logic.changeConfirmPasswordVisibility(),
                      icon: Icon(logic.visibleConfirmPassword
                          ? Iconsax.eye_slash5
                          : Iconsax.eye4)),
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  obscureText: logic.visibleConfirmPassword,
                  validator: (txt) => txt.value == logic.tecNewPassword.text.value ? null : TransManager.twoPasswordsDoesNotMatch.tr,
                ),
                35.spaceY,
                ElevatedButton(
                    onPressed: () => logic.resetPassword(), child: Text(TransManager.resetPassword.tr)),
                11.spaceY,
                AppRichText(
                    first: TransManager.iHaveRememberedMyPassword,
                    last: TransManager.login,
                    onPressed: ()=> Get.close(3)),
              ]
              ),
            );
          })),
    );
  }
}
