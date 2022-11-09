import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/pref/app_preferences.dart';
import 'package:ft_worldstreet/views/global_controller.dart';

import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final globalController = Get.put<GlobalController>(GlobalController());
  @override
  void onReady() {
    visible.value = true;
    _startApp();
    super.onReady();
  }

  RxBool visible = false.obs;
  void _startApp() async {
    Future.delayed(const Duration(seconds: 2), () async {
      await globalController.apiCallForLastLogin();

      if (AppPref().isLogin) {
        globalController.goNextIfProfileIsNotCompelete(orElse: () {
          Get.offNamed(AppRouter.bottomNavigationBarScreen);
        });
      } else {
        Get.offAndToNamed(AppRouter.onBoardingScreen);
      }
    });
  }
}
