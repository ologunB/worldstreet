import 'package:dio/dio.dart';

import '../utils/error_util.dart';
import 'base_api.dart';

class AuthApi extends BaseAPI {
  Future<dynamic> signup(Map<String, dynamic> data) async {
    String url = 'auth/register';
    log(data);
    try {
      final Response<dynamic> res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 201:
          return res.data['message'];
        case 400:
          if (res.data['data']['suggestions'] != null) {
            return res.data['data']['suggestions'];
          }
          throw (res.data['data'] as Map).values.join('\n');
        default:
          throw res.data['message'];
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }

  Future<dynamic> login(Map<String, dynamic> data) async {
    String url = 'auth/login';
    log(data);
    try {
      final Response<dynamic> res = await dio().post<dynamic>(url, data: data);
      log(res.data);
      switch (res.statusCode) {
        case 200:
        // return UserModel.fromJson(res.data['data']);
        default:
          print(res.data);
          throw res.data['message'];
      }
    } catch (e) {
      log(e);
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}
