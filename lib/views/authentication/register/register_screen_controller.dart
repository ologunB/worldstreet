import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/models/lastlogin_model.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:ft_worldstreet/data/pref/app_preferences.dart';
import 'package:ft_worldstreet/views/global_controller.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  TextEditingController userTypeController = TextEditingController();
  FocusNode userTypeFocusNode = FocusNode();

  TextEditingController emailAddressController = TextEditingController();
  FocusNode emailAddressFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  RxBool showPass = false.obs;
  RxBool showConfirmPass = false.obs;
  RxString passwordString = "".obs;
  RxString confirmPasswordString = "".obs;
  RxString emailString = "".obs;
  String? dropdownValue;
  List<String> userTypeList = ['Staker', 'Trader'];
  final globalController = Get.put<GlobalController>(GlobalController());

  Future<void> apiCallForRegister({String? countryName}) async {
    Map<String, dynamic> paras = {
      "country": countryName,
      "email": emailAddressController.text,
      "password": confirmPasswordController.text,
      "user_type": dropdownValue ?? "",
      "device_token": "device_token",
      "device_os": Platform.operatingSystem,
      "device_os_version": (Platform.isAndroid)
          ? globalController.androidInfo?.version.release ?? ""
          : globalController.iosInfo?.systemVersion ?? "",
      "device_model": (Platform.isAndroid)
          ? globalController.androidInfo?.model ?? ""
          : globalController.iosInfo?.model ?? "",
      "ip_address": globalController.packageInfo?.version
    };
    try {
      final response = await ApiService.makeApiCall(
          "register", ApiMethodType.post,
          params: paras);
      globalController.lastLoginModel.value =
          LastLoginModel.fromJson(response['data']);

      AppPref().token = response["data"]["user_session_token"];
      AppPref().isLogin = true;
      globalController.goNextIfProfileIsNotCompelete(orElse: () {
        Get.offAllNamed(AppRouter.bottomNavigationBarScreen);
      });
      Get.toNamed(
        AppRouter.emailVerificationScreen,
      );
    } catch (e) {
      return;
    }
  }
}
