import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:get/get.dart';

class PasscodeScreenController extends GetxController {
  TextEditingController passCodeController = TextEditingController();
  RxString passcodeString = "".obs;

  TextEditingController reEnterPassCodeController = TextEditingController();
  RxString reEnterPasscodeString = "".obs;

  Future<void> apiCallForSetPassword() async {
    Map<String, dynamic> paras = {"passcode": reEnterPassCodeController.text};
    try {
      await ApiService.makeApiCall("set-passcode", ApiMethodType.post,
          params: paras);
      Get.back();

      Get.offNamed(AppRouter.verifyIdentityScreen);
    } catch (e) {
      return;
    }
  }
}
