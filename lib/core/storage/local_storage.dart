import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_model.dart';

class AppCache {
  static String kUserBox = 'userBox';
  static final String tokenKey = 'tokenKeyrgewr';
  static final String passcodeKey = 'passcodeKeyrgewr';
  static final String biometricKey = 'biometricKeygewr';
  static final String userKey = 'userKeyrgewr';
  static final String gridKey = 'gridKeywrrgewr';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(kUserBox);

  static void setUser(User a) {
    _userBox.put(userKey, a.toJson());
  }

  static User? getUser() {
    if (_userBox.get(userKey) == null) return null;
    return User.fromJson(_userBox.get(userKey));
  }

  static void setToken(String a) {
    _userBox.put(tokenKey, a);
  }

  static String? getToken() => _userBox.get(tokenKey);

  static void setPasscode(String a) {
    _userBox.put(passcodeKey, a);
  }

  static String? getPasscode() => _userBox.get(passcodeKey);

  static void hasBiometric(bool a) {
    _userBox.put(biometricKey, a);
  }

  static bool? getBiometric() => _userBox.get(biometricKey);

  static Future<void> clear() async {
    await _userBox.clear();
  }

  static void clean(String key) {
    _userBox.delete(key);
  }
}
