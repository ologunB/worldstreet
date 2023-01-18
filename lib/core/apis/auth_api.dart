import 'package:dio/dio.dart';
import 'package:ft_worldstreet/core/models/balances_model.dart';
import 'package:ft_worldstreet/core/models/user_model.dart';
import 'package:ft_worldstreet/core/storage/local_storage.dart';

import '../models/binance_model.dart';
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

  Future<bool> resendEmail(Map<String, dynamic> data) async {
    String url = 'auth/registration/resend-email/';
    log(data);
    try {
      final Response<dynamic> res = await dio().post<dynamic>(url, data: data);
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

  Future<dynamic> verifyEmail(Map<String, dynamic> data) async {
    String url = 'auth/registration/verify-email/';
    log(data);
    try {
      final Response<dynamic> res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          String mes = '';
          if (res.data.first is String) mes = res.data.first;
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

  Future<List<BalanceModel>> getBalances() async {
    String url = 'info/user_balances/';
    try {
      final Response res = await dio().get<dynamic>(url);
      log(res.data);
      log(res.statusCode);
      switch (res.statusCode) {
        case 200:
          if (res.data is! List) throw 'Error getting balances';
          List<BalanceModel> list = [];
          res.data.forEach((a) {
            list.add(BalanceModel.fromJson(a));
          });
          return list;
        default:
          String mes = 'Error getting balances';
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

  Future<bool> reset(String email) async {
    String url = 'auth/password/reset/';
    try {
      final Response res =
          await dio().post<dynamic>(url, data: {'email': email});
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          String mes = '';
          if (res.data.first is String) mes = res.data.first;

          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> confirmReset(Map<String, dynamic> data) async {
    String url = 'auth/password/reset/confirm/';
    log(data);
    try {
      final Response res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          String mes = '';
          if (res.data.first is String) mes = res.data.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<List<User>> getUsersList() async {
    String user_type =
        AppCache.getUser()?.userType == 'Trader' ? 'staker' : 'trader';
    String url = 'accounts?search=$user_type';
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

  Future<List<User>> getTraderList() async {
    String url = 'copy_trade?status=subscribed';
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

  Future<User> getOneTrader(int? id) async {
    String url = 'copy_trade/$id/';
    log(url);
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

  Future<bool> copyTrader(int? id) async {
    String url = 'copy_trade/start/';
    log(url);
    try {
      final Response res =
          await dio().post<dynamic>(url, data: {'watched': id});
      log(res.data);
      switch (res.statusCode) {
        case 201:
          return true;
        default:
          String mes = '';
          if (res.data.first is String) mes = res.data.first;
          throw mes;
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<bool> removeTrader(int? id) async {
    String url = 'copy_trade/$id/';
    log(url);
    try {
      final Response res =
          await dio().patch<dynamic>(url, data: {'status': 'unsubscribed'});
      log(res.data);
      switch (res.statusCode) {
        case 200:
          return true;
        default:
          throw 'An error occurred';
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

  Future<User> updateAccount(String api, secret) async {
    User user = AppCache.getUser()!;
    Map<String, dynamic> data = {'binance_key': api, 'binance_secret': secret};
    String url = 'accounts/${user.id}/';
    print(url);
    print(data);
    try {
      final Response res = await dio().patch<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
          User user = AppCache.getUser()!;
          user.binanceKey = api;
          user.binanceSecret = secret;
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

  Future<List<BinanceModel>> getCoins() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false';
    // log(url);
    try {
      final Response res = await Dio().get<dynamic>(url);
      //  log(res.data);
      switch (res.statusCode) {
        case 200:
          List<BinanceModel> list = [];
          res.data.forEach((a) {
            list.add(BinanceModel.fromJson(a));
          });
          return list;
        default:
          throw 'Unknown Error';
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}
