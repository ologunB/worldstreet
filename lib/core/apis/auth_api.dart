import 'package:dio/dio.dart';
import 'package:ft_worldstreet/core/models/user_model.dart';
import 'package:ft_worldstreet/core/storage/local_storage.dart';

import '../utils/error_util.dart';
import 'base_api.dart';

class AuthApi extends BaseAPI {
  Future<User?> signup(Map<String, dynamic> data) async {
    String url = 'auth/registration/';
    log(data);
    try {
      final Response<dynamic> res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 201:
          AppCache.setToken(res.data['key']);
          return getUser();
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<dynamic> resendEmail(Map<String, dynamic> data) async {
    String url = 'auth/registration/resend-email/';
    log(data);
    try {
      final Response<dynamic> res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 201:
          return res.data['key'];
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<dynamic> verifyEmail(Map<String, dynamic> data) async {
    String url = 'auth/registration/verify-email/';
    log(data);
    try {
      final Response<dynamic> res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 201:
          return true;
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<User> login(Map<String, dynamic> data) async {
    String url = 'auth/login/';
    log(data);
    try {
      final Response res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          AppCache.setToken(res.data['key']);
          return getUser();
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<User> getUser() async {
    String url = 'auth/user/';
    try {
      final Response res = await dio().get<dynamic>(url);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          User user = User.fromJson(res.data);
          AppCache.setUser(user);
          return user;
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<User> reset(String email) async {
    String url = 'auth/password/reset/';
    try {
      final Response res =
          await dio().post<dynamic>(url, data: {'email': email});
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return User.fromJson(res.data);
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> confirmReset(Map<String, dynamic> data) async {
    String url = 'auth/password/reset/';
    log(data);

    try {
      final Response res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<List<User>> getList() async {
    String user_type =
        AppCache.getUser()?.userType == 'Trader' ? 'staker' : 'trader';
    String url = 'accounts?user_type=$user_type/';
    log(url);
    try {
      final Response res = await dio().get<dynamic>(url);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          List<User> list = [];
          res.data['results'].forEach((a) {
            list.add(User.fromJson(a));
          });
          return list;
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<User> getOneAccount(int id) async {
    String url = 'accounts/$id/';
    try {
      final Response res = await dio().get<dynamic>(url);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return User.fromJson(res.data);
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<User> updateAccount(String binanceKey) async {
    User user = AppCache.getUser()!;
    Map<String, dynamic> data = {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'user_type': user.userType?.toLowerCase(),
      'binance_key': binanceKey,
    };
    String url = 'accounts/${user.id}/';
    print(url);
    print(data);
    try {
      final Response res = await dio().put<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          User user = AppCache.getUser()!;
          user.binanceKey = binanceKey;
          AppCache.setUser(user);
          return User.fromJson(res.data);
        default:
          String mes = '';
          if (res.data.values.first is List) mes = res.data.values.first.first;
          if (res.data.values.first is String) mes = res.data.values.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}
