import 'package:flutter/material.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/components/input_field.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/emailPasswordVerification/email_password_verfication_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:ft_worldstreet/utils/validator_utils.dart';
import 'package:get/get.dart';

class EmailPasswordVerificationScreen extends StatefulWidget {
  const EmailPasswordVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailPasswordVerificationScreen> createState() =>
      _EmailPasswordVerificationScreenState();
}

class _EmailPasswordVerificationScreenState
    extends State<EmailPasswordVerificationScreen> {
  var formKey = GlobalKey<FormState>();

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
        backgroundColor: AppColors.white,
        body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 20),
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
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Forgot your password?",
                        style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                            .normal24Bold
                            .textColor(AppColors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Enter your email for the verification process, we "
                        "will send 4 digits code to your email",
                        style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                            .normal14Medium
                            .textColor(AppColors.grey),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InputField(
                        maxLine: 1,
                        onChange: (val) {
                          emailPasswordVerificationScreenController
                              .emailString.value = val ?? "";
                        },
                        controller: emailPasswordVerificationScreenController
                            .emailAddressController,
                        focusNode: emailPasswordVerificationScreenController
                            .emailAddressFocusNode,
                        hint: "Email address",
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Obx(
                        () => CommonAppButton(
                          buttonType: (emailPasswordVerificationScreenController
                                      .emailString.value.isNotEmpty &&
                                  ValidationUtils.validateEmail(
                                      emailPasswordVerificationScreenController
                                          .emailString
                                          .toString()))
                              ? ButtonType.enable
                              : ButtonType.disable,
                          borderRadius: 10,
                          onTap: () async {
                            emailPasswordVerificationScreenController
                                .apiCallForForgotPassword();
                            // if (formKey.currentState!.validate()) {
                            //   Get.toNamed(AppRouter.selectCityScreen);
                            // } else {}
                          },
                          text: "Send",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
