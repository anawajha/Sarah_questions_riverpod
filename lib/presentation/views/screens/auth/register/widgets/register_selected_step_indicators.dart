import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/presentation/controllers/auth/register_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/widgets/register_steps_indicator_item.dart';

class RegisterSelectedStepIndicators extends StatelessWidget {
  const RegisterSelectedStepIndicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (logic) {
      return AnimatedContainer(
        duration: kTabScrollDuration,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              logic.steps.length,
              (index) => RegisterStepsIndicatorItem(
                    selected: logic.selectedStepIndex == index,
                    onTap: ()=> logic.changeSelectedStep(index: index),
                  )),
        ),
      );
    });
  }
}
