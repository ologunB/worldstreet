import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_screen_controller.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/utils/images.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenController =
      Get.put<SplashScreenController>(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        body: Center(
          child: Obx(
            () => AnimatedOpacity(
              opacity: splashScreenController.visible.isTrue ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 3000),
              child: Image.asset(
                ImageConstant.appLogo,
                width: 173,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
