import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/views/widgets/pick_image_dialog_button.dart';

class PickImageDialog extends StatelessWidget {
  const PickImageDialog({super.key, required this.onFilePicked});

  final Future<void> Function(File?) onFilePicked;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Padding(
          padding: 20.padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                TransManager.pickImage.tr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              20.spaceY,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.spaceX,
                  PickImageDialogButton(
                    icon: Iconsax.camera,
                    label: TransManager.camera,
                    onTap: () async {
                    await ImagePicker()
                        .pickImage(source: ImageSource.camera, imageQuality: 50)
                        .then((value) {
                      if (value != null) {
                        onFilePicked(File(value.path));
                        Get.back();
                      }
                    });
                  },
                  ),
                  12.spaceX,
                  PickImageDialogButton(
                      icon: Iconsax.gallery,
                      label: TransManager.gallery,
                      onTap: () async {
                    await ImagePicker()
                        .pickImage(source: ImageSource.gallery, imageQuality: 50)
                        .then((value) {
                      if (value != null) {
                        onFilePicked(File(value.path));
                        Get.back();
                      }
                    });
                  }),
                  12.spaceX
                ],
              ),
            ],
          ),
       ),
    );
  }
}

