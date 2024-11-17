import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/views/screens/general/contact_us/widgets/formal_contact_item.dart';
import 'package:sarahah_questions/presentation/views/screens/general/contact_us/widgets/website_contact_item.dart';

class FormalContacts extends StatelessWidget {
  const FormalContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
          58.spaceY,
          FormalContactItem(
            icon: Iconsax.call5,
            label: TransManager.contactNumber.tr,
            value: Constants().phone,
          ),
          30.spaceY,
          FormalContactItem(
            icon: Icons.email_rounded,
            label: TransManager.email.tr,
            value: Constants().email,
          ),
          30.spaceY,
         WebsiteContactItem()
        ]);
  }
}
