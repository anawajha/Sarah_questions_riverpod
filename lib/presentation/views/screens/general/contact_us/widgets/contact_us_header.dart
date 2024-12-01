import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';

class ContactUsHeader extends StatelessWidget {
  const ContactUsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      24.spaceY,
      Icon(Iconsax.headphone5, size: 90, color: Theme.of(context).primaryColor,),
      34.spaceY,
      Text(
        TransManager.youCanContactUs.tr,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor),
      ),
      Text(
        TransManager.throughTheFollowingContact.tr,
        style: Theme.of(context).textTheme.bodyMedium,
      )
    ]);
  }
}
