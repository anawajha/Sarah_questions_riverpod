import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/utils/shared_utils.dart';
import 'package:sarahah_questions/domain/entities/language.dart';
import 'package:sarahah_questions/domain/entities/theme.dart';
import 'package:sarahah_questions/domain/entities/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  theme,
  language,
  userData,
  token,
  // playerId,
  fcmToken,
  rememberMe,
}

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;

  // String get playerId =>
  //     _sharedPreferences?.getString(_Key.playerId.toString()) ?? '';

  // set playerId(String playerId) {
  //   _sharedPreferences?.setString(_Key.playerId.toString(), playerId);
  // }

  set rememberMe(bool rememberMe) {
    _sharedPreferences?.setBool(_Key.rememberMe.toString(), rememberMe);
  }

  bool get rememberMe =>
      _sharedPreferences?.getBool(_Key.rememberMe.toString()) ?? false;

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  bool get isInitialized => _sharedPreferences != null;

  bool get loggedIn => token.isNotEmpty;

  User? get userData {
    String data = _sharedPreferences?.getString(_Key.userData.toString()) ?? '';
    if (data.isEmpty) {
      return null;
    }
    return User.fromJson(jsonDecode(data));
  }

  set userData(User? data) {
    // Logger().e("User data : ${data?.toJson()}");
    _sharedPreferences?.setString(
        _Key.userData.toString(), jsonEncode(data?.toJson()));
    Logger().e(data?.token);
    if (data?.token != null) {
      token = data!.token!;
    }
  }

  String get token =>
      _sharedPreferences?.getString(_Key.token.toString()) ?? '';

  set token(String userToken) {
    _sharedPreferences?.setString(_Key.token.toString(), userToken);
  }

  set language(AppLanguage lang) {
    _sharedPreferences?.setString(
        _Key.language.toString(), lang.locale.languageCode);
  }

  AppLanguage get language => SharedUtils().getLocale(
      langCode: _sharedPreferences?.getString(_Key.language.toString()));

  set theme(AppTheme themeMode) {
    _sharedPreferences?.setString(_Key.theme.toString(), themeMode.mode.name);
  }

  String? get fcmToken =>  _sharedPreferences?.getString(_Key.fcmToken.toString()) ?? ''; 

  set fcmToken(String? token) {
    _sharedPreferences?.setString(_Key.fcmToken.toString(), token ?? '');
  }

  AppTheme get theme => SharedUtils().getTheme(
      theme: _sharedPreferences?.getString(_Key.theme.toString()) ?? '');

  void clearUserPrefs() async {
    await Future.wait([
      // _sharedPreferences!.remove(_Key.playerId.toString()),
      _sharedPreferences!.remove(_Key.rememberMe.toString()),
      _sharedPreferences!.remove(_Key.userData.toString()),
      _sharedPreferences!.remove(_Key.token.toString()),
      _sharedPreferences!.remove(_Key.fcmToken.toString()),
    ]);
  }
}
