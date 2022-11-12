import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/views/authentication/selectCity/select_city_screen_controller.dart';
import 'package:ft_worldstreet/views/authentication/verifyIdentity/verify_identity_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VerifyIdentityScreen extends StatefulWidget {
  const VerifyIdentityScreen({Key? key}) : super(key: key);

  @override
  State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
}

class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> {
  final verifyIdentityScreenController =
      Get.put<VerifyIdentityScreenController>(VerifyIdentityScreenController());

  final selectCityScreenController =
      Get.put<SelectCityScreenController>(SelectCityScreenController());
  //
  // final SelectCityScreenController selectCityScreenController =
  //     Get.find<SelectCityScreenController>();
  String? _imagePath;

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
              const EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify identity",
                  style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                      .normal24Bold
                      .textColor(AppColors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Select your document to verify your identity",
                  style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                      .normal14Medium
                      .textColor(AppColors.grey),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Nationality",
                  style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                      .normal16w500
                      .textColor(AppColors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.lightGrey,
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  width: double.infinity,
                  height: 72,
                  child: Obx(() => Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          ClipOval(
                            child: Image.asset(
                                selectCityScreenController
                                    .tempCountryModelList[
                                        selectCityScreenController
                                            .isSelectedChoiceIndex.value]
                                    .image,
                                height: 40,
                                width: 40,
                                fit: BoxFit.fill),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            selectCityScreenController
                                .tempCountryModelList[selectCityScreenController
                                    .isSelectedChoiceIndex.value]
                                .name,
                            style: const TextStyle(
                                    fontFamily: TxtFontFamily.gilroy)
                                .normal16w500
                                .textColor(AppColors.black),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              verifyIdentityScreenController
                                  .isSelectCityScreenFrom.value = true;

                              Get.toNamed(AppRouter.selectCityScreen);
                            },
                            child: Text(
                              "Change",
                              style: const TextStyle(
                                      fontFamily: TxtFontFamily.gilroy)
                                  .normal14Medium
                                  .textColor(AppColors.skyBlue),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Choose verification method",
                  style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                      .normal16w500
                      .textColor(AppColors.black),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: verifyIdentityScreenController
                        .verificationModelList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          verifyIdentityScreenController.groupValue.value =
                              index;
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.lightGrey,
                                blurRadius: 2,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: AppColors.lightGrey,
                            ),
                          ),
                          width: double.infinity,
                          height: 72,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                verifyIdentityScreenController
                                    .verificationModelList[index].image
                                    .toString(),
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                verifyIdentityScreenController
                                    .verificationModelList[index]
                                    .verificationType
                                    .toString(),
                                style: const TextStyle(
                                        fontFamily: TxtFontFamily.gilroy)
                                    .normal16w500
                                    .textColor(AppColors.black),
                              ),
                              const Spacer(),
                              Obx(
                                () => Radio(
                                    value: verifyIdentityScreenController
                                        .verificationModelList[index].selected!,
                                    groupValue: verifyIdentityScreenController
                                        .groupValue.value,
                                    onChanged: (int? index) {
                                      verifyIdentityScreenController
                                          .groupValue.value = index!;
                                      // Get.offNamed(AppRouter.faceAuthScreen);
                                    }),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                // const Spacer(),
                CommonAppButton(
                  buttonType: ButtonType.enable,
                  borderRadius: 10,
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (image == null) return;
                    _imagePath = image.path;

                    await verifyIdentityScreenController.profileApiCall(
                        verifyCountry1: selectCityScreenController
                            .tempCountryModelList[selectCityScreenController
                                .isSelectedChoiceIndex.value]
                            .name
                            .toString(),
                        verifyMethod1:
                            verifyIdentityScreenController.groupValue.value == 0
                                ? "National Identity Card"
                                : verifyIdentityScreenController
                                            .groupValue.value ==
                                        1
                                    ? "International Passport"
                                    : "Driver’s license",
                        verifyDocument1: File(_imagePath ?? ""));
                  },
                  text: "Continue",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
