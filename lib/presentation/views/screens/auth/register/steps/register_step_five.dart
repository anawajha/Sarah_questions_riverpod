import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/auth/register_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/widgets/upload_image_container_item.dart';
import 'package:sarahah_questions/presentation/views/widgets/pick_image_dialog.dart';

class RegisterStepFive extends StatelessWidget {
  const RegisterStepFive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (logic) {
        return Column(
          children: [
            UploadImageContainerItem(
                label: TransManager.idPhoto.tr,
                hint: TransManager.uploadAphotoOfYourId.tr,
                onTap: () =>
                    Get.dialog(PickImageDialog(onFilePicked: (file) async => logic.pickIdImage(file))),
                    content: logic.idImage != null ? Image.file(logic.idImage!, fit: BoxFit.cover, width: double.infinity, height: 14.h) : null,),
            20.spaceY,
            UploadImageContainerItem(
                label: TransManager.drivingLicenseImage.tr,
                hint: TransManager.uploadAphotoOfYourDrivingLicense.tr,
                onTap: () =>
                    Get.dialog(PickImageDialog(onFilePicked: (file) async => logic.pickDivingLicenseImage(file))),
                    content: logic.drivingLicenseImage != null ? Image.file(logic.drivingLicenseImage!, fit: BoxFit.cover, width: double.infinity, height: 14.h) : null),
          ],
        );
      }
    );
  }
}
