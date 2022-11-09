import 'package:flutter/material.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:get/get.dart';

validateTextTitleDescription({String? title, String? middleText}) {
  Get.defaultDialog(
      title: title!,
      middleText: middleText!,
      titleStyle: const TextStyle().bold.textColor(AppColors.black),
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        onPressed: () {
          Get.back();
        },
        child: const Text("Okay"),
      ),
      backgroundColor: Colors.greenAccent);
}
