import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/components/input_field.dart';
import 'package:ft_worldstreet/views/authentication/register/register_screen_controller.dart';
import 'package:ft_worldstreet/views/authentication/selectCity/select_city_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:ft_worldstreet/utils/images.dart';
import 'package:ft_worldstreet/utils/validator_utils.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  final registerScreenController =
      Get.put<RegisterScreenController>(RegisterScreenController());
  final selectCityScreenController =
      Get.put<SelectCityScreenController>(SelectCityScreenController());

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      "Continue registration",
                      style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                          .normal24Bold
                          .textColor(AppColors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Enter the necessary details",
                      style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                          .normal14Medium
                          .textColor(AppColors.grey),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DropdownButtonFormField(
                      icon: SvgPicture.asset(ImageConstant.arrowDownSvg),
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: AppColors.grey.withOpacity(0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.black),
                        ),
                        hintText: 'User Type',
                        hintStyle: const TextStyle(
                            fontFamily: TxtFontFamily.gilroy,
                            color: AppColors.grey),
                      ),
                      value: registerScreenController.dropdownValue,
                      onChanged: (String? newValue) {
                        registerScreenController.dropdownValue = newValue!;
                        registerScreenController.update();
                      },
                      items: registerScreenController.userTypeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      maxLine: 1,
                      onChange: (val) {
                        registerScreenController.emailString.value = val ?? "";
                      },
                      controller:
                          registerScreenController.emailAddressController,
                      focusNode: registerScreenController.emailAddressFocusNode,
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
                          registerScreenController.passwordString.value =
                              val ?? "";
                        },
                        maxLine: 1,
                        obscureText: !registerScreenController.showPass.value,
                        controller: registerScreenController.passwordController,
                        focusNode: registerScreenController.passwordFocusNode,
                        hint: "Password",
                        textInputAction: TextInputAction.next,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            registerScreenController.showPass.value =
                                !registerScreenController.showPass.value;

                            if (mounted) {
                              setState(() {});
                            }
                          },
                          child: Icon(
                            registerScreenController.showPass.value
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
                      controller: registerScreenController.passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => InputField(
                        onChange: (val) {
                          registerScreenController.confirmPasswordString.value =
                              val ?? "";
                        },
                        maxLine: 1,
                        obscureText:
                            !registerScreenController.showConfirmPass.value,
                        controller:
                            registerScreenController.confirmPasswordController,
                        focusNode:
                            registerScreenController.confirmPasswordFocusNode,
                        hint: "Confirm Password",
                        textInputAction: TextInputAction.done,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            registerScreenController.showConfirmPass.value =
                                !registerScreenController.showConfirmPass.value;

                            if (mounted) {
                              setState(() {});
                            }
                          },
                          child: Icon(
                            registerScreenController.showConfirmPass.value
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Obx(
                      () => CommonAppButton(
                        buttonType: (registerScreenController
                                    .emailString.value.isNotEmpty &&
                                ValidationUtils.validateEmail(
                                    registerScreenController
                                        .emailString.value) &&
                                registerScreenController
                                    .confirmPasswordString.value.isNotEmpty &&
                                (registerScreenController
                                        .confirmPasswordString.value ==
                                    registerScreenController
                                        .passwordString.value))
                            ? ButtonType.enable
                            : ButtonType.disable,
                        borderRadius: 10,
                        onTap: () async {
                          registerScreenController.apiCallForRegister(
                              countryName: selectCityScreenController
                                  .tempCountryModelList[
                                      selectCityScreenController
                                          .isSelectedChoiceIndex.value]
                                  .name
                                  .toString());
                        },
                        text: "Register",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
