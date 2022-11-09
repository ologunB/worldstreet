import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:ft_worldstreet/utils/images.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class VerifyIdentityScreenController extends GetxController {
  RxBool isSupported = false.obs;
  RxInt groupValue = 0.obs;
  RxList<VerificationModel> verificationModelList = [
    VerificationModel(
        image: ImageConstant.nationalIdCardLogo,
        verificationType: "National Identity Card",
        selected: 0),
    VerificationModel(
        image: ImageConstant.passportLogo,
        verificationType: "International Passport",
        selected: 1),
    VerificationModel(
        image: ImageConstant.liecenceLogo,
        verificationType: "Driver’s license",
        selected: 2),
  ].obs;

  RxBool isSelectCityScreenFrom = false.obs;

  Future<dynamic> profileApiCall({
    File? verifyDocument1,
    String? verifyMethod1,
    String? verifyCountry1,
  }) async {
    try {
      var formData1 = await formdata(
          verifyCountry: verifyCountry1,
          verifyMethod: verifyMethod1,
          verifyDocument: verifyDocument1);
      await ApiService.makeApiCall("verify-identity", ApiMethodType.post,
          params: formData1);
      Get.toNamed(AppRouter.selectSpaceScreen);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<FormData> formdata({
    File? verifyDocument,
    String? verifyMethod,
    String? verifyCountry,
  }) async {
    FormData data = FormData.fromMap({
      "verify_method": verifyMethod,
      "verify_country": verifyCountry,
      if (verifyDocument != null)
        "verify_document": await MultipartFile.fromFile(
          verifyDocument.path,
        ),
    });
    return data;
  }

// void uploadProfile() async {
//   getImage();
//   dio.FormData formData;
//   var file = File(imagePath![0]);
//   var fileName = file.path.split('/').last;
//
//   formData = dio.FormData.fromMap({
//     "verify_country": "India",
//     "verify_method": "Adhar",
//     "verify_document":
//     await dio.MultipartFile.fromFile(file.path, filename: fileName),
//   });
//
//   var response = await ApiService.makeApiCall(
//       "verify-identity", ApiMethodType.post,
//       params: formData);
// }
}

class VerificationModel {
  String? image = "";
  String? verificationType = "";
  int? selected;
  VerificationModel({this.image, this.verificationType, this.selected});
}
