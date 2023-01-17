import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../storage/local_storage.dart';

class BaseAPI {
  Dio dio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://worldstreet-backend.onrender.com/',
        sendTimeout: 50000,
        connectTimeout: 50000,
        receiveTimeout: 50000,
        contentType: 'application/json',
        validateStatus: (int? s) => s! < 500,
        headers: {
          'Authorization': 'Token ${AppCache.getToken()}',
        },
      ),
    );

    return dio;
  }

  log(dynamic data) {
    Logger l = Logger();
    l.d(data);
  }
}

class CustomException implements Exception {
  CustomException(this.message);

  String message;
}
