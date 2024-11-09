import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/auth/register_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/widgets/register_selected_step_indicators.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/widgets/auth_widgets_container.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_rich_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      left: false,
      right: false,
      child: GetBuilder<RegisterController>(
          builder: (logic) {
            return AuthWidgetsContainer(children: [
              Text(TransManager.createNewAccount.tr,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.center),
              24.spaceY,
              logic.steps[logic.selectedStepIndex],
              36.spaceY,
              const RegisterSelectedStepIndicators(),
              16.spaceY,
              ElevatedButton(
                onPressed: () => logic.selectedStepIndex < 4
                    ? logic.changeSelectedStep()
                    : logic.createAccount(),
                child: Text(logic.selectedStepIndex < 4
                    ? TransManager.next.tr
                    : TransManager.createNewAccount.tr),
              ),
              14.spaceY,
              AppRichText(
                first: TransManager.iHaveRehlaAccount,
                last: TransManager.login,
                onPressed: () => Get.back(),
              )
            ]);
          }),
    ));
  }
}
