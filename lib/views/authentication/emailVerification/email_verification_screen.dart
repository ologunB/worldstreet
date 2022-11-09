import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/views/authentication/emailVerification/email_verification_screen_controller.dart';
import 'package:ft_worldstreet/views/authentication/register/register_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  var formKey = GlobalKey<FormState>();

  final emailVerificationScreenController =
      Get.put<EmailVerificationScreenController>(
          EmailVerificationScreenController());
  final registerScreenController =
      Get.put<RegisterScreenController>(RegisterScreenController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: GetBuilder<EmailVerificationScreenController>(
          init: emailVerificationScreenController,
          builder: (controller) => Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        text: registerScreenController.emailString.value,
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
                    emailVerificationScreenController
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
                  controller:
                      emailVerificationScreenController.emailVerificationCode,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  length: 4,
                ),
                const SizedBox(
                  height: 20,
                ),
                emailVerificationScreenController.count.value == 31
                    ? GestureDetector(
                        onTap: () {
                          if (emailVerificationScreenController.count.value ==
                              31) {
                            emailVerificationScreenController.count.value = 30;
                            emailVerificationScreenController
                                .apiCallForGetResendOtp();
                            emailVerificationScreenController.update();
                            Timer.periodic(const Duration(seconds: 1), (timer) {
                              if (emailVerificationScreenController
                                      .count.value ==
                                  0) {
                                timer.cancel();

                                emailVerificationScreenController.count.value =
                                    31;
                              } else {
                                emailVerificationScreenController.count--;
                              }
                              emailVerificationScreenController.update();
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
                        "0:${emailVerificationScreenController.count.toString().padLeft(2, "0")}",
                        style: const TextStyle()
                            .normal14Medium
                            .textColor(AppColors.black),
                      ),
                const SizedBox(
                  height: 48,
                ),
                Obx(
                  () => CommonAppButton(
                    buttonType: (emailVerificationScreenController
                                .emailVerificationCodeString
                                .value
                                .characters
                                .length <=
                            3)
                        ? ButtonType.disable
                        : ButtonType.enable,
                    borderRadius: 10,
                    onTap: () async {
                      emailVerificationScreenController.apiCallForGetOtp();
                      // Get.offAllNamed(AppRouter.bottomNavigationBarScreen);
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
