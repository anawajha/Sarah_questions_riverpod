import 'package:get/get.dart';

import '../localization/trans_manager.dart';

class Validator {
  //create singleton
  static Validator instance = Validator._internal();

  Validator._internal();

  //create validator for email
  String? emailValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value!)) {
      return TransManager.pleaseEnterValidEmail.tr;
    }
    return null;
  }

//create empty validator
  String? emptyValidator(String? value) {
    value == null ? value = '' : value = value;
    if (value.isEmpty) {
      return TransManager.requiredField.tr;
    }
    return null;
  }

  //create validator for password
  String? passwordValidator(String? value) {
    if (emptyValidator(value) != null) {
      return emptyValidator(value);
    } else if (value!.length < 6) {
      return TransManager.passwordMustBeAtLeast6Characters.tr;
    }
    return null;
  }





  String? validateEmail(String? text) {
    if (emptyValidator(text) != null) {
      return emptyValidator(text);
    } else if (!GetUtils.isEmail(text ?? '')) {
      return TransManager.pleaseEnterValidEmail.tr;
    }
    return null;
  }


  String? fileValidator(String? p0) {
    if (emptyValidator(p0) != null) {
      return emptyValidator(p0);
    }
    return null;
  }

  bool isValidatePassword({required String password}) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  static bool hasMatch(String? value, String pattern) {
    // ignore: avoid_bool_literals_in_conditional_expressions
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isPhoneNumber(String s) {
    s.split('-');
    if (s.length > 17 || s.length < 10) {
      return false;
    }
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

}
