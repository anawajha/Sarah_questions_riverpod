import 'package:flutter/material.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class ChangePasswordController extends MainController {
  final formKey = GlobalKey<FormState>();
  final tecCurrentPassword = TextEditingController();
  final tecNewPassword = TextEditingController();
  final tecConfirmNewPassword = TextEditingController();

  bool visibleOldPassword = true;
  bool visibleNewPassword = true;
  bool visibleConfirmPassword = true;

  void changeOldPasswordVisibility() {
    visibleOldPassword = !visibleOldPassword;
    update();
    Future.delayed(const Duration(seconds: 4), (() {
      visibleOldPassword = true;
      update();
    }));
  }

  void changeNewPasswordVisibility() {
    visibleNewPassword = !visibleNewPassword;
    update();
    Future.delayed(const Duration(seconds: 4), (() {
      visibleNewPassword = true;
      update();
    }));
  }

  void changeConfirmPasswordVisibility() {
    visibleConfirmPassword = !visibleConfirmPassword;
    update();
    Future.delayed(const Duration(seconds: 4), (() {
      visibleConfirmPassword = true;
      update();
    }));
  }

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      
    }
  }
}