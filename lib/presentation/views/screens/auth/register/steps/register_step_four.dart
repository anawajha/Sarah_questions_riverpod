import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/auth/register_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/pick_image_dialog.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_icon_button.dart';

class RegisterStepFour extends StatelessWidget {
  const RegisterStepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (logic) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w),
                child: Text(
                  TransManager.personalPicture.tr,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.start,
                )),
            double.infinity.spaceX,
            14.spaceY,
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Material(
                    color: Theme.of(context).colorScheme.onPrimary,
                    elevation: 15,
                    shadowColor:
                        Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                    clipBehavior: Clip.antiAlias,
                    shape: const OvalBorder(),
                    child: Padding(
                      padding: 2.padding,
                      child: CircleAvatar(
                        radius: 77.5.w,
                        foregroundImage: logic.profileImage != null ? FileImage(logic.profileImage!) : null,
                        backgroundColor: Theme.of(context).colorScheme.outline,
                        child: 
                         Icon(
                          Iconsax.profile_tick5,
                          size: 80.w,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ),
                    ),
                  ),
                  AppIconButton(
                    icon: Iconsax.gallery,
                    onPressed: () =>
                        Get.dialog(PickImageDialog(onFilePicked: (file) async => logic.pickProfileImage(file))),
                    padding: 9,
                    size: 18,
                    iconColor: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ],
              ),
            )
         
          ],
        );
      }
    );
  }
}
