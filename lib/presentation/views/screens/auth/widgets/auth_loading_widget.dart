import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';

class AuthLoadingWidget extends StatelessWidget {
  const AuthLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 150.paddingV,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.security_safe,
            size: 86,
            color: Theme.of(context).primaryColor,
          ),
          9.spaceY,
          Text(
            TransManager.pleaseWait.tr,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontSize: 15),
          )
        ],
      ),
    );
  }
}
