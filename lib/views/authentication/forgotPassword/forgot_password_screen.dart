import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/components/input_field.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/forgot_password_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotPasswordScreenController =
      Get.put<ForgotPasswordScreenController>(ForgotPasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                "Forgot Password",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal24Bold
                    .textColor(AppColors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Enter a new password different from the one you used previously",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal14Medium
                    .textColor(AppColors.grey),
              ),
              const SizedBox(
                height: 28,
              ),
              Obx(
                () => InputField(
                  onChange: (val) {
                    forgotPasswordScreenController.passwordString.value =
                        val ?? "";
                  },
                  maxLine: 1,
                  obscureText: !forgotPasswordScreenController.showPass.value,
                  controller:
                      forgotPasswordScreenController.newPasswordController,
                  focusNode:
                      forgotPasswordScreenController.newPasswordFocusNode,
                  hint: "Enter new password",
                  textInputAction: TextInputAction.next,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      forgotPasswordScreenController.showPass.value =
                          !forgotPasswordScreenController.showPass.value;

                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Icon(
                      forgotPasswordScreenController.showPass.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FlutterPwValidator(
                uppercaseCharCount: 1,
                numericCharCount: 1,
                width: 400,
                height: 103,
                minLength: 8,
                onSuccess: () {},
                controller:
                    forgotPasswordScreenController.newPasswordController,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => InputField(
                  onChange: (val) {
                    forgotPasswordScreenController.confirmPasswordString.value =
                        val ?? "";
                  },
                  maxLine: 1,
                  obscureText:
                      !forgotPasswordScreenController.showConfirmPass.value,
                  controller: forgotPasswordScreenController
                      .newConfirmPasswordController,
                  focusNode: forgotPasswordScreenController
                      .newConfirmPasswordFocusNode,
                  hint: "Confirm Password",
                  textInputAction: TextInputAction.done,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      forgotPasswordScreenController.showConfirmPass.value =
                          !forgotPasswordScreenController.showConfirmPass.value;

                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Icon(
                      forgotPasswordScreenController.showConfirmPass.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                () => CommonAppButton(
                  buttonType: (forgotPasswordScreenController
                              .passwordString.value.isNotEmpty &&
                          (forgotPasswordScreenController
                                  .passwordString.value ==
                              forgotPasswordScreenController
                                  .confirmPasswordString.value))
                      ? ButtonType.enable
                      : ButtonType.disable,
                  borderRadius: 10,
                  onTap: () async {
                    forgotPasswordScreenController.apiCallForForgotPassword();
                  },
                  text: "Reset Password",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
