
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        padding: 24.paddingV,
        children: [
          ListTile(
            leading: Icon(Iconsax.call5),
            title: Text(TransManager.contactUs.tr),
            onTap: (){},
          ),
            ListTile(
            leading: Icon(Iconsax.shield_tick5),
            title: Text(TransManager.privacyPolicy.tr),
            onTap: (){},
          ),  ListTile(
            leading: Icon(Iconsax.star5),
            title: Text(TransManager.rateUs.tr),
            onTap: (){},
          ),
           ListTile(
            leading: Icon(Iconsax.mobile),
            title: Text(TransManager.ourApps.tr),
            onTap: (){},
          ),
           ListTile(
            leading: Icon(Iconsax.profile_tick5),
            title: Text(TransManager.adminLogin.tr),
            onTap: ()=> Get.toNamed(Routes.login),
          ),
        ],
      ),
    );
  }
}