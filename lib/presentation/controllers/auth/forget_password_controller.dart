import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarahah_questions/app/router/routes.dart';

class ForgetPasswordController extends GetxController {

  String? resendCounter;
  int counter = 90;

  void startTimer(){
    counter = 90;
    Timer.periodic(const Duration(seconds: 1), (timer) { 
      counter--;
      resendCounter = "${(counter ~/ 60).toString().padLeft(2,'0')}:${(counter % 60).toString().padLeft(2,'0')}";
      if (counter < 1) {
        timer.cancel();
        resendCounter = null;
        update();
      }
      update();
    });
  }

  void sendCode() {
    Get.toNamed(Routes.verifyCode);
    startTimer();
  }

  void checkCode() {
    Get.toNamed(Routes.resetPassword);
  }

  final emailFormKey = GlobalKey<FormState>();
  final tecEmail = TextEditingController();

  final tecCode1 = TextEditingController();
  final tecCode2 = TextEditingController();
  final tecCode3 = TextEditingController();
  final tecCode4 = TextEditingController();
  final tecCode5 = TextEditingController();
  final tecCode6 = TextEditingController();

  final newPasswordFormKey = GlobalKey<FormState>();
  final tecNewPassword = TextEditingController();
  final tecConfirmNewPassword = TextEditingController();

  bool visiblePassword = true;
  bool visibleConfirmPassword = true;

  void changePasswordVisibility() {
    visiblePassword = !visiblePassword;
    update();
    Future.delayed(const Duration(seconds: 4), (() {
      visiblePassword = true;
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

  void resetPassword() {}

  
}