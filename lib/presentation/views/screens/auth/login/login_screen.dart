import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/app/utils/validator.dart';
import 'package:sarahah_questions/presentation/controllers/auth/login_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/widgets/auth_widgets_container.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_rich_text.dart';
import 'package:sarahah_questions/presentation/views/widgets/labeled_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      left: false,
      right: false,
      child: GetBuilder<LoginController>(
          builder: (logic) {
            return Form(
              key: logic.formKey,
              child: AuthWidgetsContainer(
                children: [
                  Text(
                    TransManager.login.tr,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  24.spaceY,
                  LabeledTextField(
                    controller: logic.tecUsername,
                    label: TransManager.emailAddress.tr,
                    hint: TransManager.emailAddress.tr,
                    prefixIcon: const Icon(Iconsax.profile_tick5),
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.emailAddress,
                    validator: Validator.instance.validateName,
                  ),
                  20.spaceY,
                  LabeledTextField(
                    controller: logic.tecPassword,
                    label: TransManager.password.tr,
                    hint: TransManager.password.tr,
                    prefixIcon: const Icon(Iconsax.lock5),
                    suffixIcon: IconButton(
                      onPressed: () => logic.changePasswordVisibility(),
                      icon: Icon(logic.visiblePassword
                          ? Iconsax.eye_slash5
                          : Iconsax.eye4),
                    ),
                    inputAction: TextInputAction.done,
                    inputType: TextInputType.visiblePassword,
                    obscureText: logic.visiblePassword,
                    validator: Validator.instance.emptyValidator,
                  ),
                  20.spaceY,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () =>
                              Get.toNamed(Routes.forgetPassword),
                          child: Text(TransManager.forgotPassword.tr)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(TransManager.rememberMe.tr),
                          Transform.scale(
                              scale: 0.5,
                              child: Switch.adaptive(
                                  value: logic.rememberMe,
                                  onChanged: (v) =>
                                      logic.changeRememberMeStatus()))
                        ],
                      )
                    ],
                  ),
                  32.spaceY,
                  ElevatedButton(
                    onPressed: () => logic.login(),
                    child: Text(TransManager.login.tr),
                  ),
                  15.spaceY,
                  AppRichText(
                    first: TransManager.dontHaveRehlaAccount,
                    last: TransManager.createNewAccount,
                    onPressed: () {
                      // MyGetUtils()
                      //     .find(RegisterController())
                      //     .cleanRegisterForm();
                      Get.toNamed(Routes.register);
                    },
                  )
                ],
              ),
            );
          }),
    ));
  }
}
