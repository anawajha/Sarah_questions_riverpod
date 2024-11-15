import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sarahah_questions/app/localization/localization_service.dart';
import 'package:sarahah_questions/app/router/router.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // useInheritedMediaQuery: true,
      // minTextAdapt: true,
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        smartManagement: SmartManagement.keepFactory,
        // home: const SplashScreen(),
        getPages: AppRouter.router.routes,
        themeMode: MyGetUtils().findService(LocalStorageService()).theme.mode,
        theme: AppTheme().light,
        darkTheme: AppTheme().dark,
        translations: LocalizationService(),
        locale: MyGetUtils().findService(LocalStorageService()).language.locale,
        supportedLocales: LocalizationService.allLocales,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        
        initialBinding: BindingsBuilder(() {
              Get.put(MainController() , permanent: true);
            }),
      )
    );
  }
}
