import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends MainController {
  final formKey = GlobalKey<FormState>();
  final tecEmail = TextEditingController();
  final tecPassword = TextEditingController();
  final localService = MyGetUtils().findService(LocalStorageService());

  bool visiblePassword = true;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    update();
    Future.delayed(const Duration(seconds: 4), (() {
      visiblePassword = true;
      update();
    }));
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      await _preformLogin();
    }
  }

  Future<void> _preformLogin() async {
    try {
      showProgress();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: tecEmail.text, password: tecPassword.text);
      lss.rememberMe = true;
      Get.offAllNamed(Routes.statistics);
      cleanLogin();
    } on FirebaseAuthException catch (e) {
      Logger().e(e.message);
      hideProgress();
      AppUtils().snackError(body: TransManager.wrongEmailOrPassword.tr);
    }
  }

  void cleanLogin() {
    tecEmail.clear();
    tecPassword.clear();
    visiblePassword = false;
  }
}
