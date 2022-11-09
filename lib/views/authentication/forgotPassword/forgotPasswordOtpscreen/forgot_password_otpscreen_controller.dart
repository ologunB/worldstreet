import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/emailPasswordVerification/email_password_verfication_screen_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordOTPController extends GetxController {
  final EmailPasswordVerificationScreenController
      emailPasswordVerificationScreenController =
      Get.find<EmailPasswordVerificationScreenController>();

  TextEditingController emailVerificationCode = TextEditingController();
  RxString emailVerificationCodeString = "".obs;
  RxInt count = 31.obs;
  Future<void> apiCallForVerifyForgotPasswordOTP() async {
    Map<String, dynamic> paras = {
      "email":
          emailPasswordVerificationScreenController.emailAddressController.text,
      "otp": emailVerificationCode.text,
    };
    try {
      await ApiService.makeApiCall(
          "verify-forgot-password-otp", ApiMethodType.post,
          params: paras);

      Get.toNamed(AppRouter.forgotPasswordScreen);
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
