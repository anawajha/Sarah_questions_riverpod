
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/data/models/drawer_item.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class StatisticsController extends MainController {
  Future<void> logout() async {
    showProgress();
    await auth.signOut().then((r) {
      MyGetUtils().findService(LocalStorageService()).rememberMe = false;
      Get.offAllNamed(Routes.home);
      AppUtils().snackSuccess(body: TransManager.loggedOut.tr);
    }).catchError(
        (e) => AppUtils().snackError(body: TransManager.somethingWentWrong.tr));
    hideProgress();
  }

  int ssi = 0;

  void changeSelectedScreen(int index) {
    ssi = index;
    update();
  }

  final drawerItems = [
    DrawerItemModel(icon: Iconsax.home5, onTap: () {}, text: TransManager.home),
    DrawerItemModel(
        icon: Iconsax.profile_tick5,
        onTap: () {},
        text: TransManager.editProfile),
    DrawerItemModel(
        icon: Iconsax.category5,
        onTap: () {
          Get.back();
          Get.toNamed(Routes.manageCategories);
        },
        text: TransManager.categories),
    DrawerItemModel(
        icon: Iconsax.message_question5,
        onTap: () {
          Get.back();
          Get.toNamed(Routes.manageQuestions);
        },
        text: TransManager.questions),
    DrawerItemModel(
        icon: Iconsax.login, onTap: () {}, text: TransManager.logout),
  ];
}
