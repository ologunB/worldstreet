// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/data/network/logger/pretty_dio_logger.dart';
import 'package:ft_worldstreet/data/pref/app_preferences.dart';
import 'package:ft_worldstreet/utils/app_loader.dart';
import 'package:ft_worldstreet/utils/app_toast.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart' hide Response;
import 'package:flutter/foundation.dart' as foundation;

bool isInternetAvailable = false;

class ApiMethodType {
  static const String post = "POST";
  static const String patch = "PATCH";
  static const String get = "GET";
  static const String put = "PUT";
  static const String delete = "DELETE";
}

class ApiService {
  static Future makecryptoApiCall() async {
    late Dio dio;
    Response? response;

    //SET BASE URL
    dio = Dio(
      BaseOptions(
        connectTimeout: 60000,
        receiveTimeout: 60000,
      ),
    );
    if (!foundation.kReleaseMode) {
      var logger = PrettyDioLogger(
        maxWidth: 232,
        requestHeader: true,
        requestBody: true,
      );
      dio.interceptors.add(logger);
    }

    response = await dio.get(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false");

    return response.data ?? "";
  }

  static Future makecryptoBinanceCall(endPoint) async {
    late Dio dio;
    Response? response;

    //SET BASE URL
    dio = Dio(
      BaseOptions(
        connectTimeout: 60000,
        receiveTimeout: 60000,
        baseUrl: "https://worldstreet.trade/new_app/api/",
      ),
    );

    //SET TOKEN
    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions option, RequestInterceptorHandler handler) async {
      var customHeaders = {
        'Accept': 'application/json',
        if (AppPref().token.isNotEmpty) 'token': AppPref().token,
      };
      option.headers.addAll(customHeaders);
      handler.next(option);
    }));

    if (!foundation.kReleaseMode) {
      var logger = PrettyDioLogger(
        maxWidth: 232,
        requestHeader: true,
        requestBody: true,
      );
      dio.interceptors.add(logger);
    }

    try {
      response = await dio.get(endPoint);

      return response.data ?? "";
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future makeApiCall(String endPoint, String method,
      {Object? params, bool doShowLoader = true}) async {
    late Dio dio;
    Response? response;

    //SET BASE URL
    dio = Dio(
      BaseOptions(
        connectTimeout: 60000,
        receiveTimeout: 60000,
        // baseUrl: "https://chktechnology.com/world_street/api/"
        baseUrl: "https://worldstreet.trade/new_app/api/",
      ),
    );

    //SET TOKEN
    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions option, RequestInterceptorHandler handler) async {
      var customHeaders = {
        'Accept': 'application/json',
        if (AppPref().token.isNotEmpty) 'token': AppPref().token,
      };
      option.headers.addAll(customHeaders);
      handler.next(option);
    }));

    /// PreDioLogger to print api log in DEBUG mode
    if (!foundation.kReleaseMode) {
      var logger = PrettyDioLogger(
        maxWidth: 232,
        requestHeader: true,
        requestBody: true,
      );
      dio.interceptors.add(logger);
    }

    //CHECK INTERNET AVAILABLE OR NOT
    if (!isInternetAvailable) {
      showErrorToast('Internet not available');
      throw "Internet not available";
    }

    if (doShowLoader) showLoader(isCancelable: false);
    try {
      if (method == ApiMethodType.post) {
        response = await dio.post(endPoint, data: params);
      } else if (method == ApiMethodType.get) {
        response = await dio.get(endPoint);
      } else if (method == ApiMethodType.put) {
        response = await dio.put(endPoint, data: params);
      } else if (method == ApiMethodType.delete) {
        response = await dio.delete(endPoint);
      }
      if (doShowLoader) dismissLoader();
      return response?.data ?? "";
    } on DioError catch (dioError) {
      if (doShowLoader) dismissLoader();
      debugPrint("callApi :: DioError -> $dioError");
      onResponseError(dioError);
      rethrow;
    } catch (error) {
      if (doShowLoader) dismissLoader();
      debugPrint("callApi :: Error -> $error");
      rethrow;
    }
  }

  static onResponseError(onError) {
    debugPrint(
        "onResponseError:onError ${onError.toString()} || ${onError.response.statusCode}");
    if (onError is DioError) {
      switch (onError.response?.statusCode) {
        case 400:

        case 401:
          showAppToast('Login expires. Please re-login with Phone number.');
          AppPref().clear();
          Get.offAndToNamed(AppRouter.loginScreen);
          break;
        case 403:
        case 404:
          break;
        case 406:
          var json = onError.response?.data;
          showErrorSheet(json['message']);
          break;
        case 408:
        case 409:
        case 422:
        case 423:
        case 426:
          break;
        case 500:
          showErrorSheet('Internal Server Error');
          break;
        default:
          break;
      }
    }
  }

  /// to show error
  static void showErrorSheet(String errorText, {Function()? onTap}) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsetsDirectional.only(
            start: 24, end: 24, top: 18, bottom: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Error",
              style: TextStyle(
                color: context.textTheme.titleLarge?.color,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            for (var data in errorText.split(',')) ...{
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 4),
                      child: CircleAvatar(
                          backgroundColor: context.textTheme.titleLarge?.color,
                          radius: 5),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        data.trim().capitalizeFirst ?? "",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: context.textTheme.titleLarge?.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            },
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: CommonAppButton(
                buttonType: ButtonType.enable,
                text: "Okay",
                onTap: onTap ?? () => Get.back(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
