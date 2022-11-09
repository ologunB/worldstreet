import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:get/get.dart';

class EmailPasswordVerificationScreenController extends GetxController {
  RxString emailString = "".obs;
  TextEditingController emailAddressController = TextEditingController();
  FocusNode emailAddressFocusNode = FocusNode();

  Future<void> apiCallForForgotPassword() async {
    Map<String, dynamic> paras = {
      "email": emailAddressController.text,
    };
    try {
      await ApiService.makeApiCall("forgot-password", ApiMethodType.post,
          params: paras);

      Get.toNamed(AppRouter.forgotPasswordOtpScreen);
    } catch (e) {
      return;
    }
  }
}
