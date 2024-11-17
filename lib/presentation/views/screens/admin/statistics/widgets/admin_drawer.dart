import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
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
          ...List.generate(
            logic.drawerItems.length,
            (index) => index < logic.drawerItems.length -1
                ? ListTile(
                    leading: Icon(logic.drawerItems[index].icon),
                    title: Text(logic.drawerItems[index].text.tr),
                    onTap: logic.drawerItems[index].onTap,
                  )
                : ListTile(
                    iconColor: Theme.of(context).colorScheme.error,
                    textColor: Theme.of(context).colorScheme.error,
                    leading: Icon(Iconsax.login),
                    title: Text(TransManager.logout.tr),
                    onTap: logic.logout,
                  ),
          )
        ],
      );
    });
  }
}
