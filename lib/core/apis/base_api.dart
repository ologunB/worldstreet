import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../storage/local_storage.dart';

class BaseAPI {
  Dio dio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://191.101.2.51:8000/',
        sendTimeout: 50000,
        connectTimeout: 50000,
        receiveTimeout: 50000,
        contentType: 'application/json',
        validateStatus: (int? s) => s! < 500,
        headers: {
          if (AppCache.getToken() != null)
            'Authorization': 'Token ${AppCache.getToken()}',
        },
      ),
    );

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

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
