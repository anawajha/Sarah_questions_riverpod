import 'package:get/get.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/domain/entities/language.dart';
import 'package:sarahah_questions/domain/entities/theme.dart';

class SettingsController extends GetxController {

  final LocalStorageService lss = MyGetUtils().findService(LocalStorageService());

  void changeLanguage(AppLanguage lang) async {
  lss.language = lang;
  await Get.updateLocale(lang.locale);
  update();
}

void changeThemeMode(AppTheme theme) {
  lss.theme = theme;
  Get.changeThemeMode(theme.mode);
  update();
}
}