import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:intl/intl.dart';

extension GetText on String? {
  String get value => toString().trim();

  num get toNum => num.tryParse(toString().trim()) ?? -1;
}

extension DateConvertor on String? {

  DateTime? getDateTimeFromLaravelTimestamp() =>
     this == null ? null : DateTime.parse(this!).toLocal();

  DateTime parseTime(String t) {
    return DateFormat("HH:mm").parse(t);
  }

  DateTime parseDate(String t) {
    return DateFormat("yyyy/MM/dd").parse(t);
  }

}


extension AppValidator on String? {
  bool get isPassword =>
      toString().trim().length > 7 &&
      GetUtils.hasMatch(this, r'[a-z]') &&
      GetUtils.hasMatch(this, r'[0-9]') &&
      GetUtils.hasCapitalletter(this ?? '');

  bool get isEmail => GetUtils.isEmail(this ?? '');

  bool get isPhoneNumber => GetUtils.isPhoneNumber(this ?? '');

  bool get isUsername => GetUtils.isUsername(this ?? '');

  bool get isEmpty => toString().trim().isEmpty;

  bool get isName => toString().trim().length >= 3;

  bool get isNumber => GetUtils.isNum(toString().trim());

  bool get isUrl => GetUtils.isURL(toString().trim());

  bool get isPositiveNumber => toNum >= 0;
}
