import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/components/buttons.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';
import 'package:ft_worldstreet/utils/images.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              ImageConstant.splash,
              height: 350,
              width: 350,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Text(
                "Welcome to world of wealth",
                style: const TextStyle(fontFamily: TxtFontFamily.gilroy)
                    .normal24w600,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Meet profitable Traders you can trust, Access the Forex & Crypto Market",
              style: const TextStyle(
                      fontFamily: TxtFontFamily.gilroy, color: AppColors.grey)
                  .normal16w500,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CommonAppButton(
              buttonType: ButtonType.enable,
              borderRadius: 10,
              onTap: () async {
                Get.toNamed(AppRouter.loginScreen);
              },
              text: "Continue",
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
