import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:sarahah_questions/app/config/constance.dart';

extension DateFormatter on DateTime? {
    String getDateFormatted({String? format, String? langCode}) {
    initializeDateFormatting(Get.locale!.languageCode);
    return DateFormat(format ?? 'dd MMM yyyy', langCode ?? Get.locale?.languageCode)
        .format(this ?? DateTime.now().toLocal());
  }

  String getTimeFormatted({String? langCode}) {
    initializeDateFormatting(langCode);
    return DateFormat('HH:mm a', langCode)
        .format(this ?? DateTime.now().toLocal());
  }

  String getDateWithLaravelFormat() {
    initializeDateFormatting(Constants().englishLangCode);
    return DateFormat('YYYY-MM-DDTHH:mm:ss.sssZ', Constants().englishLangCode)
        .format(this ?? DateTime.now().toLocal());
  }
}