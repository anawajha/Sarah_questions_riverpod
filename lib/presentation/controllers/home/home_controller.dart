import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/utils/shared_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';
import 'package:sarahah_questions/presentation/views/widgets/app_alert_dialog.dart';

class HomeController extends MainController {
  late Stream<AggregateQuerySnapshot> questionsCount;
  late Stream<AggregateQuerySnapshot> categoriesCount;

  @override
  void onInit() {
    questionsCount = getQuestionsCount();
    categoriesCount = getCategoriesCount();
    getAppStatus();
    super.onInit();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCategories() => firestore
      .collection(Constants().categoriesCollection)
      .orderBy('created_at', descending: true)
      .snapshots();

  void changeTheme() {
    final themeMode = Get.isDarkMode ? ThemeMode.light : ThemeMode.dark;
    Get.changeThemeMode(themeMode);
    lss.theme = SharedUtils().getTheme(theme: themeMode.name);
    update();
  }

  Stream<AggregateQuerySnapshot> getCategoriesCount() => firestore
      .collection(Constants().categoriesCollection)
      .count()
      .get()
      .asStream();

  Stream<AggregateQuerySnapshot> getQuestionsCount() => firestore
      .collection(Constants().questionsCollection)
      .count()
      .get()
      .asStream();

  void getAppStatus() {
    firestore.collection(Constants().appStatusCollection).get().then((res) {
      final data = res.docs.first.data();
      if (!(data['can_run_app'])) {
        Get.dialog(
            AppAlertDialog(
                title: data['title'],
                body: data['message'],
                positiveButtonText: 'حسناً',
                positiveButtonOnPressed: () => SystemNavigator.pop()),
            barrierDismissible: true);
      }
    }).catchError((e) {
      _exitApp();
    });
  }

  void _exitApp() {
    Get.dialog(
        AppAlertDialog(
            title: 'الاتصال مقطوع',
            body: 'أنت غير متصل بالإنترنت، الرجاء الإتصال والمحاولة مرة أُخرى.',
            positiveButtonText: 'حسناً',
            positiveButtonOnPressed: () => SystemNavigator.pop()),
        barrierDismissible: true);
  }
}
