
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_image_network.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: 0,
        children: [
          DrawerHeader(       
            child: Column(
              children: [
                AppImageNetwork(shape: BoxShape.circle, width: 80, height: 80,),
                20.spaceY,
                Text(auth.FirebaseAuth.instance.currentUser?.displayName ?? '')
              ],
            ),
          ),
          ListTile(
            leading: Icon(Iconsax.home5),
            title: Text(TransManager.home.tr),
            onTap: (){},
          ),
          if(auth.FirebaseAuth.instance.currentUser != null)... [
            ListTile(
            leading: Icon(Iconsax.profile_tick5),
            title: Text(TransManager.editProfile.tr),
            onTap: (){},
          ),
            ListTile(
            leading: Icon(Iconsax.category5),
            title: Text(TransManager.categories.tr),
            onTap: (){
              Get.back();
              Get.toNamed(Routes.addNewQuestion);
            },
          ),
            ListTile(
            leading: Icon(Iconsax.message_question5),
            title: Text(TransManager.questions.tr),
            onTap: (){
              Get.back();
              Get.toNamed(Routes.manageQuestions);
            },
          ),
            ListTile(
            iconColor: Theme.of(context).colorScheme.error,
            textColor: Theme.of(context).colorScheme.error,
            leading: Icon(Iconsax.login),
            title: Text(TransManager.logout.tr),
            onTap: (){},
          ),
          ] else ...[
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
          ]
        ],
    );
  }
}