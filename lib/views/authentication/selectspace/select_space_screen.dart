import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:ft_worldstreet/utils/images.dart';
import 'package:get/get.dart';
import 'select_spaces_screen_controller.dart';

class SelectSpaceScreen extends StatefulWidget {
  const SelectSpaceScreen({Key? key}) : super(key: key);

  @override
  State<SelectSpaceScreen> createState() => _SelectSpaceScreenState();
}

class _SelectSpaceScreenState extends State<SelectSpaceScreen> {
  final selectspaceController =
      Get.put<SelectSpacesScreenController>(SelectSpacesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, bottom: 20, top: 50),
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
              "Select space",
              style: const TextStyle().normal24Bold,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Select the market you want to trade in",
              style: const TextStyle(
                      color: AppColors.grey, fontFamily: TxtFontFamily.gilroy)
                  .normal16,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Stack(children: [
                        GestureDetector(
                          onTap: () {
                            selectspaceController.onpressForex.value =
                                !selectspaceController.onpressForex.value;
                            setState(() {});
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: selectspaceController
                                              .onpressForex.value ==
                                          true
                                      ? Border.all(color: AppColors.white)
                                      : Border.all(color: AppColors.grey),
                                  boxShadow: [
                                    selectspaceController.onpressForex.value ==
                                            true
                                        ? BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          )
                                        : const BoxShadow()
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Image.asset(ImageConstant.forex),
                              )),
                        ),
                        Positioned(
                            top: 2,
                            right: 2,
                            child:
                                selectspaceController.onpressForex.value == true
                                    ? Image.asset(
                                        ImageConstant.tick,
                                        width: 20,
                                        height: 20,
                                      )
                                    : Container())
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Forex",
                        style: TextStyle(
                                color:
                                    selectspaceController.onpressForex.value ==
                                            true
                                        ? AppColors.skyBlue
                                        : AppColors.grey,
                                fontFamily: TxtFontFamily.gilroy)
                            .normal16,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Stack(fit: StackFit.loose, children: [
                        GestureDetector(
                          onTap: () {
                            selectspaceController.onpressCrypto.value =
                                !selectspaceController.onpressCrypto.value;

                            setState(() {});
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: selectspaceController
                                              .onpressCrypto.value ==
                                          true
                                      ? Border.all(color: AppColors.white)
                                      : Border.all(color: AppColors.grey),
                                  boxShadow: [
                                    selectspaceController.onpressCrypto.value ==
                                            true
                                        ? BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          )
                                        : const BoxShadow()
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Image.asset(ImageConstant.crypto),
                              )),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: selectspaceController.onpressCrypto.value ==
                                    true
                                ? Image.asset(
                                    ImageConstant.tick,
                                    width: 20,
                                    height: 20,
                                  )
                                : Container())
                      ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Crypto",
                        style: TextStyle(
                                color:
                                    selectspaceController.onpressCrypto.value ==
                                            true
                                        ? AppColors.skyBlue
                                        : AppColors.grey,
                                fontFamily: TxtFontFamily.gilroy)
                            .normal16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: SizedBox(
                height: 150,
                child: selectspaceController.onpressCrypto.value == true &&
                        selectspaceController.onpressForex.value == true
                    ? const Text("")
                    : selectspaceController.onpressForex.value
                        ? SingleChildScrollView(
                            child: Text(
                              'The Forex Market is the largest financial market in the world. With over 5trillion dollars transacted daily, and traders including governments, banks, and top institutions and investors all around the world, it is one of the most assured means to start building the generational wealth you dream. However, it is not a get rich quick scheme. Hence, as a trader, we recommend you use our Trader’s Table to analyse and plan your trade. As a none trader, we recommend you go over the profile of these top traders and copy-trade the one profitable enough and the one you are most comfortable with.,',
                              style: const TextStyle(
                                      color: AppColors.grey, fontSize: 13)
                                  .normal16w100,
                            ),
                          )
                        : selectspaceController.onpressCrypto.value
                            ? SingleChildScrollView(
                                child: Text(
                                  "From Dec 2021, the number of people transacting with crypto currencies is over 300million. With multiple adoptions globally, by individuals and organizations, and over 30billion dollars trading volume, crypto currency is surely one of the best ways you can become a millionaire.",
                                  style: const TextStyle(
                                          color: AppColors.grey, fontSize: 14)
                                      .normal16w100,
                                ),
                              )
                            : const Text(" "),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Obx(
              () => CommonAppButton(
                buttonType:
                    (selectspaceController.onpressForex.value == false &&
                            selectspaceController.onpressCrypto.value == false)
                        ? ButtonType.disable
                        : ButtonType.enable,
                borderRadius: 10,
                onTap: () async {
                  Get.toNamed(AppRouter.selectSpacesscreen);
                },
                text: "Continue",
              ),
            ),
            // GestureDetector(
            //   onTap: (){
            //     Get.toNamed(AppRouter.selectSpacesscreen);
            //   },
            //   child: Container(
            //     width: 400,
            //     height: 45,
            //     child: Center(
            //       child: Text("Continue",style: TextStyle(color: AppColor.white,fontSize:16),
            //       textAlign: TextAlign.center,),
            //     ),
            //   decoration: BoxDecoration(
            //     color: AppColor.skyBlue,
            //     borderRadius: BorderRadius.all(Radius.circular(10))
            //   ),
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).padding.bottom + 20,
            // ),
          ],
        ),
      ),
    );
  }
}
