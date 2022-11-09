import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/views/authentication/passcode/passcode_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  var formKey = GlobalKey<FormState>();

  final passcodeScreenController =
      Get.put<PasscodeScreenController>(PasscodeScreenController());

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
          padding: const EdgeInsets.only(left: 24, right: 24, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set pin",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal24Bold
                    .textColor(AppColors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Enter the pass you wish to access your account",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal14Medium
                    .textColor(AppColors.grey),
              ),
              const SizedBox(
                height: 28,
              ),
              Pinput(
                onChanged: (val) {
                  passcodeScreenController.passcodeString.value = val;
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
                    print("this is passcode======================> $val");
                  }
                },
                obscureText: true,
                controller: passcodeScreenController.passCodeController,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                length: 4,
              ),
              const SizedBox(
                height: 56,
              ),
              Obx(
                () => CommonAppButton(
                  buttonType: (passcodeScreenController
                              .passcodeString.value.characters.length <=
                          3)
                      ? ButtonType.disable
                      : ButtonType.enable,
                  borderRadius: 10,
                  onTap: () async {
                    Get.toNamed(AppRouter.reEnterPasscodeScreen);
                  },
                  text: "Continue",
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
