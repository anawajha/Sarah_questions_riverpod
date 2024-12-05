import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_controller.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(TransManager.appName.tr), actions: [
      GetBuilder<HomeController>(builder: (logic) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 700),
            child: IconButton(
                onPressed: logic.changeTheme,
                icon: Icon(
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Iconsax.sun_15
                        : Iconsax.moon)));
      })
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
