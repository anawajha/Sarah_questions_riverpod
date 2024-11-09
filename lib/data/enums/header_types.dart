import 'dart:io';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';

enum HeaderTypes {
  basic,
  basicWithAuthorization,
  acceptAllTypes,
  acceptAllTypesWithAuthorization,
  acceptUrlencoded
}

extension NewsLetterTypesExtension on HeaderTypes {
  static final lss = MyGetUtils().findService(LocalStorageService());
  Map<String, dynamic> get header {
    switch (this) {
      case HeaderTypes.basic:
        return {
          'Accept': 'application/json',
          'Accept-Language': lss.language.locale.languageCode,
          'x-app-type': Platform.isAndroid ? 'android' : 'ios',
        };
      case HeaderTypes.basicWithAuthorization:
        return {
          'Accept': 'application/json',
          'Accept-Language': lss.language.locale.languageCode,
          'Authorization':
              'Bearer ${lss.token}',
          'x-app-type': Platform.isAndroid ? 'android' : 'ios',
        };
      case HeaderTypes.acceptAllTypes:
        return {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept-Language': lss.language.locale.languageCode,
          'x-app-type': Platform.isAndroid ? 'android' : 'ios',
        };
      case HeaderTypes.acceptAllTypesWithAuthorization:
        return {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Accept-Language': lss.language.locale.languageCode,
          'Authorization': 'Bearer ${lss.token}',
          'x-app-type': Platform.isAndroid ? 'android' : 'ios',
        };

      case HeaderTypes.acceptUrlencoded:
        return {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept-Language': lss.language.locale.languageCode,
          'Authorization': 'Bearer ${lss.token}',
          'x-app-type': Platform.isAndroid ? 'android' : 'ios',
        };
      default:
        return {};
    }
  }
}
