import 'package:get/get.dart';
import 'package:sarahah_questions/presentation/controllers/admin/add_new_controller.dart';
import 'package:sarahah_questions/presentation/controllers/admin/manage_questions_controller.dart';
import 'package:sarahah_questions/presentation/controllers/auth/login_controller.dart';
import 'package:sarahah_questions/presentation/controllers/general/help_center_controller.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_controller.dart';
import 'package:sarahah_questions/presentation/controllers/home/questions_controller.dart';
import 'package:sarahah_questions/presentation/controllers/settings/settings_controller.dart';



class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> LoginController());
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

class AddNewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> AddNewController());
  }
}
class ManageQuestionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ManageQuestionsController());
  }
}
class QuestionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> QuestionsController());
  }
}