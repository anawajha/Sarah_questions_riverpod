import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TransManager.appName.tr)),
      drawer: Drawer(
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
          ],
        ),
      ),
    );
  }
}