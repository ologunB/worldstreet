import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/data/pref/app_preferences.dart';
import 'package:ft_worldstreet/views/authentication/faceAuth/face_auth_screen_controller.dart';
import 'package:ft_worldstreet/views/global_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/biometric/biometric_utils.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:ft_worldstreet/utils/images.dart';
import 'package:get/get.dart';

class FaceAuthScreen extends StatefulWidget {
  const FaceAuthScreen({Key? key}) : super(key: key);

  @override
  State<FaceAuthScreen> createState() => _FaceAuthScreenState();
}

class _FaceAuthScreenState extends State<FaceAuthScreen> {
  final faceAuthScreenController =
      Get.put<FaceAuthScreenController>(FaceAuthScreenController());

  // final globalcontroller = Get.find<GlobalController>();
  final globalcontroller = Get.put<GlobalController>(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 50,
            bottom: MediaQuery.of(context).padding.bottom + 50),
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
              "Face authentication",
              style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                  .normal24Bold
                  .textColor(AppColors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Add a face authentication to make your account more secure",
              style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                  .normal14Medium
                  .textColor(AppColors.grey),
            ),
            const Spacer(),
            Center(
              child: Image.asset(
                ImageConstant.faceId,
                height: 100,
              ),
            ),
            const Spacer(),
            CommonAppButton(
              buttonType: ButtonType.enable,
              borderRadius: 10,
              onTap: () async {
                BiometricUtils().doBiometricAuthentication(
                    "Please authenticate to login in the world street",
                    onAuthenticate: () {
                  AppPref().isBioMatricsEnable = true;
                  AppPref().isLogin = true;
                  // Get.offAllNamed(AppRouter.bottombarScreen);
                  (globalcontroller.lastLoginModel.value.forex == "1" &&
                              globalcontroller.lastLoginModel.value.crypto ==
                                  "1" ||
                          globalcontroller.lastLoginModel.value.forex == "0" &&
                              globalcontroller.lastLoginModel.value.crypto ==
                                  "1" ||
                          globalcontroller.lastLoginModel.value.forex == "1" &&
                              globalcontroller.lastLoginModel.value.crypto ==
                                  "0"
                      ? Get.offAllNamed(AppRouter.bottomNavigationBarScreen)
                      : Get.offAllNamed(AppRouter.selectSpaceScreen));
                }, onUnAuthenticate: (val) {});
              },
              text: "Continue With Biometrics",
            ),
          ],
        ),
      ),
    );
  }
}
