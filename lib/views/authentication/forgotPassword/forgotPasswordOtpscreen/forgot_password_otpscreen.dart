import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/emailPasswordVerification/email_password_verfication_screen_controller.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/forgotPasswordOtpscreen/forgot_password_otpscreen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  const ForgotPasswordOtpScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
  var formKey = GlobalKey<FormState>();

  final forgotPasswordOTPController =
      Get.put<ForgotPasswordOTPController>(ForgotPasswordOTPController());

  final emailPasswordVerificationScreenController =
      Get.put<EmailPasswordVerificationScreenController>(
          EmailPasswordVerificationScreenController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: GetBuilder<ForgotPasswordOTPController>(
          init: forgotPasswordOTPController,
          builder: (controller) => Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Verify Email",
                  style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                      .normal24Bold
                      .textColor(AppColors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Enter the 4-digit verification code sent to your email ',
                    style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                        .normal14Medium
                        .textColor(AppColors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: emailPasswordVerificationScreenController
                            .emailString.value,
                        style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                            .normal14Medium
                            .textColor(AppColors.skyBlue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Pinput(
                  onChanged: (val) {
                    forgotPasswordOTPController
                        .emailVerificationCodeString.value = val;
                  },
                  closeKeyboardWhenCompleted: true,
                  textInputAction: TextInputAction.done,
                  defaultPinTheme: PinTheme(
                    height: 70,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 1,
                        color: AppColors.skyBlue,
                      ),
                    ),
                  ),
                  onCompleted: (val) {
                    if (kDebugMode) {
                      print("this is otp ======================> $val");
                    }
                  },
                  controller: forgotPasswordOTPController.emailVerificationCode,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  length: 4,
                ),
                const SizedBox(
                  height: 20,
                ),
                forgotPasswordOTPController.count.value == 31
                    ? GestureDetector(
                        onTap: () {
                          if (forgotPasswordOTPController.count.value == 31) {
                            forgotPasswordOTPController.count.value = 30;
                            forgotPasswordOTPController
                                .apiCallForGetResendOtp();

                            forgotPasswordOTPController.update();
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                              if (forgotPasswordOTPController.count.value ==
                                  0) {
                                timer.cancel();
                                forgotPasswordOTPController.count.value = 31;
                              } else {
                                forgotPasswordOTPController.count--;
                              }
                              forgotPasswordOTPController.update();
                            });
                          }
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.email_outlined,
                                color: AppColors.grey),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Resend code",
                              style: const TextStyle(
                                      fontFamily: TxtFontFamily.gilroy)
                                  .normal14Medium
                                  .textColor(AppColors.grey),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        "0:${forgotPasswordOTPController.count.toString().padLeft(2, "0")}",
                        style: const TextStyle()
                            .normal14Medium
                            .textColor(AppColors.black),
                      ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 48,
                ),
                Obx(
                  () => CommonAppButton(
                    buttonType: (forgotPasswordOTPController
                                .emailVerificationCodeString
                                .value
                                .characters
                                .length <=
                            3)
                        ? ButtonType.disable
                        : ButtonType.enable,
                    borderRadius: 10,
                    onTap: () async {
                      forgotPasswordOTPController
                          .apiCallForVerifyForgotPasswordOTP();
                      // Get.toNamed(AppRouter.forgotPasswordScreen);
                      if (formKey.currentState!.validate()) {
                      } else {}
                    },
                    text: "Continue",
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
