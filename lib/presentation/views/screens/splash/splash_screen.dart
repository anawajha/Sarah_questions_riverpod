import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigate(context));
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset(ImageManager().splashBackground, fit: BoxFit.cover, width: Get.width, height: Get.height,),
          // Center(
          //   child: SvgPicture.asset(SvgManager().logo, width : 174.w, height: 68.w),
          // )
        ],
      ),
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
        () => Get.offNamed((FirebaseAuth.instance.currentUser != null || MyGetUtils().findService(LocalStorageService()).rememberMe) ? Routes.statistics : Routes.home);
  }
}