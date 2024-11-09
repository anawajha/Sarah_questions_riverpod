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

class RegisterStepThree extends StatelessWidget {
  const RegisterStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (logic) {
      return Column(
        children: [
          DropDownLabeledTextField(
            controller: logic.tecCarBrand,
            width: Get.width - 116.w,
            label: TransManager.carBrand.tr,
            hint: TransManager.selectCarBrand.tr,
            onSelect: (p0) {
              logic.changeSelectedCarType(typeId: p0);
            },
            items: logic.carTypes
                .map(
                  (e) => DropdownMenuEntry(
                    value: e.id,
                    label: e.name,
                  ),
                )
                .toList(),
            prefixIcon: Iconsax.car,
          ),
          20.spaceY,
          DropDownLabeledTextField(
            controller: logic.tecCarModel,
            width: Get.width - 116.w,
            label: TransManager.carModel.tr,
            hint: TransManager.selectCarModel.tr,
            prefixIcon: Iconsax.category_2,
            onSelect: (p0) {
              logic.changeSelectedCarModel(modelId: p0);
            },
            items: logic.carModels
                .map(
                  (e) => DropdownMenuEntry(
                    value: e.id,
                    label: e.model,
                  ),
                )
                .toList(),
          ),
          20.spaceY,
          DropDownLabeledTextField(
            controller: logic.tecCarColor,
            width: Get.width - 116.w,
            label: TransManager.carColor.tr,
            hint: TransManager.selectCarColor.tr,
            onSelect: (p0) {
              logic.changeSelectedCarColor(colorId: p0);
            },
            items: logic.carColors
                .map(
                  (e) => DropdownMenuEntry(
                    value: e.id,
                    label: e.name,
                  ),
                )
                .toList(),
            prefixIcon: Iconsax.colorfilter,
          ),
          20.spaceY,
          LabeledTextField(
            controller: logic.tecEmail,
            label: TransManager.emailAddress.tr,
            hint: TransManager.emailAddress.tr,
            prefixIcon: const Icon(Iconsax.sms5),
            inputAction: TextInputAction.next,
            inputType: TextInputType.emailAddress,
            validator: (txt) =>
                txt.isEmail ? null : TransManager.invalidEmail.tr,
          ),
          20.spaceY,
          LabeledTextField(
            controller: logic.tecPassword,
            label: TransManager.password.tr,
            hint: TransManager.password.tr,
            prefixIcon: const Icon(Iconsax.lock5),
            suffixIcon: IconButton(
                onPressed: () => logic.changePasswordVisibility(),
                icon: Icon(
                    logic.visiblePassword ? Iconsax.eye_slash5 : Iconsax.eye4)),
            inputAction: TextInputAction.next,
            inputType: TextInputType.visiblePassword,
            obscureText: logic.visiblePassword,
            validator: (txt) =>
                txt.isPassword ? null : TransManager.weakPassword.tr,
          )
        ],
      );
    });
  }
}
