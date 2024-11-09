import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/config/svg_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/extensions/string.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/settings/change_password_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/image_svg.dart';
import 'package:sarahah_questions/presentation/views/widgets/labeled_text_form_field.dart';
import 'package:sarahah_questions/presentation/views/widgets/secondary_app_bar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: TransManager.changePassword.tr),
      body: SafeArea(
          child: GetBuilder<ChangePasswordController>(
              builder: (logic) {
                return Form(
                  key: logic.formKey,
                  child: ListView(
                    padding: EdgeInsets.only(
                        top: 40.h, bottom: 24.h, left: 24.w, right: 24.w),
                    children: [
                      ImageSvg(
                        SvgManager().shielSecurity,
                        width: 170.w,
                        height: 170.w,
                        color: Theme.of(context).primaryColor,
                      ),
                      24.spaceY,
                      LabeledTextField(
                        controller: logic.tecCurrentPassword,
                        label: TransManager.currentPassword.tr,
                        hint: TransManager.currentPassword.tr,
                     prefixIcon: const Icon(Iconsax.lock5),
                  suffixIcon: IconButton(
                      onPressed: () => logic.changeOldPasswordVisibility(),
                      icon: Icon(logic.visibleOldPassword
                          ? Iconsax.eye_slash5
                          : Iconsax.eye4)),
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.visiblePassword,
                  obscureText: logic.visibleOldPassword,
                  validator: (txt)=> txt.value.isNotEmpty ? null : TransManager.currentPasswordIsRequired.tr,
                ),
                      20.spaceY,
                      LabeledTextField(
                  controller: logic.tecNewPassword,
                  label: TransManager.newPassword.tr,
                  hint: TransManager.newPassword.tr,
                  prefixIcon: const Icon(Iconsax.lock5),
                  suffixIcon: IconButton(
                      onPressed: () => logic.changeNewPasswordVisibility(),
                      icon: Icon(logic.visibleNewPassword
                          ? Iconsax.eye_slash5
                          : Iconsax.eye4)),
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.visiblePassword,
                  obscureText: logic.visibleNewPassword,
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
                      25.spaceY,
                      ElevatedButton(
                          onPressed: () => logic.changePassword(),
                          child: Text(TransManager.saveChanges.tr))
                    ],
                  ),
                );
              })),
    );
  }
}
