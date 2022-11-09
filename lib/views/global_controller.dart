import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/common_function.dart';
import 'package:ft_worldstreet/data/models/cryptoasset_modal.dart';
import 'package:ft_worldstreet/data/models/lastlogin_model.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
 import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalController extends GetxController {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  PackageInfo? packageInfo;
  IosDeviceInfo? iosInfo;
  AndroidDeviceInfo? androidInfo;
  String externalIp = '1.1.1.1';
  Dio dio = Dio();
  final _binance = "0.00".obs;
  String get binace => _binance.value;
  Rx<LastLoginModel> lastLoginModel = Rx<LastLoginModel>(LastLoginModel());
  Rx<List<CryptoModal>> cryptoModel = Rx<List<CryptoModal>>(<CryptoModal>[]);

  void updatebinance(String value) {
    _binance.value = value;
  }

  getDeviceIdentifier() async {
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      if (kDebugMode) {
        print("android model ==========> ${androidInfo!.model}");
      }
    } else if (Platform.isIOS) {
      iosInfo = await deviceInfo.iosInfo;
      if (kDebugMode) {
        print("android systemVersion ==========> ${iosInfo!.systemVersion}");
        print("android model ==========> ${iosInfo!.model}");
      }
    }
  }

  getAppVersion() async {
    packageInfo = await PackageInfo.fromPlatform();
    if (kDebugMode) {
      print("packageInfo version ==========> ${packageInfo!.version}");
    }
  }

  getExternalIp() async {
    try {
      var response = await dio.get('https://api.ipify.org/');
      externalIp = response.data;
      if (kDebugMode) {
        print("externalIp ============> $externalIp");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception at ip $e');
      }
    }
  }

  goNextIfProfileIsNotCompelete({required Function orElse}) async {
    if (isNullEmptyOrFalse(lastLoginModel.value.emailVerifiedAt)) {
      // ApiService.makeApiCall("resend-otp", ApiMethodType.post,
      //     params: {}, doShowLoader: false);
      Get.toNamed(AppRouter.emailVerificationScreen);
    } else if (isNullEmptyOrFalse(lastLoginModel.value.country)) {
      Get.toNamed(AppRouter.selectCityScreen);
    } else if (isNullEmptyOrFalse(lastLoginModel.value.passcode)) {
      // Get.toNamed(AppRouter.passcodeScreen);
    } else if (isNullEmptyOrFalse(lastLoginModel.value.verifyDocument)) {
      Get.toNamed(AppRouter.verifyIdentityScreen);
    } else if (lastLoginModel.value.crypto == "0" &&
        lastLoginModel.value.forex == "0") {
      Get.toNamed(AppRouter.selectSpaceScreen);
    } else {
      orElse();
    }

    // else if (!AppPref().isBioMatricsEnable) {
    //   Get.toNamed(AppRouter.faceAuthScreen);
    // }
  }

  Future<void> apiCallForLastLogin() async {
    await getDeviceIdentifier();
    await getAppVersion();
    await getExternalIp();
    Map<String, dynamic> paras = {
      "device_token": "device_token",
      "device_os": Platform.operatingSystem,
      "device_os_version": (Platform.isAndroid)
          ? androidInfo?.version.release ?? ""
          : iosInfo?.systemVersion ?? "",
      "device_model": (Platform.isAndroid)
          ? androidInfo?.model ?? ""
          : iosInfo?.model ?? "",
      "ip_address": packageInfo?.version
    };
    try {
      final response = await ApiService.makeApiCall(
          "last-login", ApiMethodType.post,
          doShowLoader: false, params: paras);

      lastLoginModel.value = LastLoginModel.fromJson(response['data']);
    } catch (e) {
      return;
    }
  }

  @override
  Future<void> onInit() async {
    await getDeviceIdentifier();
    await getAppVersion();
    await getExternalIp();
    super.onInit();
  }
}
