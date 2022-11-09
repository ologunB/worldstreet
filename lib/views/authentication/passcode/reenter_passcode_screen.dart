import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:ft_worldstreet/views/authentication/passcode/passcode_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ReEnterPasscodeScreen extends StatefulWidget {
  const ReEnterPasscodeScreen({Key? key}) : super(key: key);

  @override
  State<ReEnterPasscodeScreen> createState() => _ReEnterPasscodeScreenState();
}

class _ReEnterPasscodeScreenState extends State<ReEnterPasscodeScreen> {
  var formKey = GlobalKey<FormState>();

  final passcodeScreenController = Get.find<PasscodeScreenController>();

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
                "Please Re-enter pin",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal24Bold
                    .textColor(AppColors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Enter passcode again",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal14Medium
                    .textColor(AppColors.grey),
              ),
              const SizedBox(
                height: 28,
              ),
              Pinput(
                onChanged: (val) {
                  passcodeScreenController.reEnterPasscodeString.value = val;
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
                controller: passcodeScreenController.reEnterPassCodeController,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                length: 4,
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
                        passcodeScreenController.passCodeController.text) {
                      passcodeScreenController.apiCallForSetPassword();
                    } else if (passcodeScreenController
                            .reEnterPassCodeController.text !=
                        passcodeScreenController.passCodeController.text) {
                      ApiService.showErrorSheet("Please enter same pin");
                    }
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
