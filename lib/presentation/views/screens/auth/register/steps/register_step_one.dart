import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/extensions/string.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/auth/register_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/labeled_text_form_field.dart';

class RegisterStepOne extends StatelessWidget {
  const RegisterStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (logic) {
        return Form(
          key: logic.stepOneFormKey,
          child: Column(
            children: [
              LabeledTextField(
                controller: logic.tecFirstName,
                label: TransManager.firstName.tr,
                hint: TransManager.firstName.tr,
                prefixIcon: const Icon(Iconsax.profile_tick5),
                inputAction: TextInputAction.next,
                inputType: TextInputType.name,
                validator: (txt) => txt.isName ? null : TransManager.enterYourFirstName.tr
              ),
              20.spaceY,
              LabeledTextField(
                controller: logic.tecMiddleName,
                label: TransManager.middleName.tr,
                hint: TransManager.middleName.tr,
                prefixIcon: const Icon(Iconsax.profile_tick5),
                inputAction: TextInputAction.next,
                inputType: TextInputType.name,
                validator: (txt) => txt.value.isNotEmpty ? null : TransManager.middleNameIsRequired.tr
              ),
              20.spaceY,
              LabeledTextField(
                controller: logic.tecLastName,
                label: TransManager.lastName.tr,
                hint: TransManager.lastName.tr,
                prefixIcon: const Icon(Iconsax.profile_tick5),
                inputAction: TextInputAction.next,
                inputType: TextInputType.name,
                validator: (txt) => txt.isName ? null : TransManager.enterYourLastName.tr
              ),
              20.spaceY,
              LabeledTextField(
                controller: logic.tecPhone,
                label: TransManager.phoneNumber.tr,
                hint: TransManager.phoneNumber.tr,
                prefixIcon: const Icon(Iconsax.call5),
                inputAction: TextInputAction.next,
                inputType: TextInputType.number,
                digitsOnly: true,
                validator: (txt) => txt.isPhoneNumber ? null : TransManager.invalidPhoneNumber.tr
              )
            ],
          ),
        );
      }
    );
  }
}
