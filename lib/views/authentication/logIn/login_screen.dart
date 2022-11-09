import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/components/input_field.dart';
import 'login_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:ft_worldstreet/utils/validator_utils.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  final loginScreenController =
      Get.put<LoginScreenController>(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 50,
          ),
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
                        "Welcome Back",
                        style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                            .normal24Bold
                            .textColor(AppColors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Hello here, sign in to continue!",
                        style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                            .normal14Medium
                            .textColor(AppColors.grey),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      InputField(
                        maxLine: 1,
                        onChange: (val) {
                          loginScreenController.userEmailString.value =
                              val ?? "";
                        },
                        controller: loginScreenController.userEmailController,
                        focusNode: loginScreenController.userEmailFocusNode,
                        hint: "Email address",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => InputField(
                          onChange: (val) {
                            loginScreenController.userPasswordString.value =
                                val ?? "";
                          },
                          maxLine: 1,
                          obscureText: !loginScreenController.showPass.value,
                          controller: loginScreenController.passwordController,
                          focusNode: loginScreenController.passwordFocusNode,
                          hint: "Password",
                          textInputAction: TextInputAction.done,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              loginScreenController.showPass.value =
                                  !loginScreenController.showPass.value;

                              if (mounted) {
                                setState(() {});
                              }
                            },
                            child: Icon(
                              loginScreenController.showPass.value
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                              AppRouter.emailPasswordVerificationScreen);
                        },
                        child: Text(
                          "Forgot password?",
                          style:
                              const TextStyle(fontFamily: TxtFontFamily.gilroy)
                                  .normal14Medium
                                  .textColor(AppColors.skyBlue),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Obx(
                        () => CommonAppButton(
                          buttonType: (loginScreenController
                                      .userEmailString.value.isNotEmpty &&
                                  loginScreenController
                                      .userPasswordString.value.isNotEmpty &&
                                  ValidationUtils.validateEmail(
                                      loginScreenController
                                          .userEmailString.value))
                              ? ButtonType.enable
                              : ButtonType.disable,
                          borderRadius: 10,
                          onTap: () async {
                            loginScreenController.apiCallForLogin();
                          },
                          text: "Login",
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //   Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      // const Expanded(
                      //   child: Divider(
                      //       thickness: 0.5,
                      //       endIndent: 10,
                      //       color: AppColor.lightGrey),
                      // ),
                      // Text(
                      //   "Or Login with",
                      //   style: const TextStyle(
                      //           fontFamily: TxtFontFamily.gilroy)
                      //       .normal14Medium
                      //       .textColor(AppColor.grey),
                      // ),
                      // const Expanded(
                      //   child: Divider(
                      //     indent: 10,
                      //     thickness: 0.5,
                      //     color: AppColor.lightGrey,
                      //   ),
                      // ),
                      //     ],
                      // ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      //  Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      // GestureDetector(
                      //   onTap: () async {
                      //     await loginScreenController.signInWithFacebook();
                      //   },
                      //   child: Container(
                      //       height: 55,
                      //       width: 105,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(8),
                      //         border: Border.all(
                      //           color: AppColor.grey.withOpacity(0.2),
                      //         ),
                      //       ),
                      //       child: Center(
                      //         child: Image.asset(
                      //           ImageConstant.fbLogo,
                      //           height: 25,
                      //           width: 25,
                      //         ),
                      //       )),
                      // ),
                      // const SizedBox(
                      //   width: 16,
                      // ),
                      // GestureDetector(
                      //   onTap: () async {
                      //     await loginScreenController.signInWithGoogle();
                      //   },
                      //   child: Container(
                      //     height: 55,
                      //     width: 105,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(8),
                      //       border: Border.all(
                      //         color: AppColor.grey.withOpacity(0.2),
                      //       ),
                      //     ),
                      //     child: Center(
                      //       child: Image.asset(
                      //         ImageConstant.googleLogo,
                      //         height: 25,
                      //         width: 25,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //  ],
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRouter.selectCityScreen);
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Don’t have an account? ',
                              style: const TextStyle(
                                      fontFamily: TxtFontFamily.gilroy)
                                  .normal16w400
                                  .textColor(AppColors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Register Now',
                                  style: const TextStyle(
                                          fontFamily: TxtFontFamily.gilroy)
                                      .normal16w400
                                      .textColor(AppColors.skyBlue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 10,
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
