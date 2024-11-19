import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/image_manager.dart';
import 'package:sarahah_questions/app/extensions/num.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigate(context));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
    
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: 20.radius
            ),
                child: Image.asset(ImageManager().logo, width: 100, height: 100,),
              ),
              16.spaceY,
              double.infinity.spaceX,
              Text(TransManager.appName.tr, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600))
        ],
      )
    );
  }

    Future _navigate(BuildContext context) async {
      // Logger().e('User token : ${MyGetUtils().findService(LocalStorageService()).token}');
    SystemChrome.setSystemUIOverlayStyle(
      Theme.of(context).appBarTheme.systemOverlayStyle!
    );
    await Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed( Routes.home));
        () => Get.offNamed((MyGetUtils().findService(LocalStorageService()).rememberMe || FirebaseAuth.instance.currentUser != null) ? Routes.statistics : Routes.home);
  }
}