import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  //region AppPref setup
  Future? _isPreferenceInstanceReady;
  late SharedPreferences _preferences;

  static final AppPref _instance = AppPref._internal();

  factory AppPref() => _instance;

  AppPref._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance()
        .then((preferences) => _preferences = preferences);
  }

  Future? get isPreferenceReady => _isPreferenceInstanceReady;

  //endregion setup

  /// to find login status
  bool get isLogin => _preferences.getBool('isLogin') ?? false;
  set isLogin(bool value) => _preferences.setBool('isLogin', value);
  String get token => _preferences.getString('token') ?? "";
  set token(String value) => _preferences.setString('token', value);
  String get isUserLoginKey => _preferences.getString('isUserLoginKey') ?? "";
  set isUserLoginKey(String value) =>
      _preferences.setString('isUserLoginKey', value);
  String get email => _preferences.getString('email') ?? "";
  set email(String value) => _preferences.setString('email', value);

  //for user id.....
  String get userId => _preferences.getString('userId') ?? "";
  set userId(String value) => _preferences.setString('userId', value);

  //.....for social login.....
  String get id => _preferences.getString('Id') ?? "";
  set id(String value) => _preferences.setString('Id', value);

  /// retrieve app current language
  String get languageCode => _preferences.getString('languageCode') ?? 'en';
  set languageCode(String value) =>
      _preferences.setString('languageCode', value);

  /// retrieve app mode light/dark
  bool get isDark => _preferences.getBool('isDark') ?? false;
  set isDark(bool value) => _preferences.setBool('isDark', value);

  bool get isBioMatricsEnable =>
      _preferences.getBool('isBioMatricsEnable') ?? false;
  set isBioMatricsEnable(bool value) =>
      _preferences.setBool('isBioMatricsEnable', value);

  void clear() async {
    _preferences.clear();
  }
}
