import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/emailPasswordVerification/email_password_verfication_screen_controller.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/forgotPasswordOtpscreen/forgot_password_otpscreen_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordScreenController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();
  FocusNode newPasswordFocusNode = FocusNode();
  TextEditingController newConfirmPasswordController = TextEditingController();
  FocusNode newConfirmPasswordFocusNode = FocusNode();
  RxBool showConfirmPass = false.obs;
  RxBool showPass = false.obs;

  RxString passwordString = "".obs;
  RxString confirmPasswordString = "".obs;
  final EmailPasswordVerificationScreenController
      emailPasswordVerificationScreenController =
      Get.find<EmailPasswordVerificationScreenController>();
  final ForgotPasswordOTPController forgotPasswordOTPController =
      Get.find<ForgotPasswordOTPController>();

  Future<void> apiCallForForgotPassword() async {
    Map<String, dynamic> paras = {
      "email":
          emailPasswordVerificationScreenController.emailAddressController.text,
      "password": newConfirmPasswordController.text,
      "otp": forgotPasswordOTPController.emailVerificationCode.text
    };
    try {
      await ApiService.makeApiCall("reset-password", ApiMethodType.post,
          params: paras);

      Get.toNamed(AppRouter.loginScreen);
    } catch (e) {
      return;
    }
  }
}
