import 'package:flutter/material.dart';

import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/components/input_field.dart';
import 'package:ft_worldstreet/views/authentication/selectspace/select_spaces_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:get/get.dart';

class KeySecretScreen extends StatefulWidget {
  const KeySecretScreen({Key? key}) : super(key: key);

  @override
  State<KeySecretScreen> createState() => _KeySecretScreenState();
}

class _KeySecretScreenState extends State<KeySecretScreen> {
  final selectSpacesScreenController = Get.find<SelectSpacesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        selectSpacesScreenController.apiCallForSkipSpaces();
                      },
                      child: Text(
                        "skip",
                        style:
                            const TextStyle(color: AppColors.skyBlue).normal14,
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  selectSpacesScreenController.onpressCrypto.value &&
                          selectSpacesScreenController.onpressForex.value
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Crypto",
                              style: const TextStyle(color: AppColors.skyBlue)
                                  .normal24w600,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                "Login to your Binance account, navigate to API Management to create and copy your API and Secret"),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Crypto Key",
                              style: const TextStyle().normal16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InputField(
                              maxLine: 1,
                              onChange: (val) {},
                              controller:
                                  selectSpacesScreenController.cryptoController,
                              focusNode:
                                  selectSpacesScreenController.cryptoFocusnode,
                              hint: "Enter crypto key",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Crypto Secret",
                              style: const TextStyle().normal16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InputField(
                              maxLine: 1,
                              onChange: (val) {},
                              controller: selectSpacesScreenController
                                  .cryptosecretcontroller,
                              focusNode: selectSpacesScreenController
                                  .cryptosecretFocusNode,
                              hint: "Enter crypto secret",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Forex",
                              style: const TextStyle(color: AppColors.skyBlue)
                                  .normal24w600,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                "Login to your Exness account, navigate to API Management to create and copy your API and Secret"),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Forex Key",
                              style: const TextStyle().normal16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InputField(
                              maxLine: 1,
                              onChange: (val) {},
                              controller: selectSpacesScreenController
                                  .forexkeyController,
                              focusNode: selectSpacesScreenController
                                  .forexkeyFocusNode,
                              hint: "forex key",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Forex Secret",
                              style: const TextStyle().normal16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InputField(
                              maxLine: 1,
                              onChange: (val) {},
                              controller: selectSpacesScreenController
                                  .forexsecretController,
                              focusNode:
                                  selectSpacesScreenController.forexFocusNode,
                              hint: " Enter forex secret",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        )
                      : selectSpacesScreenController.onpressForex.value
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Forex",
                                  style:
                                      const TextStyle(color: AppColors.skyBlue)
                                          .normal24w600,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                    "Login to your Exness account, navigate to API Management to create and copy your API and Secret"),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Forex Key",
                                  style: const TextStyle().normal16,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  maxLine: 1,
                                  onChange: (val) {},
                                  controller: selectSpacesScreenController
                                      .forexkeyController,
                                  focusNode: selectSpacesScreenController
                                      .forexkeyFocusNode,
                                  hint: "forex key",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Forex Secret",
                                  style: const TextStyle().normal16,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  maxLine: 1,
                                  onChange: (val) {},
                                  controller: selectSpacesScreenController
                                      .forexsecretController,
                                  focusNode: selectSpacesScreenController
                                      .forexFocusNode,
                                  hint: " Enter forex secret",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Crypto",
                                  style:
                                      const TextStyle(color: AppColors.skyBlue)
                                          .normal24w600,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                    "Login to your Binance account, navigate to API Management to create and copy your API and Secret"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Crypto Key",
                                  style: const TextStyle().normal16,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InputField(
                                  maxLine: 1,
                                  onChange: (val) {},
                                  controller: selectSpacesScreenController
                                      .cryptoController,
                                  focusNode: selectSpacesScreenController
                                      .forexkeyFocusNode,
                                  hint: "Crypto key",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Crypto Secret",
                                  style: const TextStyle().normal16,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InputField(
                                  maxLine: 1,
                                  onChange: (val) {},
                                  controller: selectSpacesScreenController
                                      .cryptosecretcontroller,
                                  focusNode: selectSpacesScreenController
                                      .forexFocusNode,
                                  hint: " Enter Crypto secret",
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ],
                            ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CommonAppButton(
                buttonType: ButtonType.enable,
                borderRadius: 10,
                onTap: () async {
                  selectSpacesScreenController.apiCallForUpdateSpaces();
                },
                text: "Continue",
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
