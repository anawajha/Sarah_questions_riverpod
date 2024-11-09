import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';

class ResetPasswordSuccessMessage extends StatelessWidget {
  const ResetPasswordSuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 140.paddingV,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Iconsax.shield_tick,
            size: 86.w,
            color: Theme.of(context).primaryColor,
          ),
          14.spaceY,
          Text(
            TransManager.yourNewPasswordHasBeenSetSuccessfully.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 15.sp),
                textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
