import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:get/get.dart';

class EmailVerificationScreenController extends GetxController {
  TextEditingController emailVerificationCode = TextEditingController();
  RxString emailVerificationCodeString = "".obs;
  RxInt count = 31.obs;

  Future<void> apiCallForGetOtp() async {
    Map<String, dynamic> paras = {"otp": emailVerificationCode.text};
    try {
      await ApiService.makeApiCall("verify-otp", ApiMethodType.post,
          params: paras);

      Get.offAllNamed(AppRouter.passcodeScreen);
    } catch (e) {
      return;
    }
  }

  Future<void> apiCallForGetResendOtp() async {
    Map<String, dynamic> paras = {};
    try {
      await ApiService.makeApiCall("resend-otp", ApiMethodType.post,
          doShowLoader: false, params: paras);
    } catch (e) {
      return;
    }
  }
}
