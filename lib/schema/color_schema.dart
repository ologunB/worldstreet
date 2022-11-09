import 'package:flutter/material.dart';
import 'package:ft_worldstreet/data/pref/app_preferences.dart';
import 'package:get/get.dart';

abstract class AppColors {
  const AppColors._();
  static bool isDarkTheme() {
    return Get.isDarkMode;
  }

  static changeThemeMode() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      AppPref().isDark = false;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      AppPref().isDark = true;
    }
  }

  static Color blackWhiteColor() {
    return isDarkTheme()
        ? DarkTheme.chipSelectedDark
        : LightTheme.chipSelectedDark;
  }

  /* ======================Single Color=================*/

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF070707);
  static const primary = Color(0xFF3C096C);
  static const greyDark1 = Color(0xFF818488);
  static const red = Color(0xFFEB5757);
  static const greenUnread = Color(0xff4ED39D);

  //single color for world street app................
  static const darkBlue = Color(0xff102949);
  static const skyBlue = Color(0xff1389DF);
  static const grey = Color(0xff999999);
  static const lightGrey = Color(0xffE8ECF4);
  static const baground = Color(0xffE5E5E5);
}

class DarkTheme {
  static const chipSelectedDark = Color(0xffFFFFFF);
}

class LightTheme {
  static const chipSelectedDark = Color(0xff000000);
}
