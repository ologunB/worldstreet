import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/components/common_function.dart';
import 'package:ft_worldstreet/components/input_field.dart';
import 'package:ft_worldstreet/views/authentication/selectCity/select_city_screen_controller.dart';
import 'package:ft_worldstreet/views/authentication/verifyIdentity/verify_identity_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({Key? key}) : super(key: key);

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  var formKey = GlobalKey<FormState>();

  final selectCityScreenController =
      Get.put<SelectCityScreenController>(SelectCityScreenController());

  final verifyIdentityScreenController =
      Get.put<VerifyIdentityScreenController>(VerifyIdentityScreenController());
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
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              verifyIdentityScreenController.isSelectCityScreenFrom.value ==
                      true
                  ? Container()
                  : GestureDetector(
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
                "Where do you live?",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal24Bold
                    .textColor(AppColors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Choose the country where you currently reside",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal14Medium
                    .textColor(AppColors.grey),
              ),
              const SizedBox(
                height: 28,
              ),
              InputField(
                onChange: (val) {
                  selectCityScreenController.isSelectedChoiceIndex.value = 0;
                  Throttler(throttleGapInMillis: 500).run(() {
                    selectCityScreenController.searchCountry(
                        searchValue: val ?? "");
                  });
                },
                prefixIcon: const Icon(Icons.search),
                maxLine: 1,
                controller: selectCityScreenController.searchCityController,
                focusNode: selectCityScreenController.searchCityFocusNode,
                hint: "Search country",
                textInputAction: TextInputAction.next,
              ),
              Obx(
                () => isNullEmptyOrFalse(
                        selectCityScreenController.tempCountryModelList)
                    ? const Expanded(
                        child: Center(
                          child: Text("No Country Found !"),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: selectCityScreenController
                                .tempCountryModelList.length,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        selectCityScreenController
                                            .isSelectedChoiceIndex
                                            .value = index;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: selectCityScreenController
                                                      .isSelectedChoiceIndex
                                                      .value ==
                                                  index
                                              ? AppColors.skyBlue
                                              : AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            width: 1,
                                            color: AppColors.lightGrey,
                                          ),
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 16),
                                        width: double.infinity,
                                        height: 72,
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: ClipOval(
                                                  child: Image.asset(
                                                      selectCityScreenController
                                                          .tempCountryModelList[
                                                              index]
                                                          .image,
                                                      height: 40,
                                                      width: 40,
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Text(
                                                selectCityScreenController
                                                    .tempCountryModelList[index]
                                                    .name
                                                    .toString(),
                                                style: const TextStyle(
                                                        fontFamily:
                                                            TxtFontFamily
                                                                .gilroy)
                                                    .normal16w500
                                                    .textColor(
                                                      selectCityScreenController
                                                                  .isSelectedChoiceIndex
                                                                  .value ==
                                                              index
                                                          ? AppColors.white
                                                          : AppColors.grey,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
              ),
              CommonAppButton(
                buttonType: ButtonType.enable,
                borderRadius: 10,
                onTap: () async {
                  // Get.offAllNamed(AppRouter.verifyIdentityScreen, arguments: [
                  //   selectCityScreenController
                  //       .tempCountryModelList[selectCityScreenController
                  //           .isSelectedChoiceIndex.value]
                  //       .name,
                  //   selectCityScreenController
                  //       .tempCountryModelList[selectCityScreenController
                  //           .isSelectedChoiceIndex.value]
                  //       .image
                  // ]);
                  if (verifyIdentityScreenController
                      .isSelectCityScreenFrom.value) {
                    Get.back();
                  } else {
                    Get.toNamed(
                      AppRouter.registerScreen,
                    );
                  }

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => RegisterScreen(
                  //         countryId: selectCityScreenController
                  //             .tempCountryModelList[selectCityScreenController
                  //                 .isSelectedChoiceIndex.value]
                  //             .id
                  //             .toString(),
                  //       ),
                  //     ));
                },
                text: "Continue",
              ),
              const SizedBox(
                height: 54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
