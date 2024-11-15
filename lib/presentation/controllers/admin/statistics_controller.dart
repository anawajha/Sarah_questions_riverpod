import 'package:get/get.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class StatisticsController extends MainController {

  Future<void> logout ()async {
    showProgress();
    await auth.signOut().then((r){
      MyGetUtils().findService(LocalStorageService()).rememberMe = false;
      Get.offAllNamed(Routes.home);
      AppUtils().snackSuccess(body: TransManager.loggedOut.tr);
    }).catchError((e)=> AppUtils().snackError(body: TransManager.somethingWentWrong.tr));
    hideProgress();
  }

  int ssi = 0;

  void changeSelectedScreen (int index){
    ssi = index;
    update();
  }

}