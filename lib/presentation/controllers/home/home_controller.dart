import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/config/constance.dart';
import 'package:sarahah_questions/app/utils/shared_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class HomeController extends MainController {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCategories() => firestore
      .collection(Constants().categoriesCollection)
      .orderBy('created_at', descending: true)
      .snapshots();

    void changeTheme(){
      final themeMode = Get.isDarkMode ? ThemeMode.light : ThemeMode.dark;
      Get.changeThemeMode(themeMode);
      lss.theme = SharedUtils().getTheme(theme: themeMode.name);
      update();
    }
}
