import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/extensions/string.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/auth/register_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/dropdown_labeled_text_field.dart';
import 'package:sarahah_questions/presentation/views/widgets/labeled_text_form_field.dart';

class RegisterStepTwo extends StatelessWidget {
  const RegisterStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (logic) {
      return Column(
        children: [
          LabeledTextField(
            controller: logic.tecDob,
            label: TransManager.dateOfBirth.tr,
            hint: TransManager.selectDateOfBirth.tr,
            prefixIcon: const Icon(Iconsax.calendar_25),
            readOnly: true,
            onTap: () => logic.pickDate(context: context),
            validator: (txt) =>
                txt.value.isNotEmpty ? null : TransManager.selectDateOfBirth.tr,
          ),
          20.spaceY,
          DropDownLabeledTextField(
              controller: logic.tecGender,
              width: Get.width - 116.w,
              label: TransManager.gender.tr,
              hint: TransManager.selectYourGender.tr,
              prefixIcon: Iconsax.man,
              items: List.generate(
                logic.genders.length,
                (index) => DropdownMenuEntry(
                  value: logic.genders[index],
                  label: logic.genders[index].tr,
                  trailingIcon: Icon(index == 0 ? Iconsax.man : Iconsax.woman),
                ),
              )),
          20.spaceY,
          LabeledTextField(
            controller: logic.tecIdNumber,
            label: TransManager.idNumber.tr,
            hint: TransManager.idNumber.tr,
            prefixIcon: const Icon(Iconsax.user_octagon),
            inputAction: TextInputAction.next,
            inputType: TextInputType.number,
            digitsOnly: true,
          ),
          20.spaceY,
          LabeledTextField(
              controller: logic.tecDrivingLicenseNumber,
              label: TransManager.drivingLicenseNumber.tr,
              hint: TransManager.drivingLicenseNumber.tr,
              prefixIcon: const Icon(Iconsax.note_2),
              inputAction: TextInputAction.next,
              inputType: TextInputType.number,
              digitsOnly: true),
          20.spaceY,
          LabeledTextField(
              controller: logic.tecCarNumber,
              label: TransManager.carNumber.tr,
              hint: '001#',
              prefixIcon: const Icon(Iconsax.car),
              inputAction: TextInputAction.next,
              inputType: TextInputType.number,
              digitsOnly: true),
        ],
      );
    });
  }
}
