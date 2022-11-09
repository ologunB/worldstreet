import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/views/authentication/passcode/passcode_screen_controller.dart';
import 'package:ft_worldstreet/views/global_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/biometric/biometric_utils.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyPasscodeScreen extends StatelessWidget {
  VerifyPasscodeScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  final passcodeScreenController =
      Get.put<PasscodeScreenController>(PasscodeScreenController());
  final globalcontroller = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                "Please Enter pin",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal24Bold
                    .textColor(AppColors.black),
              ),
              const SizedBox(
                height: 28,
              ),
              Center(
                child: Pinput(
                  onChanged: (val) {
                    passcodeScreenController.reEnterPasscodeString.value = val;
                  },
                  closeKeyboardWhenCompleted: true,
                  textInputAction: TextInputAction.done,
                  separator: const SizedBox(
                    width: 15,
                  ),
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
                      print("this is passcode======================> $val");
                    }
                  },
                  obscureText: true,
                  controller:
                      passcodeScreenController.reEnterPassCodeController,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  length: 4,
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              Obx(
                () => CommonAppButton(
                  buttonType: (passcodeScreenController
                              .reEnterPasscodeString.value.characters.length <=
                          3)
                      ? ButtonType.disable
                      : ButtonType.enable,
                  borderRadius: 10,
                  onTap: () async {
                    if (passcodeScreenController
                            .reEnterPassCodeController.text ==
                        globalcontroller.lastLoginModel.value.passcode) {
                      Get.offAllNamed(AppRouter.bottomNavigationBarScreen);
                    }
                  },
                  text: "Continue",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "OR",
                  style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                      .normal16
                      .textColor(AppColors.black),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CommonAppButton(
                buttonType: ButtonType.enable,
                borderRadius: 10,
                onTap: () async {
                  BiometricUtils().doBiometricAuthentication(
                      "Please authenticate to login in the world street",
                      onAuthenticate: () {
                    Get.offAllNamed(AppRouter.bottomNavigationBarScreen);
                  }, onUnAuthenticate: (val) {
                    if ((val?.message ?? "") == "cancel") {
                      if (Platform.isAndroid) {
                        exit(0);
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    }
                  });
                },
                text: "Continue With Biometrics",
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
