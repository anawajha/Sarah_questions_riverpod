import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class LoginController extends MainController {
  final formKey = GlobalKey<FormState>();
  final tecUsername = TextEditingController();
  final tecPassword = TextEditingController();
  final localService = MyGetUtils().findService(LocalStorageService());

  bool visiblePassword = true;
  bool rememberMe = true;

  void changeRememberMeStatus() {
    rememberMe = !rememberMe;
    update();
  }

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
      Get.offAllNamed(Routes.manageQuestions);
      // try {
      //   showProgress();
      //   final res = await AuthAPI().login(
      //     email: tecUsername.text,
      //     password: tecPassword.text,
      //   );
      //   hideProgress();
      //   res.fold(
      //     (l) {
      //       AppUtils().snackError(body: l.message ?? '');
      //     },
      //     (r) {
      //       if (rememberMe) {
      //         localService.rememberMe = true;
      //       }
      //       localService.userData = r;
      //       Get.offNamed(Routes.home);
      //       cleanLogin();
      //     },
      //   );
      // } catch (e) {
      //   hideProgress();
      //   Logger().e(e.toString());
      // }
    }
  }

  void cleanLogin() {
    tecUsername.clear();
    tecPassword.clear();
    visiblePassword = false;
    rememberMe = true;
  }
}
