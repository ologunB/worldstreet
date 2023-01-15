import 'package:hive_flutter/hive_flutter.dart';

class AppCache {
  static String kUserBox = 'userBox';
  static final String tokenKey = 'tokenKeyrgewr';
  static final String userKey = 'userKeyrgewr';
  static final String gridKey = 'gridKeywrrgewr';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(kUserBox);

/*  static void setUser(User a) {
    _userBox.put(userKey, a.toJson());
  }

  static User? getUser() {
    return User.fromJson(_userBox.get(userKey));
  }*/

  static void setToken(String a) {
    _userBox.put(tokenKey, a);
  }

  static String? getToken() {
    return _userBox.get(tokenKey);
  }

  static Future<void> clear() async {
    await _userBox.clear();
  }

  static void clean(String key) {
    _userBox.delete(key);
  }
}
