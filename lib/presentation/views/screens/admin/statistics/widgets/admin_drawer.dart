import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/presentation/controllers/admin/statistics_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_image_network.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatisticsController>(builder: (logic) {
      return NavigationDrawer(
        selectedIndex: logic.ssi,
        onDestinationSelected: logic.changeSelectedScreen,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                AppImageNetwork(shape: BoxShape.circle, width: 80, height: 80),
                20.spaceY,
                Text(auth.FirebaseAuth.instance.currentUser?.displayName ?? '')
              ],
            ),
          ),
          ListTile(
            selected: true,
            leading: Icon(Iconsax.home5),
            title: Text(TransManager.home.tr),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Iconsax.category5),
            title: Text(TransManager.categories.tr),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.manageCategories);
            },
          ),
          ListTile(
            leading: Icon(Iconsax.message_question5),
            title: Text(TransManager.questions.tr),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.manageQuestions);
            },
          ),
          ListTile(
            iconColor: Theme.of(context).colorScheme.error,
            textColor: Theme.of(context).colorScheme.error,
            leading: Icon(Iconsax.login),
            title: Text(TransManager.logout.tr),
            onTap: logic.logout,
          ),
        ],
      );
    });
  }
}
