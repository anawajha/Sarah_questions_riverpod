import 'package:get/get.dart';
import 'package:sarahah_questions/presentation/controllers/auth/forget_password_controller.dart';
import 'package:sarahah_questions/presentation/controllers/auth/login_controller.dart';
import 'package:sarahah_questions/presentation/controllers/auth/register_controller.dart';
import 'package:sarahah_questions/presentation/controllers/general/help_center_controller.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_controller.dart';
import 'package:sarahah_questions/presentation/controllers/profile/car_profile_controller.dart';
import 'package:sarahah_questions/presentation/controllers/profile/profile_controller.dart';
import 'package:sarahah_questions/presentation/controllers/settings/change_password_controller.dart';
import 'package:sarahah_questions/presentation/controllers/settings/settings_controller.dart';



class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class CarProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> CarProfileController());
  }
}


class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ProfileController());
  }
}

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ForgetPasswordController());
  }
}

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> LoginController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> RegisterController());
  }
}

class HelpCenterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> HelpCenterController());
  }
}

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> SettingsController());
  }
}

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ChangePasswordController());
  }
}